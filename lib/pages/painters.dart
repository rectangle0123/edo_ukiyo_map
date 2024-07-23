import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:edo_ukiyo_map/database/database.dart';
import 'package:edo_ukiyo_map/pages/painter.dart';
import 'package:edo_ukiyo_map/providers/providers.dart';
import 'package:edo_ukiyo_map/widgets/commons.dart';

/// 絵師一覧画面
class PaintersPage extends ConsumerWidget {
  /// パディング
  static const padding = 16.0;
  /// インジケーターのサイズ
  static const dimension = 16.0;

  const PaintersPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // すべての絵師を取得する
    final painters = ref.watch(allPaintersProvider);

    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(AppLocalizations.of(context)!.page_painters),
        ),
        child: switch (painters) {
          AsyncData(:final value) => Scrollbar(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(padding),
                  child: CupertinoListSection.insetGrouped(
                    margin: EdgeInsets.zero,
                    children: value.map((e) => _ListItem(painter: e)).toList(),
                  ),
                ),
              ),
            ),
          ),
          _ => const SizedBox.expand(
            child: Center(
              child: CupertinoActivityIndicator(radius: dimension),
            ),
          ),
        }
    );
  }
}

// リストアイテム
class _ListItem extends StatelessWidget {
  // 角丸
  static const radius = 2.0;

  // 絵師
  final Painter painter;

  const _ListItem({required this.painter});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      title: Text(painter.getName(context), overflow: TextOverflow.ellipsis),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: painter.hasPortrait
            ? Image.asset('assets/painters/${painter.id}.jpg')
            : Image.asset('assets/painters/0.jpg'),
      ),
      trailing: const CupertinoListTileChevron(),
      additionalInfo: _WorksNumber(painter: painter),
      onTap: () => Navigator.of(context).push(
        MaterialWithModalsPageRoute(
          builder: (_) => PainterPage(painter: painter),
        ),
      ),
    );
  }
}

// 作品数
class _WorksNumber extends ConsumerWidget {
  // 絵師
  final Painter painter;

  const _WorksNumber({required this.painter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 絵師から作品数を取得する
    final works = ref.watch(worksByPainterProvider(painter));

    return switch (works) {
      AsyncData(:final value) => CircleNumber(
        value: value.length,
      ),
      _ => Container(),
    };
  }
}
