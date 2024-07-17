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
    final worksAndWork = ref.watch(currentWorksAndWorkProvider);
    // マーカー画像を取得する
    final markers = ref.watch(markerNotifierProvider);

    return switch (worksAndWork) {
      AsyncData(:final value) => GoogleMap(
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        style: '[{"featureType": "poi", "stylers": [{"visibility": "off"}]}]',
        // カメラ位置の設定
        initialCameraPosition: CameraPosition(
          target: LatLng(value.$2.latitude, value.$2.longitude),
          zoom: defaultMapZoom,
          tilt: defaultMapTilt,
        ),
        // マーカーの設定
        // 画像を取得できなければデフォルトのマーカーを使用する
        markers: value.$1.map((e) => Marker(
          markerId: MarkerId(e.id.toString()),
          position: LatLng(e.latitude, e.longitude),
          zIndex: e.id == value.$2.id ? 1 : 0,
          icon: markers == null
              ? BitmapDescriptor.defaultMarker
              : e.id == value.$2.id
                ? ref.watch(markerNotifierProvider)!.$2
                : ref.watch(markerNotifierProvider)!.$1,
          onTap: () async {
            // 選択されている作品インデックスを更新する
            ref.read(selectedWorkIndexNotifierProvider.notifier).updateState(e.index);
            // カルーセルを回す
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
