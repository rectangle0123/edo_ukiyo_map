import 'dart:io';

import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:flutter/material.dart' as f;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;

import 'package:edo_ukiyo_map/utils/csv.dart';

part 'database.g.dart';

@DriftDatabase(tables: [Sources, Serieses, Painters, Works, WorksPainters, Favourites])
class Database extends _$Database {
  /// コンストラクタ（ファイル）
  Database._internal() : super(_openConnection());

  /// コンストラクタ（メモリ）
  Database._memory() : super(NativeDatabase.memory());

  /// シングルトンインスタンス（ファイル）
  static final Database instance = Database._internal();

  /// シングルトンインスタンス（メモリ）
  static final Database memory = Database._memory();

  /// スキーマバージョン
  @override
  int get schemaVersion => 1;

  /// データベース接続
  static LazyDatabase _openConnection() {
    return LazyDatabase(() async {
      final dbFolder = await getApplicationDocumentsDirectory();
      final file = File(p.join(dbFolder.path, 'database.sqlite'));
      return NativeDatabase(file);
    });
  }

  /// 初期化
  Future<void> initialize() async {
    // CSVの読み込み
    final sourcesData = await CsvUtils.read('sources.csv');
    final seriesData = await CsvUtils.read('series.csv');
    final paintersData = await CsvUtils.read('painters.csv');
    final worksData = await CsvUtils.read('works.csv');
    final worksPaintersData = await CsvUtils.read('works-painters.csv');

    // トランザクション処理
    await transaction(() async {
      // マスタデータクリア
      await batch((batch) async {
        batch.deleteAll(worksPainters);
        batch.deleteAll(works);
        batch.deleteAll(painters);
        batch.deleteAll(serieses);
        batch.deleteAll(sources);
      });
      // マスタデータ投入
      await batch((batch) async {
        batch.insertAll(sources, sourcesData.map((data) => SourcesCompanion(
          id: Value(int.parse(data[0])),
          nameJa: Value(data[1]),
          nameEn: Value(data[2]),
          licenseJa: Value(data[3]),
          licenseEn: Value(data[4]),
        )).toList());
      });
      await batch((batch) async {
        batch.insertAll(serieses, seriesData.map((data) => SeriesesCompanion(
          id: Value(int.parse(data[0])),
          sort: Value(int.parse(data[1])),
          nameJa: Value(data[2]),
          nameEn: Value(data[3]),
          shortNameJa: Value(data[4]),
          shortNameEn: Value(data[5]),
          descriptionJa: Value(data[6]),
          descriptionEn: Value(data[7]),
        )).toList());
      });
      await batch((batch) async {
        batch.insertAll(painters, paintersData.map((data) => PaintersCompanion(
          id: Value(int.parse(data[0])),
          sort: Value(int.parse(data[1])),
          nameJa: Value(data[2]),
          nameEn: Value(data[3]),
          shortNameJa: Value(data[4]),
          shortNameEn: Value(data[5]),
          aliasJa: Value(data[6].isEmpty ? null : data[6]),
          aliasEn: Value(data[7].isEmpty ? null : data[7]),
          bornIn: Value(data[8].isEmpty ? null : int.parse(data[8])),
          diedIn: Value(data[9].isEmpty ? null : int.parse(data[9])),
          descriptionJa: Value(data[10].isEmpty ? null : data[10]),
          descriptionEn: Value(data[11].isEmpty ? null : data[11]),
          hasPortrait: Value(bool.parse(data[12])),
        )).toList());
      });
      await batch((batch) async {
        batch.insertAll(works, worksData.map((data) =>  WorksCompanion(
          id: Value(int.parse(data[0])),
          series: Value(int.parse(data[1])),
          index: Value(int.parse(data[2])),
          nameJa: Value(data[3]),
          nameEn: Value(data[4]),
          season: Value(data[5].isEmpty ? null : int.parse(data[5])),
          publishedIn: Value(data[6].isEmpty ? null : int.parse(data[6])),
          latitude: Value(double.parse(data[7])),
          longitude: Value(double.parse(data[8])),
          direction: Value(data[9].isEmpty ? null : double.parse(data[9])),
          source: Value(int.parse(data[10])),
          descriptionJa: Value(data[11]),
          descriptionEn: Value(data[12]),
        )).toList());
      });
      await batch((batch) async {
        batch.insertAll(worksPainters, worksPaintersData.map((data) => WorksPaintersCompanion(
          workId: Value(int.parse(data[0])),
          painterId: Value(int.parse(data[1])),
        )).toList());
      });
    });
  }

