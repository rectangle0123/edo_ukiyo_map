import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:edo_ukiyo_map/database/database.dart';
import 'package:edo_ukiyo_map/providers/providers.dart';
import 'package:edo_ukiyo_map/widgets/commons.dart';

/// シリーズ画面
class SeriesPage extends ConsumerWidget {
  /// パディング
  static const padding = 16.0;
  /// 要素の間隔
  static const space = 16.0;
  /// インジケーターのサイズ
  static const dimension = 16.0;

  /// シリーズ
  final Series series;

  const SeriesPage({super.key, required this.series});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // シリーズから作品を取得する
    final works = ref.watch(worksBySeriesProvider(series));

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(series.getShortName(context), overflow: TextOverflow.ellipsis),
      ),
      child: switch (works) {
        AsyncData(:final value) => Scrollbar(
          child: CustomScrollView(
            slivers: [
              SliverFillRemaining(
                hasScrollBody: false,
                child: SafeArea(
                  child: Container(
                    padding: const EdgeInsets.all(padding),
                    child: Column(
                      children: [
                        _SeriesCard(series: series),
                        const SizedBox(height: space),
                        CupertinoListSection.insetGrouped(
                          margin: EdgeInsets.zero,
                          hasLeading: false,
                          children: value.map((e) => WorkListItemWithoutSeries(work: e)).toList(),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
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

// シリーズカード
class _SeriesCard extends StatelessWidget {
  // パディング
  static const padding = 16.0;
  // 角丸
  static const radius = 12.0;
  // 要素の間隔
  static const space = 16.0;

  // シリーズ
  final Series series;

  const _SeriesCard({required this.series});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.0,
      margin: EdgeInsets.zero,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Container(
        padding: const EdgeInsets.all(padding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: double.infinity,
              child: Text(series.getName(context),
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontWeight: FontWeight.bold,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
            ),
            const SizedBox(height: space),
            Text(series.getDescription(context),
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ],
        ),
      ),
    );
  }
}
