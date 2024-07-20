import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 丸ボタン
class CircleButton extends StatelessWidget {
  /// サイズ
  final double dimension;
  /// 色
  final Color? color;
  /// 透過
  final opacity = 0.6;
  /// ボタンアクション
  final VoidCallback onPressed;
  /// 子ウィジェット
  final Widget child;

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

/// 数字を表示する丸いウィジェット
class CircleNumber extends StatelessWidget {
  /// サイズ
  final double dimension;
  /// 色
  final Color color;
  /// マージン
  final EdgeInsetsGeometry margin;
  /// 値
  final int value;
  /// フォントサイズ
  final double? fontSize;

  const CircleNumber({
    super.key,
    required this.dimension,
    required this.color,
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
        color: color,
        borderRadius: BorderRadius.circular(dimension),
      ),
      child: fontSize != null
        ? Text('$value', style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: fontSize, fontFamily: ''))
        : Text('$value', style: Theme.of(context).textTheme.labelSmall?.copyWith(fontFamily: '')),
    );
  }
}
