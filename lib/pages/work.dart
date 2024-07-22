import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:edo_ukiyo_map/database/database.dart';
import 'package:edo_ukiyo_map/providers/providers.dart';
import 'package:edo_ukiyo_map/widgets/commons.dart';
import 'package:path/path.dart';

/// 作品ページ
class WorkPage extends StatelessWidget {
  /// 作品
  final Work work;

  const WorkPage({super.key, required this.work});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            _Header(work: work),
            _Canvas(work: work),
            Expanded(
              child: _Body(work: work),
            ),
          ],
        ),
      ),
      floatingActionButton: _FavouriteButton(work: work),
    );
  }
}

// ヘッダー
class _Header extends StatelessWidget {
  // 高さ
  static const height = 56.0;
  // ボタンの寸法
  static const buttonDimension = 32.0;
  // ボタンのパディング
  static const padding = 8.0;
  // テキストの横パディング
  static const textPaddingHorizontal = 24.0;
  // ヘッダ画像の透明度
  static const opacity = 0.4;

  // 作品
  final Work work;

  const _Header({required this.work});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: Row(
        children: [
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Image.asset(
                        work.season == 1 ? 'assets/images/uguisu.png'
                      : work.season == 2 ? 'assets/images/kingyo.png'
                      : work.season == 3 ? 'assets/images/susuki.png'
                      : 'assets/images/suzume.png',
                    fit: BoxFit.contain,
                    opacity: const AlwaysStoppedAnimation(opacity),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: textPaddingHorizontal),
                  alignment: Alignment.centerLeft,
                  child: Text(work.getName(context),
                    overflow: TextOverflow.ellipsis,
                    style: Theme.of(context).cupertinoOverrideTheme?.textTheme?.navTitleTextStyle,
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            alignment: Alignment.centerRight,
            child: CircleButton(
              dimension: buttonDimension,
              onPressed: () => Navigator.of(context).pop(),
              child: const Icon(Icons.close),
            ),
          ),
        ],
      ),
    );
  }
}

// キャンバス
class _Canvas extends StatelessWidget {
  // アイコンのパディング
  static const padding = 8.0;

  // 作品
  final Work work;

  const _Canvas({required this.work});

  @override
  Widget build(BuildContext context) {
    final transformationController = TransformationController();
    return SizedBox(
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.45,
      child: Container(
        color: Colors.black12,
        child: Stack(
          children: [
            SizedBox.expand(
              child: Image.asset('assets/images/sayagata.png', repeat: ImageRepeat.repeat),
            ),
            Container(
              width: double.infinity,
              height: double.infinity,
              padding: const EdgeInsets.all(padding),
              color: Colors.black54,
              alignment: Alignment.bottomRight,
              child: const Icon(Icons.pinch_outlined, color: Colors.white70),
            ),
            SizedBox.expand(
              child: InteractiveViewer(
                transformationController: transformationController,
                child: FittedBox(
                  fit: BoxFit.contain,
                  child: GestureDetector(
                    onDoubleTap: () => transformationController.value = Matrix4.identity(),
                    child: Image.asset('assets/works/${work.id}.jpg'),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ボディ
class _Body extends StatelessWidget {
  // 横パディング
  static const paddingHorizontal = 24.0;
  // 縦パディング
  static const paddingVertical = 16.0;

  // 作品
  final Work work;

  const _Body({required this.work});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          behavior: HitTestBehavior.opaque,
          onVerticalDragUpdate: (details) {
            if (details.delta.dy > 0) {
              Navigator.of(context).pop();
            }
          },
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: paddingVertical / 2),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
                child: _SourceText(work: work),
              ),
              const SizedBox(height: paddingVertical),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (work.series != 0) _SeriesText(work: work),
                    Text(
                      work.getName(context),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: paddingVertical),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _PainterText(work: work),
                    if (work.publishedIn != null)
                      Text(
                        AppLocalizations.of(context)!.label_published('${work.publishedIn}'),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                  ],
                ),
              ),
              const SizedBox(height: paddingVertical),
            ],
          ),
        ),
        Expanded(
          child: Scrollbar(
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
                child: Text(work.getDescription(context)),
              ),
            ),
          ),
        ),
        const SizedBox(height: paddingVertical),
      ],
    );
  }
}

// シリーズテキスト
class _SeriesText extends ConsumerWidget {
  // 作品
  final Work work;

  const _SeriesText({required this.work});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 作品からシリーズを取得する
    final series = ref.watch(seriesByIdProvider(work.series));

    return switch (series) {
      AsyncData(:final value) => Text(
        value.getName(context),
        style: Theme.of(context).textTheme.bodySmall,
      ),
      _ => Container(),
    };
  }
}

// 絵師テキスト
class _PainterText extends ConsumerWidget {
  // 作品
  final Work work;

  const _PainterText({required this.work});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 作品から絵師を取得する
    final painters = ref.watch(paintersByWorkProvider(work));

    return switch (painters) {
      AsyncData(:final value) => Text(
        AppLocalizations.of(context)!.label_painter(value.map((e) => e.getName(context)).join('  ')),
        style: Theme.of(context).textTheme.bodySmall,
      ),
      _ => Container(),
    };
  }
}

// 出典テキスト
class _SourceText extends ConsumerWidget {
  // 作品
  final Work work;

  const _SourceText({required this.work});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 作品の出典を取得する
    final source = ref.watch(sourceByIdProvider(work.source));

    return switch (source) {
      AsyncData(:final value) => Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            AppLocalizations.of(context)!.label_permission(value.getLicense(context)),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
          ),
          Text(
            AppLocalizations.of(context)!.label_collection(value.getName(context)),
            style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.grey),
          ),
        ],
      ),
      _ => Container(),
    };
  }
}

// お気に入りボタン
class _FavouriteButton extends ConsumerWidget {
  // 角丸
  static const radius = 32.0;
  // 浮き
  static const elevation = 4.0;

  // 作品
  final Work work;

  const _FavouriteButton({required this.work});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favourites = ref.watch(favouritesNotifierProvider);
    return favourites.any((e) => e.id == work.id)
        ? FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            backgroundColor: Colors.white,
            elevation: elevation,
            mini: true,
            onPressed: () => ref.read(favouritesNotifierProvider.notifier).remove(work),
            child: const Icon(Icons.favorite, color: CupertinoColors.systemPink),
          )
        : FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius),
            ),
            mini: true,
            elevation: elevation,
            backgroundColor: Colors.white,
            onPressed: () => ref.read(favouritesNotifierProvider.notifier).add(work),
            child: const Icon(Icons.favorite, color: CupertinoColors.systemGrey),
          );
  }
}
