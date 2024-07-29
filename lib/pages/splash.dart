import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// スプラッシュ画面
class SplashPage extends StatelessWidget {
  /// インジケーターのサイズ
  static const dimension = 16.0;

  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SizedBox.expand(
        child: Center(
          child: CupertinoActivityIndicator(radius: dimension),
        ),
      ),
    );
  }
}
