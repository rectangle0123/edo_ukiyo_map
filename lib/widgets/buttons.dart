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
