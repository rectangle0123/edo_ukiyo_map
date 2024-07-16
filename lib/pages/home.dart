import 'package:flutter/material.dart';

import 'package:edo_ukiyo_map/widgets/carousel.dart';
import 'package:edo_ukiyo_map/widgets/menu.dart';
import 'package:edo_ukiyo_map/widgets/map.dart';

/// ホーム画面
class HomePage extends StatelessWidget {
  /// フッターの高さ
  static const footerHeight = 240.0;

  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Menu(),
      body: Stack(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height - footerHeight,
            child: const AppMap(),
          ),
          const Column(
            children: [
              _Header(),
              Spacer(),
              _Footer(height: footerHeight),
            ],
          ),
        ],
      ),
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

// フッター
class _Footer extends StatelessWidget {
  /// パディング
  static const padding = 16.0;
  /// 背景色
  static const color = Color(0xfff8fbf8);
  /// 影のオフセット
  static const shadowOffset = Offset(0.0, -1.0);
  /// 影のぼかし
  static const shadowBlur = 1.0;

  /// 高さ
  final double height;

  const _Footer({required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      padding: EdgeInsets.only(
        top: padding,
        bottom: MediaQuery.of(context).padding.bottom,
      ),
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            offset: shadowOffset,
            blurRadius: shadowBlur,
          ),
        ],
      ),
      child: const CarouselPanel(),
    );
  }
}