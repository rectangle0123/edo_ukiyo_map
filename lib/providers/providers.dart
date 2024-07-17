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

/// 選択されている作品シーケンス番号の状態通知を取得する
final selectedWorkSeqNotifierProvider = StateNotifierProvider<SelectedWorkSeqNotifier, int>(
      (ref) => SelectedWorkSeqNotifier(),
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
Future<Source> sourceById(SourceByIdRef ref, int id) {
  return Database.instance.getSource(id);
}

/// シリーズを取得する
@riverpod
Future<Series> seriesById(SeriesByIdRef ref, int id) {
  return Database.instance.getSeries(id);
}

/// すべてのシリーズを取得する
@riverpod
Future<List<Series>> allSeries(AllSeriesRef ref) {
  return Database.instance.getAllSeries();
}

/// 絵師を取得する
@riverpod
Future<Painter> painterById(PainterByIdRef ref, int id) {
  return Database.instance.getPainter(id);
}

/// すべての絵師を取得する
@riverpod
Future<List<Painter>> allPainters(AllPaintersRef ref) {
  return Database.instance.getAllPainters();
}

/// シリーズから作品を取得する
@riverpod
Future<List<Work>> worksBySeries(WorksBySeriesRef ref, Series series) {
  return Database.instance.getWorksBySeriesId(series.id);
}

/// 選択されているシリーズIDから作品を取得する
@riverpod
Future<List<Work>> worksBySelectedSeriesId(WorksBySelectedSeriesIdRef ref) {
  final selectedSeriesId = ref.watch(selectedSeriesIdNotifierProvider);
  return Database.instance.getWorksBySeriesId(selectedSeriesId);
}

/// 選択されているシリーズIDと作品シーケンス番号から作品を取得する
@riverpod
Future<Work> worksBySelectedSeriesIdAndWorkSeq(WorksBySelectedSeriesIdAndWorkSeqRef ref) {
  final selectedSeriesId = ref.watch(selectedSeriesIdNotifierProvider);
  final selectedSeq = ref.watch(selectedWorkSeqNotifierProvider);
  return Database.instance.getWorkBySeriesIdAndSeq(selectedSeriesId, selectedSeq);
}

/// 作品から絵師を取得する
@riverpod
Future<List<Painter>> paintersByWork(PaintersByWorkRef ref, Work work) {
  return Database.instance.getPaintersByWorkId(work.id);
}

/// 絵師から作品を取得する
@riverpod
Future<List<Work>> worksByPainter(WorksByPainterRef ref, Painter painter) {
  return Database.instance.getWorksByPainterId(painter.id);
}

/// 全ての作品を取得する
@riverpod
Future<List<Work>> allWorks(AllWorksRef ref) {
  return Database.instance.getAllWorks();
}

/// パッケージ情報を取得する
@riverpod
Future<PackageInfo> packageInfo(PackageInfoRef ref) {
  return PackageInfo.fromPlatform();
}

