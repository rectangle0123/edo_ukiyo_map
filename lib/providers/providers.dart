import 'package:carousel_slider/carousel_controller.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:edo_ukiyo_map/providers/notifiers.dart';
import 'package:edo_ukiyo_map/storage/database.dart';

part 'providers.g.dart';

/// 選択されているシリーズIDの状態通知を取得する
final selectedSeriesIdNotifierProvider = StateNotifierProvider<SelectedStateIdNotifier, int>(
      (ref) => SelectedStateIdNotifier(),
);

/// 選択されている作品インデックスの状態通知を取得する
final selectedWorkIndexNotifierProvider = StateNotifierProvider<SelectedWorkIndexNotifier, int>(
      (ref) => SelectedWorkIndexNotifier(),
);

/// お気に入りの状態通知を取得する
final favouritesNotifierProvider = StateNotifierProvider<FavouritesNotifier, List<Work>>(
      (ref) => FavouritesNotifier(),
);

/// Googleマップコントローラーの状態通知を取得する
final mapControllerNotifierProvider = StateNotifierProvider<MapControllerNotifier, GoogleMapController?>(
      (ref) => MapControllerNotifier(),
);

/// Googleマップマーカー画像の状態通知を取得する
final markerImageNotifierProvider = StateNotifierProvider<MarkerImageNotifier, BitmapDescriptor?>(
      (ref) => MarkerImageNotifier(),
);

/// カルーセルコントローラーを取得する
@riverpod
CarouselController carouselController(CarouselControllerRef ref) {
  return CarouselController();
}

/// 出典を取得する
// @riverpod
// Future<Source> sourceById(SourceByIdRef ref, int id) {
//   return Database.instance.getSource(id);
// }

/// シリーズを取得する
// @riverpod
// Future<Series> seriesById(SeriesByIdRef ref, int id) {
//   return Database.instance.getSeries(id);
// }

/// すべてのシリーズを取得する
// @riverpod
// Future<List<Series>> allSeries(AllSeriesRef ref) {
//   return Database.instance.getAllSeries();
// }

/// 絵師を取得する
// @riverpod
// Future<Painter> painterById(PainterByIdRef ref, int id) {
//   return Database.instance.getPainter(id);
// }

/// すべての絵師を取得する
// @riverpod
// Future<List<Painter>> allPainters(AllPaintersRef ref) {
//   return Database.instance.getAllPainters();
// }

/// シリーズから作品を取得する
// @riverpod
// Future<List<Work>> worksBySeries(WorksBySeriesRef ref, Series series) {
//   return Database.instance.getWorksBySeriesId(series.id);
// }

/// 選択されているシリーズに含まれるすべての作品を取得する
@riverpod
Future<List<Work>> currentAllWorks(CurrentAllWorksRef ref) {
  final seriesId = ref.watch(selectedSeriesIdNotifierProvider);
  return Database.instance.getWorksBySeriesId(seriesId);
}

/// 選択されているシリーズと作品インデックスからひとつの作品を取得する
@riverpod
Future<Work> currentSingleWork(CurrentSingleWorkRef ref) {
  final seriesId = ref.watch(selectedSeriesIdNotifierProvider);
  final index = ref.watch(selectedWorkIndexNotifierProvider);
  return Database.instance.getWorkBySeriesIdAndWorkIndex(seriesId, index);
}

/// 選択されているシリーズに含まれるすべての作品と、選択されている作品インデックスからひとつの作品を取得する
@riverpod
Future<(List<Work>, Work)> currentWorksAndWork(CurrentWorksAndWorkRef ref) async {
  final works = await ref.watch(currentAllWorksProvider.future);
  final work = await ref.watch(currentSingleWorkProvider.future);
  return (works, work);
}

/// 作品から絵師を取得する
// @riverpod
// Future<List<Painter>> paintersByWork(PaintersByWorkRef ref, Work work) {
//   return Database.instance.getPaintersByWorkId(work.id);
// }

/// 絵師から作品を取得する
// @riverpod
// Future<List<Work>> worksByPainter(WorksByPainterRef ref, Painter painter) {
//   return Database.instance.getWorksByPainterId(painter.id);
// }

/// 全ての作品を取得する
// @riverpod
// Future<List<Work>> allWorks(AllWorksRef ref) {
//   return Database.instance.getAllWorks();
// }

/// パッケージ情報を取得する
@riverpod
Future<PackageInfo> packageInfo(PackageInfoRef ref) {
  return PackageInfo.fromPlatform();
}

