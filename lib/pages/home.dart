import 'package:flutter/material.dart';

import 'package:edo_ukiyo_map/widgets/carousel.dart';
import 'package:edo_ukiyo_map/widgets/menu.dart';
import 'package:edo_ukiyo_map/widgets/map.dart';

/// ホーム画面
class HomePage extends StatelessWidget {
  /// タブの高さ
  static const tabHeight = 40.0;
  /// カルーセルの高さ
  static const carouselHeight = 240.0;

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
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
              _Tab(height: tabHeight),
              _Carousel(height: carouselHeight),
            ],
          ),
        ],
      ),
    );
  }
}

// タブ
class _Tab extends StatelessWidget {
  /// 影のオフセット
  static const shadowOffset = Offset(0.0, -1.0);
  /// 影のぼかし
  static const shadowBlur = 1.0;

  /// 高さ
  final double height;

  const _Tab({required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
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
    );
  }
}

// カルーセル
class _Carousel extends StatelessWidget {
  /// パディング
  static const padding = 16.0;
  /// 背景色
  static const color = Color(0xfff8fbf8);

  /// 高さ
  final double height;

  const _Carousel({required this.height});

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
