import 'package:edo_ukiyo_map/widgets/dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:edo_ukiyo_map/providers/providers.dart';
import 'package:edo_ukiyo_map/utils/location.dart';
import 'package:edo_ukiyo_map/widgets/carousel.dart';
import 'package:edo_ukiyo_map/widgets/commons.dart';
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
              Expanded(
                child: _Header(),
              ),
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
  // マージン
  static const margin = 8.0;

  const _Header();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: MediaQuery.of(context).padding.top),
        Container(
          alignment: Alignment.topLeft,
          margin: const EdgeInsets.only(left: margin),
          child: const MenuButton(),
        ),
        const Spacer(),
        Container(
          alignment: Alignment.topRight,
          margin: const EdgeInsets.all(margin),
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              _HelpButton(),
              SizedBox(width: margin),
              _LocateButton(),
            ],
          ),
        ),
      ],
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

// ヘルプボタン
class _HelpButton extends ConsumerWidget {
  // サイズ
  static const dimension = 40.0;

  const _HelpButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CircleButton(
      dimension: dimension,
      onPressed: () => showDialog(
        context: context,
        builder: (_) => const HelpDialog(),
      ),
      child: const Icon(Icons.question_mark_rounded),
    );
  }
}

// 現在位置ボタン
class _LocateButton extends ConsumerWidget {
  // サイズ
  static const dimension = 40.0;
  // アイコンサイズ
  static const iconSize = 16.0;

  const _LocateButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CircleButton(
      dimension: dimension,
      onPressed: () async {
        final location = await LocationUtils.current();
        if (location != null) {
          ref.watch(mapControllerNotifierProvider)?.animateCamera(
            CameraUpdate.newLatLng(LatLng(location.$1, location.$2))
          );
        }
      },
      child: const ImageIcon(AssetImage('assets/images/gps.png'), size: iconSize),
    );
  }
}
