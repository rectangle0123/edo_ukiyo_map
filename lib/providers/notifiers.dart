import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:edo_ukiyo_map/storage/database.dart';

/// 選択されているシリーズIDの状態通知
class SelectedStateIdNotifier extends StateNotifier<int> {
  SelectedStateIdNotifier() : super(1);

  /// 状態更新
  void updateState(int id) {
    state = id;
  }
}

/// 選択されている作品インデックスの状態通知
class SelectedWorkIndexNotifier extends StateNotifier<int> {
  SelectedWorkIndexNotifier() : super(1);

  /// 状態更新
  void updateState(int id) {
    state = id;
  }
}

/// お気に入りの状態通知
class FavouritesNotifier extends StateNotifier<List<Work>> {
  FavouritesNotifier() : super([]) {
    _initialize();
  }

  // 初期化
  Future<void> _initialize() async {
    final works = await Database.instance.getFavourites();
    state = works;
  }

  /// お気に入りに追加する
  void add(Work work) async {
    await Database.instance.addFavourite(work.id);
    state = [...state, work];
  }

  /// お気に入りから削除する
  void remove(Work work) async {
    await Database.instance.removeFavourite(work.id);
    state = state.where((e) => e.id != work.id).toList();
  }
}

/// Googleマップコントローラーの状態通知
class MapControllerNotifier extends StateNotifier<GoogleMapController?> {
  MapControllerNotifier() : super(null);

  /// 状態更新
  void updateState(GoogleMapController controller) {
    state = controller;
  }
}

/// Googleマップマーカー画像の状態通知
class MarkerNotifier extends StateNotifier<(BitmapDescriptor, BitmapDescriptor)?> {
  MarkerNotifier() : super(null);

  /// 状態更新
  void updateState((BitmapDescriptor, BitmapDescriptor) markers) {
    state = markers;
  }
}

