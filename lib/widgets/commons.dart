import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import 'package:edo_ukiyo_map/database/database.dart';
import 'package:edo_ukiyo_map/pages/work.dart';
import 'package:edo_ukiyo_map/providers/providers.dart';

/// 丸ボタン
class CircleButton extends StatelessWidget {
  /// サイズ
  final double dimension;
  /// 色
  final Color? color;
  /// ボタンアクション
  final VoidCallback onPressed;
  /// 子ウィジェット
  final Widget child;
  /// 透過
  final opacity = 0.6;

  const CircleButton({
    super.key,
    required this.dimension,
    this.color,
    required this.onPressed,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox.square(
      dimension: dimension,
      child: CupertinoButton(
        color: color ?? Colors.black.withOpacity(opacity),
        padding: EdgeInsets.zero,
        borderRadius: BorderRadius.circular(dimension),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}

/// 丸数字
class CircleNumber extends StatelessWidget {
  /// サイズ
  final double dimension;
  /// マージン
  final EdgeInsetsGeometry margin;
  /// 値
  final int value;
  /// フォントサイズ
  final double? fontSize;
  /// 透過
  final opacity = 0.6;

  const CircleNumber({
    super.key,
    required this.dimension,
    required this.margin,
    required this.value,
    this.fontSize,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dimension,
      height: dimension,
      margin: margin,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(opacity),
        borderRadius: BorderRadius.circular(dimension),
      ),
      child: fontSize != null
        ? Text('$value', style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Colors.white,
            fontSize: fontSize,
            fontFamily: '',
          ))
        : Text('$value', style: Theme.of(context).textTheme.labelSmall?.copyWith(
            color: Colors.white,
            fontFamily: ''),
          ),
    );
  }
}

/// 作品リストアイテム
class WorkListItem extends ConsumerWidget {
  /// 角丸
  static const radius = 2.0;
  /// ボタンのサイズ
  static const buttonDimension = 22.0;
  /// ボタンの間隔
  static const buttonSpace = 8.0;

  /// 作品
  final Work work;

  const WorkListItem({super.key, required this.work});

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
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox.square(
              dimension: buttonDimension,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () => _handleOpenButtonTapped(context),
                child: const Icon(Icons.open_in_new_outlined, size: 22),
              ),
            ),
            const SizedBox(width: buttonSpace),
            SizedBox.square(
              dimension: buttonDimension,
              child: CupertinoButton(
                padding: EdgeInsets.zero,
                onPressed: () => _handleMapButtonTapped(context, ref),
                child: const Icon(CupertinoIcons.map, size: 22),
              ),
            ),
          ],
        ),
      ),
      _ => Container(),
    };
  }

  // オープンボタンタップイベント
  Future<void> _handleOpenButtonTapped(BuildContext context) async {
    await showCupertinoModalBottomSheet(
      context: context,
      enableDrag: false,
      builder: (context) => WorkPage(work: work),
    );
  }

  // マップボタンタップイベント
  Future<void> _handleMapButtonTapped(BuildContext context, WidgetRef ref) async {
    // タップされた作品のシリーズが、選択されているシリーズIDと一致するかどうかを判定する
    final selectedSeriesID = ref.watch(selectedSeriesIdNotifierProvider);
    if (selectedSeriesID == work.series) {
      // 一致する場合
      // タップされた作品のシリーズカルーセルのカレントアイテムかどうかを判定する
      final currentWorkIndex = ref.watch(selectedWorkIndexNotifierProvider);
      if (currentWorkIndex == work.index) {
        // カレントアイテムだった場合
        // 選択されている作品の位置にGoogleマップのカメラを移動する
        final work = await ref.watch(currentSingleWorkProvider.future);
        await ref.watch(mapControllerNotifierProvider)?.animateCamera(
          CameraUpdate.newLatLng(LatLng(work.latitude, work.longitude)),
        );
        // Googleマップのマーカーに設定したバルーンを表示する
        await ref.read(mapControllerNotifierProvider)?.showMarkerInfoWindow(MarkerId('$currentWorkIndex'));
      } else {
        // カレントアイテムでない場合
        // カルーセルのカレントアイテムを変更する
        // 選択されている作品インデックスの変更はカルーセルのアイテム変更イベントで実行される
        ref.watch(carouselControllerProvider).jumpToPage(work.index - 1);
      }
    } else {
      // 一致しない場合
      // シリーズタブを切り替える
      // 選択されているシリーズIDの変更はシリーズタブの変更イベントで実行される
      ref.watch(tabControllerNotifierProvider)?.animateTo(work.series - 1);
      // シリーズタブの変更イベントが終了するまで少し待つ
      await Future.delayed(const Duration(milliseconds: 500));
      // カルーセルのカレントアイテムを変更する
      // 選択されている作品インデックスの変更はカルーセルのアイテム変更イベントで実行される
      ref.watch(carouselControllerProvider).jumpToPage(work.index - 1);
    }
    // ページを閉じる
    if (context.mounted) {
      Navigator.of(context).pop();
    }
  }
}
