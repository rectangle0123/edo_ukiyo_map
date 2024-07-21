import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:edo_ukiyo_map/pages/about.dart';
import 'package:edo_ukiyo_map/pages/debug.dart';
import 'package:edo_ukiyo_map/pages/favourites.dart';
import 'package:edo_ukiyo_map/pages/packages.dart';
import 'package:edo_ukiyo_map/pages/painters.dart';
import 'package:edo_ukiyo_map/pages/serieses.dart';
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
                  hasLeading: false,
                  backgroundColor: Theme.of(context).drawerTheme.backgroundColor!,
                  children: [
                    _MenuItem(
                      title: AppLocalizations.of(context)!.page_painters,
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialWithModalsPageRoute(builder: (context) => const PaintersPage()),
                          );
                        }
                    ),
                    _MenuItem(
                        title: AppLocalizations.of(context)!.page_series,
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialWithModalsPageRoute(builder: (context) => const SeriesesPage()),
                          );
                        }
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
                  hasLeading: false,
                  backgroundColor: Theme.of(context).drawerTheme.backgroundColor!,
                  children: [
                    _MenuItem(
                        title: AppLocalizations.of(context)!.page_about,
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(
                            MaterialWithModalsPageRoute(builder: (context) => const AboutPage()),
                          );
                        }
                    ),
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
  static const height = 50.0;
  /// アイコンの上マージン
  static const iconMarginTop = -8.0;

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
  static const width = 32.0;
  // 高さ
  static const height = 18.0;
  // 扇面の色
  static const bodyColor = Color(0xff165e83);
  // 中骨の高さ
  static const honeHeight = 10.0;
  // 中骨の色
  // static const boneColor = Color(0xffe0c38c);
  static const boneColor = Color(0xffb98c46);
  // 中骨の太さ
  static const boneWidth = 2.4;
  // 中骨の影の太さ
  static const shadowWidth = 1.0;

  @override
  void paint(Canvas canvas, Size size) {
    // 扇面
    final p1 = Offset(0.0, size.height - honeHeight - height);
    final p2 = Offset(size.width, size.height - honeHeight - height);
    final p3 = Offset((size.width - width) / 2 + width, size.height - honeHeight);
    final p4 = Offset((size.width - width) / 2, size.height - honeHeight);
    // 中骨
    final p5 = Offset(size.width / 3.5, height);
    final p6 = Offset(size.width / 2, height);
    final p7 = Offset(size.width / 1.4, height);
    final p8 = Offset(size.width / 2, size.height);

    // 中骨を描く
    final bonePaint = Paint()
      ..color = boneColor
      ..strokeWidth = boneWidth
      ..strokeCap = StrokeCap.round
      ..maskFilter = const MaskFilter.blur(BlurStyle.solid, shadowWidth);
    canvas.drawLine(Offset(p4.dx + 2, p4.dy), p8, bonePaint);
    canvas.drawLine(p5, p8, bonePaint);
    canvas.drawLine(p6, p8, bonePaint);
    canvas.drawLine(p7, p8, bonePaint);
    canvas.drawLine(Offset(p3.dx - 2, p3.dy), p8, bonePaint);

    // 扇面を描く
    final shapePaint = Paint()..color = bodyColor;
    final Path path = Path()
      ..moveTo(p1.dx, p1.dy)
      ..quadraticBezierTo(size.width / 2, -(size.height - honeHeight - height), p2.dx, p2.dy)
      ..lineTo(p3.dx, p3.dy)
      ..quadraticBezierTo(size.width / 2, size.height - honeHeight - height, p4.dx, p4.dy)
      ..lineTo(p1.dx, p1.dy);
    canvas.drawShadow(path, Colors.black.withOpacity(0.8), 2.4, false);
    canvas.drawPath(path, shapePaint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
