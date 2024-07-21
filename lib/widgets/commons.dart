import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
