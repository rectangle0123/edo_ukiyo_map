import 'dart:math';

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
  static const dimension = 20.0;
  /// フォントサイズ
  static const fontSize = 10.0;

  /// 値
  final int value;
  /// 色
  final Color? color;
  /// 透過
  final double opacity;
  /// フォントの色
  final Color? fontColor;
  /// マージン
  final EdgeInsetsGeometry? margin;

  const CircleNumber({
    super.key,
    required this.value,
    this.color,
    this.opacity = 1.0,
    this.fontColor,
    this.margin,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: dimension,
      height: dimension,
      margin: margin,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: color != null
            ? color!.withOpacity(opacity)
            : Theme.of(context).scaffoldBackgroundColor,
        borderRadius: BorderRadius.circular(dimension),
      ),
      child: Text('$value', style: Theme.of(context).textTheme.labelSmall?.copyWith(
        color: fontColor ?? Theme.of(context).textTheme.bodyMedium?.color,
        fontSize: fontSize,
        fontFamily: '',
      ))
    );
  }
}

/// 作品リストアイテム（シリーズなし）
class WorkListItemWithoutSeries extends ConsumerWidget {
  /// 角丸
  static const radius = 2.0;
  /// ボタンのサイズ
  static const buttonDimension = 22.0;
  /// ボタンの間隔
  static const buttonSpace = 8.0;

  /// 作品
  final Work work;

  const WorkListItemWithoutSeries({super.key, required this.work});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // 作品からシリーズを取得する
    final series = ref.watch(seriesByIdProvider(work.series));

    return switch (series) {
      AsyncData(:final value) => WorkListItem(series: value, work: work),
      _ => Container(),
    };
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

  /// シリーズ
  final Series series;
  /// 作品
  final Work work;

  const WorkListItem({super.key, required this.series, required this.work});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return CupertinoListTile.notched(
      title: Text(work.getName(context), overflow: TextOverflow.ellipsis),
      leading: ClipRRect(
        borderRadius: BorderRadius.circular(radius),
        child: SizedBox.expand(
          child: Image.asset('assets/works/${work.id}.jpg', fit: BoxFit.cover),
        ),
      ),
      subtitle: Text(
        series.getName(context),
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
              child: const Icon(CupertinoIcons.doc_text),
            ),
          ),
          const SizedBox(width: buttonSpace),
          SizedBox.square(
            dimension: buttonDimension,
            child: CupertinoButton(
              padding: EdgeInsets.zero,
              onPressed: () => _handleMapButtonTapped(context, ref),
              child: const Icon(CupertinoIcons.location_circle),
            ),
          ),
        ],
      ),
    );
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
      Navigator.of(context).popUntil((route) => route.isFirst);
    }
  }
}

/// コンパス
class Compass extends StatelessWidget {
  /// サイズ
  static const dimension = 22.0;
  /// フォントサイズ
  static const fontSize = 8.0;

  /// 角度
  final double? degree;

  const Compass({super.key, this.degree});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('N', style: Theme.of(context).textTheme.bodySmall?.copyWith(
          fontSize: fontSize,
          fontFamily: '',
          fontWeight: FontWeight.bold,
          height: 0.0,
        )),
        Stack(
          children: [
            SizedBox.square(
              dimension: dimension,
              child: CustomPaint(
                painter: _CompassBodyPainter(),
              ),
            ),
            if (degree != null)
              SizedBox.square(
                dimension: dimension,
                child: Transform.rotate(
                  angle: degree! * pi / 180,
                  child: CustomPaint(
                    painter: _CompassNeedlePainter(),
                  ),
                ),
              ),
          ],
        ),
      ],
    );
  }
}

// コンパスの本体描画
class _CompassBodyPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final p = Offset(size.width / 2, size.height / 2);
    final paint = Paint()..color = Colors.black.withOpacity(0.1);
    canvas.drawCircle(p, size.height / 2, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

// コンパスの針描画
class _CompassNeedlePainter extends CustomPainter {
  // 幅
  static const width = 8.0;

  @override
  void paint(Canvas canvas, Size size) {
    final p1 = Offset(size.width / 2, 0.0);
    final p2 = Offset((size.width / 2 - width / 2), size.height / 2);
    final p3 = Offset((size.width / 2 + width / 2), size.height / 2);
    final p4 = Offset(size.width / 2, size.height);

    final paint1 = Paint()..color = Colors.white..strokeCap = StrokeCap.round;
    final Path path1 = Path()
      ..moveTo(p2.dx, p2.dy)
      ..lineTo(p3.dx, p3.dy)
      ..lineTo(p4.dx, p4.dy)
      ..lineTo(p2.dx, p2.dy);
    canvas.drawPath(path1, paint1);
    final paint2 = Paint()..color = Colors.red..strokeCap = StrokeCap.round;
    final Path path2 = Path()
      ..moveTo(p1.dx, p1.dy)
      ..lineTo(p2.dx, p2.dy)
      ..lineTo(p3.dx, p3.dy)
      ..lineTo(p1.dx, p1.dy);
    canvas.drawPath(path2, paint2);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
