import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/widgets.dart';

import 'package:edo_ukiyo_map/database/database.dart';

void main() async {
  // データベース
  late Database database;

  // 開始処理
  setUp(() {
    WidgetsFlutterBinding.ensureInitialized();
    database = Database.memory;
  });

  // 終了処理
  tearDown(() async {
    await database.close();
  });

  // 初期化のテスト
  test('initialize database', () async {
    await database.initialize();
    final count = await database.getWorksBySeriesId(1);
    expect(count.length, 119);

    final work = await database.getWorkBySeriesIdAndWorkIndex(1, 1);
    expect(work.nameJa, '日本橋雪晴');

    final painters = await database.getPaintersByWorkId(work.id);
    expect(painters[0].hasPortrait, true);

    final series = await database.getAllSeries();
    expect(series.length, 4);
    debugPrint(series[3].descriptionJa);

    final works = await database.getWorksBySeriesId(0);
    expect(works.length, 9);
  });
}
