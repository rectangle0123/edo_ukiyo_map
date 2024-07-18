import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:edo_ukiyo_map/widgets/carousel.dart';
import 'package:edo_ukiyo_map/widgets/menu.dart';
import 'package:edo_ukiyo_map/widgets/map.dart';
import 'package:edo_ukiyo_map/widgets/tab.dart';

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
              _Footer(tabHeight: tabHeight, carouselHeight: carouselHeight),
            ],
          ),
        ],
      ),
    );
  }
}

// ヘッダー
class _Header extends StatelessWidget {
  // パディング
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

// フッター
class _Footer extends StatelessWidget {
  // パディング
  static const padding = 16.0;
  // 影のオフセット
  static const shadowOffset = Offset(0.0, -1.0);
  // 影のぼかし
  static const shadowBlur = 1.0;

  // シリーズタブの高さ
  final double tabHeight;
  // 作品カルーセルの高さ
  final double carouselHeight;

  const _Footer({required this.tabHeight, required this.carouselHeight});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: tabHeight,
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
          child: const SeriesTab(),
        ),
        Container(
          height: carouselHeight,
          padding: EdgeInsets.only(
            top: padding,
            bottom: MediaQuery.of(context).padding.bottom,
          ),
          child: const WorkCarousel(),
        ),
      ],
    );
  }
}
