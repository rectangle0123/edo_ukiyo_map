import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:edo_ukiyo_map/pages/debug.dart';
import 'package:edo_ukiyo_map/pages/favourites.dart';
import 'package:edo_ukiyo_map/pages/packages.dart';
import 'package:edo_ukiyo_map/providers/providers.dart';

/// メニュー
class Menu extends StatelessWidget {
  /// 角丸
  static const radius = 16.0;

  const Menu({super.key});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.horizontal(right: Radius.circular(radius)),
      child: CupertinoPageScaffold(
        child: Drawer(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CupertinoListSection(
                  backgroundColor: Theme.of(context).drawerTheme.backgroundColor!,
                  children: [
                    _MenuItem(
                      title: AppLocalizations.of(context)!.page_home,
                      onTap: () => Navigator.of(context).pop(),
                    ),
                  ],
                ),
                CupertinoListSection(
                  backgroundColor: Theme.of(context).drawerTheme.backgroundColor!,
                  children: [
                    _MenuItem(
                      title: AppLocalizations.of(context)!.page_favourites,
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                          MaterialWithModalsPageRoute(builder: (context) => const FavouritesPage()),
                        );
                      }
                    ),
                  ],
                ),
                CupertinoListSection(
                  backgroundColor: Theme.of(context).drawerTheme.backgroundColor!,
                  children: [
                    _MenuItem(
                      title: AppLocalizations.of(context)!.page_licenses,
                      onTap: () {
                        Navigator.of(context).pop();
                        Navigator.of(context).push(
                          MaterialWithModalsPageRoute(builder: (context) => const PackagesPage()),
                        );
                      }
                    ),
                  ],
                ),
                // デバッグページ
                if (!kReleaseMode)
                  CupertinoListSection(
                    backgroundColor: Theme.of(context).drawerTheme.backgroundColor!,
                    children: [
                      _MenuItem(
                        title: AppLocalizations.of(context)!.page_debug,
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialWithModalsPageRoute(builder: (context) => const DebugPage()),
                          );
                        }
                      ),
                    ],
                  ),
                const Spacer(),
                // バージョン番号
                _Version(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// メニューアイテム
class _MenuItem extends StatelessWidget {
  // タイトル
  final String title;
  // タップイベント
  final VoidCallback onTap;

  const _MenuItem({required this.title, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile(
      title: Text(title),
      trailing: const CupertinoListTileChevron(),
      onTap: onTap,
    );
  }
}

// バージョン番号
class _Version extends ConsumerWidget {
  // 左側のマージン
  static const margin = 16.0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // パッケージ情報を取得する
    final packageInfo = ref.watch(packageInfoProvider);

    return Container(
      margin: const EdgeInsets.only(left: margin),
      child: switch (packageInfo) {
        AsyncData(:final value) => Text('version: ${value.version}'),
        _ => null,
      },
    );
  }
}

/// メニューボタン
class MenuButton extends StatelessWidget {
  /// 幅
  static const width = 80.0;
  /// 高さ
  static const height = 40.0;
  /// アイコンの上マージン
  static const iconMarginTop = -3.0;

  const MenuButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Scaffold.of(context).isDrawerOpen
            ? Navigator.of(context).pop()
            : Scaffold.of(context).openDrawer();
      },
      child: CustomPaint(
        painter: _MenuButtonPainter(),
        child: SizedBox(
          width: width,
          height: height,
          child: Transform.translate(
            offset: const Offset(0, iconMarginTop),
            child: const Icon(Icons.menu, color: Colors.white),
          ),
        ),
      ),
    );
  }
}

// メニューボタン描画
class _MenuButtonPainter extends CustomPainter {
  // 幅
  static const width = 40.0;
  // 高さ
  static const height = 20.0;
  // 色
  static const color = Color(0xff165e83);
  // 枠線の色
  // static const borderColor = Colors.grey;
  // 枠線の太さ
  // static const borderWidth = 1.0;

  @override
  void paint(Canvas canvas, Size size) {
    final Path path = Path()
      ..moveTo(0.0, size.height - height)
      ..quadraticBezierTo(size.width / 2, -(size.height - height), size.width, size.height - height)
      ..lineTo((size.width - width) / 2 + width, size.height)
      ..quadraticBezierTo(size.width / 2, size.height - height, (size.width - width) / 2, size.height)
      ..lineTo(0.0, size.height - height);

    final shapePaint = Paint()..color = color;
    // final borderPaint = Paint()..color = borderColor..style = PaintingStyle.stroke..strokeWidth = borderWidth;

    canvas.drawShadow(path, Colors.black.withOpacity(0.8), 2.4, false);
    canvas.drawPath(path, shapePaint);
    // canvas.drawPath(path, borderPaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
