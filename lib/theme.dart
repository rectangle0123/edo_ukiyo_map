import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

/// 藍色
const indigoSwatch = MaterialColor(
  0xff165e83,
  {
    50: Color(0xffe5e9ef),
    100: Color(0xffbec9d7),
    200: Color(0xff93a5bc),
    300: Color(0xff6880a1),
    400: Color(0xff47658c),
    500: Color(0xff274a78),
    600: Color(0xff234370),
    700: Color(0xff1d3a65),
    800: Color(0xff17325b),
    900: Color(0xff0e2248),
  },
);

/// 生成り色
const unbleachedColor = Color(0xfffbfaf5);
/// 乳白色
const milkyWhiteColor = Color(0xfff3f3f3);
/// 胡粉色
const gofunColor = Color(0xfffffffc);

/// Materialテーマ
class AppTheme {
  static final ThemeData lightTheme = ThemeData(
    // 基本
    brightness: Brightness.light,
    fontFamily: 'Noto Serif Japanese',
    cupertinoOverrideTheme: CupertinoAppTheme.lightTheme,
    colorScheme: ColorScheme.fromSwatch(
      primarySwatch: indigoSwatch,
      backgroundColor: milkyWhiteColor,
    ),
    scaffoldBackgroundColor: milkyWhiteColor,
    // メニュー
    drawerTheme: const DrawerThemeData(
      backgroundColor: milkyWhiteColor,
    ),
    // カードの色
    cardColor: gofunColor,
    // ダイアログの色
    dialogBackgroundColor: gofunColor,
  );
}

/// Cupertinoテーマ
class CupertinoAppTheme {
  static const CupertinoThemeData lightTheme = CupertinoThemeData(
    // 基本
    brightness: Brightness.light,
    primaryColor: indigoSwatch,
    barBackgroundColor: unbleachedColor,
    scaffoldBackgroundColor: milkyWhiteColor,
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
