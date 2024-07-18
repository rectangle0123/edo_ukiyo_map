import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:edo_ukiyo_map/utils/constants.dart';
import 'package:edo_ukiyo_map/providers/providers.dart';
import 'package:edo_ukiyo_map/storage/database.dart';

/// 地図
class AppMap extends ConsumerStatefulWidget {
  const AppMap({super.key});

  @override
  AppMapState createState() => AppMapState();
}

class AppMapState extends ConsumerState<AppMap> {
  @override
  Widget build(BuildContext context) {
    // 選択されているシリーズに含まれるすべての作品を取得する
    final works = ref.watch(currentAllWorksProvider);

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
        markers: _createMarkers(value),
        onMapCreated: (controller) {
          // 最初のマーカーのバルーンを表示する
          controller.showMarkerInfoWindow(const MarkerId('1'));
          // Googleマップコントローラーをプロバイダに設定する
          ref.read(mapControllerNotifierProvider.notifier).updateState(controller);
        },
      ),
      _ => Container(),
    };
  }

  // マーカーを作成する
  Set<Marker> _createMarkers(List<Work> works) {
    // マーカー画像を取得する
    final image = ref.watch(markerImageNotifierProvider);
    return works.map((e) => Marker(
      markerId: MarkerId(e.index.toString()),
      position: LatLng(e.latitude, e.longitude),
      icon: image ?? BitmapDescriptor.defaultMarker,
      infoWindow: InfoWindow(
        title: e.getName(context),
      ),
      onTap: () async {
        // カルーセルに表示中のアイテムを変更する
        // 選択されている作品インデックスの変更はカルーセルのアイテム変更イベントで実行される
        ref.watch(carouselControllerProvider).jumpToPage(e.index - 1);
      },
    )).toSet();
  }
}
