import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:edo_ukiyo_map/providers/notifiers.dart';
import 'package:edo_ukiyo_map/storage/database.dart';

part 'providers.g.dart';

/// Googleマップコントローラーの状態通知を取得する
final mapControllerNotifierProvider = StateNotifierProvider<MapControllerNotifier, GoogleMapController?>(
      (ref) => MapControllerNotifier(),
);

/// 選択されているシリーズIDの状態通知を取得する
final selectedSeriesIdNotifierProvider = StateNotifierProvider<SelectedStateIdNotifier, int>(
      (ref) => SelectedStateIdNotifier(),
);

/// 選択されている作品IDの状態通知を取得する
final selectedWorkIdNotifierProvider = StateNotifierProvider<SelectedWorkIdNotifier, int>(
      (ref) => SelectedWorkIdNotifier(),
);

/// お気に入りの状態通知を取得する
final favouritesNotifierProvider = StateNotifierProvider<FavouritesNotifier, List<Work>>(
      (ref) => FavouritesNotifier(),
);

/// カルーセルコントローラーを取得する
@riverpod
CarouselController carouselController(CarouselControllerRef ref) {
  return CarouselController();
}

/// 出典を取得する
@riverpod
Future<Source> sourceById(SourceByIdRef ref, int id) async {
  return Database.instance.getSource(id);
}

/// シリーズを取得する
@riverpod
Future<Series> seriesById(SeriesByIdRef ref, int id) async {
  return Database.instance.getSeries(id);
}

/// すべてのシリーズを取得する
@riverpod
Future<List<Series>> allSeries(AllSeriesRef ref) async {
  return Database.instance.getAllSeries();
}

/// 絵師を取得する
@riverpod
Future<Painter> painterById(PainterByIdRef ref, int id) async {
  return Database.instance.getPainter(id);
}

/// すべての絵師を取得する
@riverpod
Future<List<Painter>> allPainters(AllPaintersRef ref) async {
  return Database.instance.getAllPainters();
}

/// シリーズから作品を取得する
@riverpod
Future<List<Work>> worksBySeries(WorksBySeriesRef ref, Series series) async {
  return Database.instance.getWorksBySeriesId(series.id);
}

/// 選択されている作品IDから作品を取得する
@riverpod
Future<Work> selectedWork(SelectedWorkRef ref) async {
  final selectedWorkId = ref.watch(selectedWorkIdNotifierProvider);
  return Database.instance.getWork(selectedWorkId);
}

/// 選択されているシリーズIDから作品を取得する
@riverpod
Future<List<Work>> worksBySelectedSeriesId(WorksBySelectedSeriesIdRef ref) async {
  final selectedSeriesId = ref.watch(selectedSeriesIdNotifierProvider);
  return Database.instance.getWorksBySeriesId(selectedSeriesId);
}

/// 作品から絵師を取得する
@riverpod
Future<List<Painter>> paintersByWork(PaintersByWorkRef ref, Work work) async {
  return Database.instance.getPaintersByWorkId(work.id);
}

/// 絵師から作品を取得する
@riverpod
Future<List<Work>> worksByPainter(WorksByPainterRef ref, Painter painter) async {
  return Database.instance.getWorksByPainterId(painter.id);
}

/// 全ての作品を取得する
@riverpod
Future<List<Work>> allWorks(AllWorksRef ref) async {
  return Database.instance.getAllWorks();
}

/// パッケージ情報を取得する
@riverpod
Future<PackageInfo> packageInfo(PackageInfoRef ref) async {
  return await PackageInfo.fromPlatform();
}

