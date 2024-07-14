import 'package:geolocator/geolocator.dart';

/// 位置情報ユーティリティ
class LocationUtils {
  /// 現在地を取得する
  static Future<(double, double)?> current() async {
    final isServiceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!isServiceEnabled) {
      return null;
    }

    var permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return null;
    }

    final position = await Geolocator.getCurrentPosition();
    return (position.latitude, position.longitude);
  }
}
