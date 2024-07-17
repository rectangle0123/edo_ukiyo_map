import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:edo_ukiyo_map/providers/providers.dart';
import 'package:edo_ukiyo_map/storage/database.dart';

/// カルーセルパネル
class CarouselPanel extends ConsumerStatefulWidget {
  const CarouselPanel({super.key});

  @override
  CarouselPanelState createState() => CarouselPanelState();
}

class CarouselPanelState extends ConsumerState<CarouselPanel> {
  /// 画面に対する幅の比率
  static const viewPortFraction = 0.4;
  /// 下のパディング
  static const bottomPadding = 4.0;

  @override
  Widget build(BuildContext context) {
    final controller = ref.watch(carouselControllerProvider);
    final works = ref.watch(worksBySelectedSeriesIdProvider);
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
          _ => SizedBox(height: constraints.maxHeight),
        };
      },
    );
  }

  // アイテム変更イベント
  void onItemChanged(int index, CarouselPageChangedReason reason) async {
    ref.read(selectedWorkIndexNotifierProvider.notifier).updateState(++index);
    final work = await ref.watch(worksBySelectedSeriesIdAndWorkIndexProvider.future);
    ref.watch(mapControllerNotifierProvider)?.animateCamera(
      CameraUpdate.newLatLng(LatLng(work.latitude, work.longitude)),
    );
  }
}

/// カルーセルアイテム
class _CarouselItem extends StatelessWidget {
  /// 角丸
  static const radius = 8.0;
  /// テキストのマージン
  static const textMargin = 8.0;

  /// 作品
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
