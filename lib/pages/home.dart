import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:edo_ukiyo_map/providers/providers.dart';
import 'package:edo_ukiyo_map/storage/database.dart';
import 'package:edo_ukiyo_map/widgets/carousel.dart';
import 'package:edo_ukiyo_map/widgets/menu.dart';
import 'package:edo_ukiyo_map/widgets/map.dart';

/// ホーム画面
class HomePage extends ConsumerWidget {
  /// シリーズタブの高さ
  static const tabHeight = 40.0;
  /// 作品カルーセルの高さ
  static const carouselHeight = 240.0;

  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      drawer: const Menu(),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - tabHeight - carouselHeight,
            child: const AppMap(),
          ),
          const Column(
            children: [
              _Header(),
              Spacer(),
              _SeriesTab(height: tabHeight),
              _WorkCarousel(height: carouselHeight),
            ],
          ),
        ],
      ),
    );
  }
}

// シリーズタブ
class _SeriesTab extends ConsumerStatefulWidget {
  /// 高さ
  final double height;

  const _SeriesTab({required this.height});

  @override
  _SeriesTabState createState() => _SeriesTabState();
}

class _SeriesTabState extends ConsumerState<_SeriesTab> with SingleTickerProviderStateMixin {
  /// 影のオフセット
  static const shadowOffset = Offset(0.0, -1.0);
  /// 影のぼかし
  static const shadowBlur = 1.0;

  @override
  void dispose() {
    // ウィジェットが不要になった際にタブコントローラーを破棄する
    final tabController = ref.watch(tabControllerNotifierProvider);
    tabController?.removeListener(_handleTabChanged);
    tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _initialize(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Container(
            height: widget.height,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.2),
                  offset: shadowOffset,
                  blurRadius: shadowBlur,
                ),
              ],
            ),
            child: TabBar(
              controller: ref.watch(tabControllerNotifierProvider),
              tabs: snapshot.data!.map((e) => Tab(text: e.getName(context))).toList(),
            ),
          );
        } else {
          return SizedBox(height: widget.height);
        }
      },
    );
  }

  // 初期化
  Future<List<Series>> _initialize() async {
    // すべてのシリーズを取得する
    final series = await ref.watch(allSeriesProvider.future);
    // タブコントローラーを作成してプロバイダに設定する
    final tabController = TabController(length: series.length, vsync: this);
    tabController.addListener(_handleTabChanged);
    ref.read(tabControllerNotifierProvider.notifier).updateState(tabController);
    // すべてのシリーズを返す
    return series;
  }

  // タブ変更イベント
  void _handleTabChanged() {
    final tabController = ref.read(tabControllerNotifierProvider);
    if (tabController != null) {
      if (tabController.indexIsChanging) {
        // 選択されているシリーズIDを更新する
        ref.read(selectedSeriesIdNotifierProvider.notifier).updateState(tabController.index + 1);
        // 選択されている作品IDを更新する
        ref.read(selectedWorkIndexNotifierProvider.notifier).updateState(1);
      }
    }
  }
}

// 作品カルーセル
class _WorkCarousel extends StatelessWidget {
  /// パディング
  static const padding = 16.0;
  /// 背景色
  static const color = Color(0xfff8fbf8);

  /// 高さ
  final double height;

  const _WorkCarousel({required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.only(
        top: padding,
        bottom: MediaQuery.of(context).padding.bottom,
      ),
      child: const CarouselPanel(),
    );
  }
}

// ヘッダー
class _Header extends StatelessWidget {
  /// パディング
  static const padding = 8.0;

  const _Header();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        left: padding,
        right: padding,
        top: MediaQuery.of(context).padding.top,
      ),
      child: const Row(
        children: [
          MenuButton(),
          Spacer(),
        ],
      ),
    );
  }
}
