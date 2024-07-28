import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:edo_ukiyo_map/database/database.dart';
import 'package:edo_ukiyo_map/pages/series.dart';
import 'package:edo_ukiyo_map/providers/providers.dart';
import 'package:edo_ukiyo_map/widgets/commons.dart';

/// シリーズ一覧画面
class SeriesesPage extends ConsumerWidget {
  /// パディング
  static const padding = 16.0;
  /// インジケーターのサイズ
  static const dimension = 16.0;

  const SeriesesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // すべてのシリーズを取得する
    final serieses = ref.watch(allSeriesProvider);

    return CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(AppLocalizations.of(context)!.page_series),
        ),
        child: switch (serieses) {
          AsyncData(:final value) => Scrollbar(
            child: SingleChildScrollView(
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(padding),
                  child: CupertinoListSection.insetGrouped(
                    margin: EdgeInsets.zero,
                    hasLeading: false,
                    children: value.map((e) => _ListItem(series: e)).toList(),
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
  // シリーズ
  final Series series;

  const _ListItem({required this.series});

  @override
  Widget build(BuildContext context) {
    return CupertinoListTile.notched(
      title: Text(series.getName(context), overflow: TextOverflow.ellipsis),
      trailing: const CupertinoListTileChevron(),
      additionalInfo: _WorksNumber(series: series),
      onTap: () => Navigator.of(context).push(
        MaterialWithModalsPageRoute(
          builder: (_) => SeriesPage(series: series),
        ),
      ),
    );
  }
}

// 作品数
class _WorksNumber extends ConsumerWidget {
  // シリーズ
  final Series series;

  const _WorksNumber({required this.series});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // シリーズから作品数を取得する
    final works = ref.watch(worksBySeriesProvider(series));

    return switch (works) {
      AsyncData(:final value) => CircleNumber(
        value: value.length,
      ),
      _ => Container(),
    };
  }
}