  /// 出典を取得する
  Future<Source> getSource(int id) => (select(sources)..where((e) => e.id.equals(id))).getSingle();

  /// シリーズを取得する
  Future<Series> getSeries(int id) => (select(serieses)..where((e) => e.id.equals(id))).getSingle();

  /// すべてのシリーズを取得する
  /// 「該当なし」はとりあえず取得せず、並び順でソートする
  Future<List<Series>> getAllSeries() {
    return (select(serieses)
      ..where((e) => e.id.isBiggerThanValue(0))
      ..orderBy([(e) => OrderingTerm(expression: e.sort)])
    ).get();
  }

  /// 絵師を取得する
  // Future<Painter> getPainter(int id) => (select(painters)..where((e) => e.id.equals(id))).getSingle();

  /// すべての絵師を取得する
  /// 「不祥」はとりあえず取得せず、並び順でソートする
  Future<List<Painter>> getAllPainters() {
    return (select(painters)
      ..where((e) => e.id.isBiggerThanValue(0))
      ..orderBy([(e) => OrderingTerm(expression: e.sort)])
    ).get();
  }

  /// 作品を取得する
  // Future<Work> getWork(int id) => (select(works)..where((e) => e.id.equals(id))).getSingle();

  /// すべての作品を取得する
  // Future<List<Work>> getAllWorks() => select(works).get();

  /// シリーズIDから作品を取得する
  Future<List<Work>> getWorksBySeriesId(int seriesId) {
    return (select(works)..where((tbl) => tbl.series.equals(seriesId))).get();
  }

  /// シリーズIDと作品インデックスから作品を取得する
  Future<Work> getWorkBySeriesIdAndWorkIndex(int seriesId, int index) async {
    return await (select(works)..where((e) => e.series.equals(seriesId) & e.index.equals(index))).getSingle();
  }

  /// 作品IDから絵師を取得する
  Future<List<Painter>> getPaintersByWorkId(int workId) async {
    final query = select(painters).join(
        [innerJoin(worksPainters, worksPainters.painterId.equalsExp(painters.id))]
    )..where(worksPainters.workId.equals(workId));
    final result = await query.get();
    return result.map((e) => e.readTable(painters)).toList();
  }

  /// 絵師IDから作品を取得する
  Future<List<Work>> getWorksByPainterId(int painterId) async {
    final query = select(works).join(
        [innerJoin(worksPainters, worksPainters.workId.equalsExp(works.id))]
    )..where(worksPainters.painterId.equals(painterId));
    final result = await query.get();
    return result.map((e) => e.readTable(works)).toList();
  }

  /// お気に入りの作品を取得する
  Future<List<Work>> getFavourites() async {
    final list = await select(favourites).map((e) => e.workId).get();
    return (select(works)..where((e) => e.id.isIn(list))).get();
  }

  /// お気に入りを登録する
  Future<void> addFavourite(int workId) async {
    into(favourites).insertOnConflictUpdate(FavouritesCompanion(workId: Value(workId)));
  }

  /// お気に入りを削除する
  Future<void> removeFavourite(int workId) async {
    (delete(favourites)..where((tbl) => tbl.workId.equals(workId))).go();
  }
}

/// 出典マスタ
@DataClassName('Source')
class Sources extends Table {
  /// ID
  IntColumn get id => integer()();
  /// 名前（日本語）
  TextColumn get nameJa => text()();
  /// 名前（英語）
  TextColumn get nameEn => text()();
  /// ライセンス（日本語）
  TextColumn get licenseJa => text()();
  /// ライセンス（英語）
  TextColumn get licenseEn => text()();
}

extension SourceExtension on Source {
  /// ロケールの言語に応じた名前を返す
  String getName(f.BuildContext context) {
    return f.Localizations.localeOf(context).languageCode == 'ja' ? nameJa : nameEn;
  }
  /// ロケールの言語に応じたライセンスを返す
  String getLicense(f.BuildContext context) {
    return f.Localizations.localeOf(context).languageCode == 'ja' ? licenseJa : licenseEn;
  }
}

/// シリーズマスタ
@DataClassName('Series')
class Serieses extends Table {
  /// ID
  IntColumn get id => integer()();
  /// ソート
  IntColumn get sort => integer()();
  /// 名前（日本語）
  TextColumn get nameJa => text()();
  /// 名前（英語）
  TextColumn get nameEn => text()();
  /// 短縮名（日本語）
  TextColumn get shortNameJa => text()();
  /// 短縮名（英語）
  TextColumn get shortNameEn => text()();
  /// 解説（日本語）
  TextColumn get descriptionJa => text()();
  /// 解説（英語）
  TextColumn get descriptionEn => text()();
}

