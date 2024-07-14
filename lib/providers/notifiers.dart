import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:edo_ukiyo_map/storage/database.dart';

/// 選択されている作品の状態通知
class SelectedWorkNotifier extends StateNotifier<Work?> {
  SelectedWorkNotifier() : super(null) {
    _initialize();
  }

  // 初期化
  Future<void> _initialize() async {
    final work = await Database.instance.getWork(1);
    state = work;
  }

  /// 状態更新
  void updateState(Work work) {
    state = work;
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
