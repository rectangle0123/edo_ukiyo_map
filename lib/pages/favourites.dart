import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:edo_ukiyo_map/providers/providers.dart';
import 'package:edo_ukiyo_map/storage/database.dart';

/// お気に入り一覧画面
class FavouritesPage extends ConsumerWidget {
  /// パディング
  static const padding = 16.0;
  /// インジケーターのサイズ
  static const dimension = 16.0;

  const FavouritesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // お気に入りの作品を取得する
    final favourites = ref.watch(favouritesNotifierProvider);

    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: Text(AppLocalizations.of(context)!.page_favourites),
      ),
      child: Scrollbar(
        child: CustomScrollView(
          slivers: [
            SliverFillRemaining(
              hasScrollBody: false,
              child: SafeArea(
                child: Container(
                  padding: const EdgeInsets.all(padding),
                  child: favourites.isEmpty
                      ? RichText(
                          text: TextSpan(
                            style: Theme.of(context).textTheme.bodyMedium,
                            children: [
                              TextSpan(text: '${AppLocalizations.of(context)!.text_page_favorites_01}\n'),
                              TextSpan(text: AppLocalizations.of(context)!.text_page_favorites_02),
                            ],
                          ),
                        )
                      : CupertinoListSection.insetGrouped(
                          margin: EdgeInsets.zero,
                          children: favourites.map((e) => _ListItem(work: e)).toList(),
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

// リストアイテム
class _ListItem extends ConsumerWidget {
  // 角丸
  static const radius = 2.0;

  // 作品
  final Work work;

  const _ListItem({required this.work});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 作品からシリーズを取得する
    final series = ref.watch(seriesByIdProvider(work.series));

    return switch (series) {
      AsyncData(:final value) => CupertinoListTile.notched(
        title: Text(work.getName(context), overflow: TextOverflow.ellipsis),
        leading: ClipRRect(
          borderRadius: BorderRadius.circular(radius),
          child: SizedBox.expand(
            child: Image.asset('assets/works/${work.id}.jpg', fit: BoxFit.cover),
          ),
        ),
        subtitle: Text(
          value.getName(context),
          overflow: TextOverflow.ellipsis,
        ),
        trailing: const CupertinoListTileChevron(),
        onTap: () async {
          // シリーズタブを切り替える
          // 選択されているシリーズIDの変更はシリーズタブの変更イベントで実行される
          ref.watch(tabControllerNotifierProvider)?.animateTo(work.series - 1);
          // シリーズタブの変更イベントが終了するまで少し待つ
          await Future.delayed(const Duration(milliseconds: 500));
          // カルーセルのカレントアイテムを変更する
          // 選択されている作品インデックスの変更はカルーセルのアイテム変更イベントで実行される
          ref.watch(carouselControllerProvider).jumpToPage(work.index - 1);
          if (context.mounted) {
            Navigator.of(context).pop();
          }
          // showCupertinoModalBottomSheet(
          //   context: context,
          //   enableDrag: false,
          //   builder: (context) => WorkPage(work: work),
          // );
        },
      ),
      _ => Container(),
    };
  }
}