extension SeriesExtension on Series {
  /// ロケールの言語に応じた名前を返す
  String getName(f.BuildContext context) {
    return f.Localizations.localeOf(context).languageCode == 'ja' ? nameJa : nameEn;
  }
  /// ロケールの言語に応じた短縮名を返す
  String getShortName(f.BuildContext context) {
    return f.Localizations.localeOf(context).languageCode == 'ja' ? shortNameJa : shortNameEn;
  }
  /// ロケールの言語に応じた解説を返す
  String getDescription(f.BuildContext context) {
    return f.Localizations.localeOf(context).languageCode == 'ja' ? descriptionJa : descriptionEn;
  }
}

/// 絵師マスタ
@DataClassName('Painter')
class Painters extends Table {
  /// ID
  IntColumn get id => integer()();
  /// ソート
  IntColumn get sort => integer()();
  /// 名前（日本語）
  TextColumn get nameJa => text()();
  /// 名前（英語）
  TextColumn get nameEn => text()();
  /// 短縮名（日本語）
  TextColumn get shortNameJa => text()();
  /// 短縮名（英語）
  TextColumn get shortNameEn => text()();
  /// 別名（日本語）
  TextColumn get aliasJa => text().nullable()();
  /// 別名（英語）
  TextColumn get aliasEn => text().nullable()();
  /// 生年
  IntColumn get bornIn => integer().nullable()();
  /// 没年
  IntColumn get diedIn => integer().nullable()();
  /// 解説（日本語）
  TextColumn get descriptionJa => text().nullable()();
  /// 解説（英語）
  TextColumn get descriptionEn => text().nullable()();
  /// 肖像の有無
  BoolColumn get hasPortrait => boolean()();
}

extension PainterExtension on Painter {
  /// ロケールの言語に応じた名前を返す
  String getName(f.BuildContext context) {
    return f.Localizations.localeOf(context).languageCode == 'ja' ? nameJa : nameEn;
  }
  /// ロケールの言語に応じた短縮名を返す
  String getShortName(f.BuildContext context) {
    return f.Localizations.localeOf(context).languageCode == 'ja' ? shortNameJa : shortNameEn;
  }
  /// ロケールの言語に応じた別名を返す
  String? getAlias(f.BuildContext context) {
    return f.Localizations.localeOf(context).languageCode == 'ja' ? aliasJa : aliasEn;
  }
  /// ロケールの言語に応じた解説を返す
  String? getDescription(f.BuildContext context) {
    return f.Localizations.localeOf(context).languageCode == 'ja' ? descriptionJa : descriptionEn;
  }
}

/// 作品マスタ
@DataClassName('Work')
class Works extends Table {
  /// ID
  IntColumn get id => integer()();
  /// シリーズ
  IntColumn get series => integer().references(Serieses, #id)();
  /// 作品インデックス
  IntColumn get index => integer()();
  /// 名前（日本語）
  TextColumn get nameJa => text()();
  /// 名前（英語）
  TextColumn get nameEn => text()();
  /// 季節
  IntColumn get season => integer().nullable()();
  /// 成立年
  IntColumn get publishedIn => integer().nullable()();
  /// 緯度
  RealColumn get latitude => real()();
  /// 経度
  RealColumn get longitude => real()();
  /// 方角
  RealColumn get direction => real().nullable()();
  /// 出典
  IntColumn get source => integer().references(Sources, #id)();
  /// 解説（日本語）
  TextColumn get descriptionJa => text()();
  /// 解説（英語）
  TextColumn get descriptionEn => text()();
}

extension WorkExtension on Work {
  /// ロケールの言語に応じた名前を返す
  String getName(f.BuildContext context) {
    return f.Localizations.localeOf(context).languageCode == 'ja' ? nameJa : nameEn;
  }
  /// ロケールの言語に応じた解説を返す
  String getDescription(f.BuildContext context) {
    return f.Localizations.localeOf(context).languageCode == 'ja' ? descriptionJa : descriptionEn;
  }
}

/// 作品と絵師の中間テーブル
@DataClassName('WorkPainter')
class WorksPainters extends Table {
  IntColumn get workId => integer().customConstraint('REFERENCES works(id) NOT NULL')();
  IntColumn get painterId => integer().customConstraint('REFERENCES painters(id) NOT NULL')();

  @override
  Set<Column> get primaryKey => {workId, painterId};
}

/// お気に入りテーブル
@DataClassName('Favourite')
class Favourites extends Table {
  IntColumn get workId => integer().customConstraint('REFERENCES works(id) NOT NULL')();

  @override
  Set<Column> get primaryKey => {workId};
}
