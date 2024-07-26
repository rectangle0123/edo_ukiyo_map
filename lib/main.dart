import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:edo_ukiyo_map/database/database.dart';
import 'package:edo_ukiyo_map/pages/home.dart';
import 'package:edo_ukiyo_map/pages/splash.dart';
import 'package:edo_ukiyo_map/providers/providers.dart';
import 'package:edo_ukiyo_map/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const ProviderScope(child: App()));
}

/// アプリケーション
class App extends ConsumerStatefulWidget {
  const App({super.key});

  @override
  AppState createState() => AppState();
}

class AppState extends ConsumerState<App> with WidgetsBindingObserver {

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.detached) {
      // データベースクローズ
      Database.instance.close();
    }
    super.didChangeAppLifecycleState(state);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // 多言語化
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      // テーマ
      theme: AppTheme.lightTheme,
      // 画面遷移ルート
      onGenerateRoute: (settings) {
        return MaterialWithModalsPageRoute(
          builder: (context) {
            // ホーム画面
            return FutureBuilder(
              future: _initialize(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const SplashPage();
                } else {
                  return const HomePage();
                }
              },
            );
          },
        );
      },
    );
  }

  // 初期化
  Future<void> _initialize() async {
    // デバイスの向きを縦に固定する
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // 起動時のバージョン番号とパッケージ情報のバージョン番号を取得して
    // 起動時のバージョン番号がパッケージ情報のバージョン番号より古ければマスタデータを更新する
    final packageInfo = await ref.watch(packageInfoProvider.future);
    final prefs = await SharedPreferences.getInstance();
    final current = prefs.getString('version') ?? '0';
    if (current.compareTo(packageInfo.version) < 0) {
      // データベース初期化
      await Database.instance.initialize();
      // バージョン番号更新
      await prefs.setString('version', packageInfo.version);
    }
    // Googleマップマーカー画像を生成する
    var image1 = await _loadCustomMarker('assets/images/pin_black.png');
    var image2 = await _loadCustomMarker('assets/images/pin_blue.png');
    var image3 = await _loadCustomMarker('assets/images/pin_green.png');
    var image4 = await _loadCustomMarker('assets/images/pin_pink.png');
    var image5 = await _loadCustomMarker('assets/images/pin_red.png');
    ref.read(markerImagesNotifierProvider.notifier).updateState((image1, image2, image3, image4, image5));
    // ライセンス情報追加
    LicenseRegistry.addLicense(() async* {
      var text = await rootBundle.loadString('assets/fonts/OFL.txt');
      yield LicenseEntryWithLineBreaks(['Noto Serif Japanese'], text);
    });
  }

  // Googleマップマーカー画像を生成する
  Future<BitmapDescriptor> _loadCustomMarker(String path) async {
    var data = await rootBundle.load(path);
    var codec = await instantiateImageCodec(data.buffer.asUint8List(), targetWidth: 72);
    var frameInfo = await codec.getNextFrame();
    var byteData = await frameInfo.image.toByteData(format: ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
  }
}
