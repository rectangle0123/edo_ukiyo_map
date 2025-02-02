import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:edo_ukiyo_map/database/database.dart';
import 'package:edo_ukiyo_map/providers/providers.dart';
import 'package:edo_ukiyo_map/widgets/commons.dart';

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
  static const height = 52.0;
  // ボタンの寸法
  static const buttonDimension = 32.0;
  // ボタンのパディング
  static const padding = 8.0;
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
          Container(
            padding: const EdgeInsets.symmetric(horizontal: padding),
            alignment: Alignment.centerLeft,
            child: CircleNumber(
              color: Colors.grey,
              fontColor: Colors.white,
              value: work.index,
            ),
          ),
          Expanded(
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.bottomRight,
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
              const SizedBox(height: paddingVertical),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
                child: _MetaData(work: work),
              ),
              const SizedBox(height: paddingVertical),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    if (work.series != 0)
                      _SeriesText(work: work),
                    Text(
                      work.getName(context),
                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: paddingVertical),
            ],
          ),
        ),
        if (work.getDescription(context) != null)
          Expanded(
            child: Scrollbar(
              child: SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: paddingHorizontal),
                  child: Text(work.getDescription(context)!),
                ),
              ),
            ),
          ),
          const SizedBox(height: paddingVertical),
      ],
    );
  }
}

// 作品のメタ情報
class _MetaData extends ConsumerWidget {
  // 作品
  final Work work;

  const _MetaData({required this.work});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // フォントスタイル
    final fontStyle = Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.black.withOpacity(0.5));
    // 作品のメタ情報を取得する
    final meta = ref.watch(metaByWorkProvider(work));

    return switch (meta) {
      AsyncData(:final value) => Container(
        padding: const EdgeInsets.only(left: 16.0),
        decoration: const BoxDecoration(
          border: Border(left: BorderSide(width: 2.0, color: Colors.grey)),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(AppLocalizations.of(context)!.label_painter, style: fontStyle),
                if (work.publishedIn != null)
                  Text(AppLocalizations.of(context)!.label_year, style: fontStyle),
                Text(AppLocalizations.of(context)!.label_collection, style: fontStyle),
                Text(AppLocalizations.of(context)!.label_license, style: fontStyle),
              ],
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    Localizations.localeOf(context).languageCode == 'ja'
                        ? value.$1.map((e) => e.getName(context)).toList().join('  ')
                        : value.$1.map((e) => e.getShortName(context)).toList().join(', '),
                    style: fontStyle,
                  ),
                  if (work.publishedIn != null)
                    Text(AppLocalizations.of(context)!.value_year('${work.publishedIn}'), style: fontStyle),
                  Text(value.$2.getName(context), style: fontStyle),
                  Text(value.$2.getLicense(context), style: fontStyle),
                ],
              ),
            ),
          ],
        ),
      ),
      _ => Container(),
    };
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
