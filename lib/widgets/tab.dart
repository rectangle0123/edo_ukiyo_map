import 'package:edo_ukiyo_map/widgets/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:edo_ukiyo_map/providers/providers.dart';
import 'package:edo_ukiyo_map/storage/database.dart';

/// シリーズタブ
class SeriesTab extends ConsumerStatefulWidget {

  const SeriesTab({super.key});

  @override
  SeriesTabState createState() => SeriesTabState();
}

class SeriesTabState extends ConsumerState<SeriesTab> with SingleTickerProviderStateMixin {
  /// 影のオフセット
  static const shadowOffset = Offset(0.0, -1.0);
  /// 影のぼかし
  static const shadowBlur = 1.0;

  // タブコントローラー
  late TabController _tabController;
  // シリーズ情報
  late List<(Series, List<Work>)> _series;
  // 読み込み中かどうか
  bool _isLoading = true;

  @override
  void initState() {
    Future(() async {
      // すべてのシリーズとそれに含まれる作品を取得する
      final series = await ref.watch(allSeriesWithWorksProvider.future);
      // タブコントローラーを作成してプロバイダに設定する
      final tabController = TabController(length: series.length, vsync: this);
      tabController.addListener(_handleTabChanged);
      ref.read(tabControllerNotifierProvider.notifier).updateState(tabController);
      // 状態設定
      setState(() {
        _series = series;
        _tabController = tabController;
        _isLoading = false;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // ウィジェットが不要になった際にタブコントローラーを破棄する
    // ホットリロードができなくなったのでコメントアウト
    // final tabController = ref.watch(tabControllerNotifierProvider);
    // tabController?.removeListener(_handleTabChanged);
    // tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // 初期化が終わっていなければ空のコンテナを返す
    if (_isLoading) return Container();

    return TabBar(
      controller: _tabController,
      tabs: _series.map((e) {
        return Tab(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(e.$1.getShortName(context)),
              CircleNumber(
                dimension: 18.0,
                color: Colors.black12,
                margin: const EdgeInsets.only(left: 8.0),
                value: e.$2.length,
                fontSize: 10.0,
              ),
            ],
          ),
        );
      }).toList(),
    );
  }

  // タブ変更イベント
  void _handleTabChanged() {
    if (_tabController.indexIsChanging) {
      // 選択されているシリーズIDを更新する
      ref.read(selectedSeriesIdNotifierProvider.notifier).updateState(_tabController.index + 1);
      // 選択されている作品IDを更新する
      ref.read(selectedWorkIndexNotifierProvider.notifier).updateState(1);
    }
  }
}
