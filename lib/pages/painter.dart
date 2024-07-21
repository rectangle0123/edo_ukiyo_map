import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:edo_ukiyo_map/database/database.dart';
import 'package:edo_ukiyo_map/providers/providers.dart';
import 'package:edo_ukiyo_map/widgets/commons.dart';

/// 絵師画面
class PainterPage extends ConsumerWidget {
  /// パディング
  static const padding = 16.0;
  /// 要素の間隔
  static const space = 16.0;
  /// インジケーターのサイズ
  static const dimension = 16.0;

  /// 絵師
  final Painter painter;

  const PainterPage({super.key, required this.painter});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 絵師から作品を取得する
    final works = ref.watch(worksByPainterProvider(painter));

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(painter.getShortName(context), overflow: TextOverflow.ellipsis),
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
                        _PainterCard(painter: painter),
                        const SizedBox(height: space),
                        CupertinoListSection.insetGrouped(
                          margin: EdgeInsets.zero,
                          hasLeading: false,
                          children: value.map((e) => WorkListItem(work: e)).toList(),
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

// 絵師カード
class _PainterCard extends StatelessWidget {
  // パディング
  static const padding = 16.0;
  // 角丸
  static const radius = 12.0;
  // アバターの寸法
  static const avatarDimension = 48.0;
  // アバターの角丸
  static const avatarRadius = 4.0;
  // 要素の間隔
  static const space = 16.0;

  // 絵師
  final Painter painter;

  const _PainterCard({required this.painter});

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
              height: avatarDimension,
              child: Row(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(avatarRadius),
                    child: painter.hasPortrait
                        ? Image.asset('assets/painters/${painter.id}.jpg')
                        : Image.asset('assets/painters/0.jpg'),
                  ),
                  const SizedBox(width: space),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(painter.getName(context),
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        Text('${painter.bornIn ?? "?"} - ${painter.diedIn ?? "?"}',
                          style: Theme.of(context).textTheme.labelLarge?.copyWith(
                            color: Colors.grey[600],
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            if (painter.getDescription(context) != null)
              const SizedBox(height: space),
            if (painter.getDescription(context) != null)
              Text(painter.getDescription(context)!,
                style: Theme.of(context).textTheme.bodyMedium,
              ),
          ],
        ),
      ),
    );
  }
}
