import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:edo_ukiyo_map/pages/work.dart';
import 'package:edo_ukiyo_map/providers/providers.dart';
import 'package:edo_ukiyo_map/storage/database.dart';

/// 作品カルーセル
class WorkCarousel extends ConsumerStatefulWidget {
  const WorkCarousel({super.key});

  @override
  WorkCarouselState createState() => WorkCarouselState();
}

class WorkCarouselState extends ConsumerState<WorkCarousel> {
  /// 画面に対する幅の比率
  static const viewPortFraction = 0.4;
  /// 下のパディング
  static const bottomPadding = 4.0;

  @override
  Widget build(BuildContext context) {
    // 選択されているシリーズに含まれるすべての作品とそれを描いた絵師を取得する
    final worksWithPainters = ref.watch(currentAllWorksWithPaintersProvider);
    // カルーセルコントローラーを取得する
    final controller = ref.watch(carouselControllerProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        return switch (worksWithPainters) {
          AsyncData(:final value) => CarouselSlider(
            carouselController: controller,
            options: CarouselOptions(
              height: constraints.maxHeight,
              enlargeCenterPage: true,
              enableInfiniteScroll: false,
              viewportFraction: viewPortFraction,
              onPageChanged: onItemChanged,
            ),
            items: value.map((e) {
              return Container(
                padding: const EdgeInsets.only(bottom: bottomPadding),
                child: _CarouselItem(workWithPainters: e),
              );
            }).toList(),
          ),
          _ => Container(),
        };
      },
    );
  }

  // アイテム変更イベント
  void onItemChanged(int index, CarouselPageChangedReason reason) async {
    // Googleマップのマーカーに設定したバルーンを表示する
    ref.read(mapControllerNotifierProvider)?.showMarkerInfoWindow(MarkerId('${index + 1}'));
    // 選択されている作品IDを更新する
    ref.read(selectedWorkIndexNotifierProvider.notifier).updateState(index + 1);
    // 選択されている作品の位置にGoogleマップのカメラを移動する
    final work = await ref.watch(currentSingleWorkProvider.future);
    ref.watch(mapControllerNotifierProvider)?.animateCamera(
      CameraUpdate.newLatLng(LatLng(work.latitude, work.longitude)),
    );
  }
}

// カルーセルアイテム
class _CarouselItem extends ConsumerWidget {
  // 角丸
  static const radius = 8.0;
  // テキストのマージン
  static const textMargin = 8.0;

  // 作品と絵師
  final (Work, List<Painter>) workWithPainters;

  const _CarouselItem({required this.workWithPainters});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () => _handleItemChanged(context, ref),
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Expanded(
              child: Stack(
                children: [
                  SizedBox.expand(
                    child: Image.asset('assets/works/${workWithPainters.$1.id}.jpg', fit: BoxFit.cover),
                  ),
                  Align(
                    alignment: Alignment.topRight,
                    child: _WorkIndex(work: workWithPainters.$1),
                  )
                ],
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: textMargin,
                horizontal: textMargin,
              ),
              child: Column(
                children: [
                  Text(workWithPainters.$1.getName(context),
                    style: Theme.of(context).textTheme.bodySmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(workWithPainters.$2.map((e) => e.getShortName(context)).join(', '),
                    style: Theme.of(context).textTheme.labelSmall,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // アイテム変更イベント
  Future<void> _handleItemChanged(BuildContext context, WidgetRef ref) async {
    // タップされたものがカルーセルのカレントアイテムかどうかを判定する
    final currentWorkIndex = ref.watch(selectedWorkIndexNotifierProvider);
    if (currentWorkIndex == workWithPainters.$1.index) {
      // カレントアイテムだった場合
      // 選択されている作品の位置にGoogleマップのカメラを移動する
      final work = await ref.watch(currentSingleWorkProvider.future);
      ref.watch(mapControllerNotifierProvider)?.animateCamera(
        CameraUpdate.newLatLng(LatLng(work.latitude, work.longitude)),
      );
    } else {
      // カレントアイテムでない場合
      // カルーセルのカレントアイテムを変更する
      // 選択されている作品インデックスの変更はカルーセルのアイテム変更イベントで実行される
      ref.watch(carouselControllerProvider).jumpToPage(workWithPainters.$1.index - 1);
    }
    // 作品ページを開く
    if (context.mounted) {
      showCupertinoModalBottomSheet(
        context: context,
        enableDrag: false,
        builder: (context) => WorkPage(work: workWithPainters.$1),
      );
    }
  }
}

// 作品インデックス
class _WorkIndex extends StatelessWidget {
  // サイズ
  static const dimension = 28.0;
  // 角丸
  static const radius = 28.0;
  // マージン
  static const margin = 4.0;

  // 作品
  final Work work;

  const _WorkIndex({required this.work});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dimension,
      height: dimension,
      margin: const EdgeInsets.all(margin),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.white70,
        borderRadius: BorderRadius.circular(radius),
      ),
      child: Text(
        '${work.index}',
        style: Theme.of(context).textTheme.labelSmall?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
