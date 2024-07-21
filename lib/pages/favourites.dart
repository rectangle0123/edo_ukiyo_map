import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:edo_ukiyo_map/providers/providers.dart';
import 'package:edo_ukiyo_map/widgets/commons.dart';

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
                  alignment: Alignment.center,
                  child: favourites.isEmpty
                      ? RichText(
                          textAlign: TextAlign.center,
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
                          children: favourites.map((e) => WorkListItemWithoutSeries(work: e)).toList(),
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
