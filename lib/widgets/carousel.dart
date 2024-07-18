import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

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
    // 選択されているシリーズに含まれるすべての作品を取得する
    final works = ref.watch(currentAllWorksProvider);
    // カルーセルコントローラーを取得する
    final controller = ref.watch(carouselControllerProvider);

    return LayoutBuilder(
      builder: (context, constraints) {
        return switch (works) {
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
                child: _CarouselItem(work: e),
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
class _CarouselItem extends StatelessWidget {
  // 角丸
  static const radius = 8.0;
  // テキストのマージン
  static const textMargin = 8.0;

  // 作品
  final Work work;

  const _CarouselItem({required this.work});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius),
        ),
        clipBehavior: Clip.hardEdge,
        child: Column(
          children: [
            Expanded(
              child: SizedBox.expand(
                child: Image.asset('assets/works/${work.id}.jpg', fit: BoxFit.cover),
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(
                vertical: textMargin,
                horizontal: textMargin,
              ),
              child: Column(
                children: [
                  Text(work.getName(context),
                    style: Theme.of(context).textTheme.bodySmall,
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
}
