import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:edo_ukiyo_map/pages/home.dart';
import 'package:edo_ukiyo_map/pages/splash.dart';
import 'package:edo_ukiyo_map/providers/providers.dart';
import 'package:edo_ukiyo_map/storage/database.dart';
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
      // ホーム画面
      home: FutureBuilder(
        future: initialize(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashPage();
          } else {
            return const HomePage();
          }
        },
      ),
    );
  }

  /// 初期化
  Future<void> initialize() async {
    // デバイスの向きを縦に固定する
    await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
    // データベース初期化
    await Database.instance.initialize();
    // Googleマップマーカー画像を生成する
    var marker_1 = await _loadCustomMarker('assets/images/pin_blue.png');
    var marker_2 = await _loadCustomMarker('assets/images/pin_red.png');
    ref.watch(markerNotifierProvider.notifier).updateState((marker_1, marker_2));
  }

  // マーカー画像を生成する
  Future<BitmapDescriptor> _loadCustomMarker(String path) async {
    var data = await rootBundle.load(path);
    var codec = await instantiateImageCodec(data.buffer.asUint8List(), targetWidth: 96);
    var frameInfo = await codec.getNextFrame();
    var byteData = await frameInfo.image.toByteData(format: ImageByteFormat.png);
    return BitmapDescriptor.fromBytes(byteData!.buffer.asUint8List());
  }
}
