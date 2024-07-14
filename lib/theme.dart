import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// Materialテーマ
class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    // 基本
    brightness: Brightness.light,
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue, brightness: Brightness.light),
    cupertinoOverrideTheme: CupertinoAppTheme.lightTheme,
    scaffoldBackgroundColor: CupertinoColors.systemGrey6,
    // テキスト
    fontFamily: 'Noto Serif Japanese',
    // カード
    cardTheme: const CardTheme(color: Colors.white),
    // ダイアログ
    dialogBackgroundColor: Colors.white,
  );
}

/// Cupertinoテーマ
class CupertinoAppTheme {
  static const CupertinoThemeData lightTheme = CupertinoThemeData(
    // 基本
    brightness: Brightness.light,
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: CupertinoColors.systemGrey6,
    // テキスト
    textTheme: CupertinoTextThemeData(
      // 通常のテキスト
      textStyle: TextStyle(
        inherit: false,
        fontFamily: 'Noto Serif Japanese',
        fontSize: 17.0,
        fontWeight: FontWeight.w400,
        letterSpacing: -0.41,
        color: CupertinoColors.label,
        decoration: TextDecoration.none,
      ),
      // ナビゲーションバーのタイトル
      navTitleTextStyle: TextStyle(
        inherit: false,
        fontFamily: 'Noto Serif Japanese',
        fontSize: 17.0,
        fontWeight: FontWeight.w600,
        letterSpacing: -0.41,
        color: CupertinoColors.label,
        decoration: TextDecoration.none,
      ),
    ),
  );
}
