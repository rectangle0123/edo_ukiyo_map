import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:edo_ukiyo_map/utils/constants.dart';
import 'package:edo_ukiyo_map/providers/providers.dart';

/// 地図
class AppMap extends ConsumerStatefulWidget {
  const AppMap({super.key});

  @override
  AppMapState createState() => AppMapState();
}

class AppMapState extends ConsumerState<AppMap> {
  @override
  Widget build(BuildContext context) {
    // 選択されているシリーズに含まれるすべての作品と、選択されている作品インデックスからひとつの作品を取得する
    final works = ref.watch(currentAllWorksProvider);
    // マーカー画像を取得する
    final markers = ref.watch(markerNotifierProvider);

    return switch (works) {
      AsyncData(:final value) => GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        style: '[{"featureType": "poi", "stylers": [{"visibility": "off"}]}]',
        // カメラ位置の設定
        initialCameraPosition: CameraPosition(
          target: LatLng(value[0].latitude, value[0].longitude),
          zoom: defaultMapZoom,
          tilt: defaultMapTilt,
        ),
        // マーカーの設定
        // 画像を取得できなければデフォルトのマーカーを使用する
        markers: value.map((e) => Marker(
          markerId: MarkerId(e.id.toString()),
          position: LatLng(e.latitude, e.longitude),
          icon: markers == null
              ? BitmapDescriptor.defaultMarker
              : ref.watch(markerNotifierProvider)!.$1,
          onTap: () async {
            // カルーセルを回す
            // カルーセルのアイテム変更イベントが発火して選択されている作品インデックスも更新される
            ref.watch(carouselControllerProvider).jumpToPage(e.index - 1);
          }
        )).toSet(),
        onMapCreated: (controller) {
          // Googleマップコントローラーをプロバイダに設定する
          ref.read(mapControllerNotifierProvider.notifier).updateState(controller);
        },
      ),
      _ => Container(),
    };
  }
}
