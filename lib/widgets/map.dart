import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:edo_ukiyo_map/database/database.dart';
import 'package:edo_ukiyo_map/providers/providers.dart';
import 'package:edo_ukiyo_map/utils/constants.dart';

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
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        mapType: MapType.normal,
        myLocationEnabled: true,
        myLocationButtonEnabled: false,
        zoomControlsEnabled: false,
        style: '[{"featureType": "poi", "stylers": [{"visibility": "off"}]}]',
        // カメラ位置の設定
        initialCameraPosition: CameraPosition(
          target: LatLng(value[0].latitude, value[0].longitude),
          zoom: defaultMapZoom,
          tilt: defaultMapTilt,
        ),
        // マーカーの設定
        markers: _createMarkers(value),
        onMapCreated: (controller) async {
          // Googleマップコントローラーをプロバイダに設定する
          ref.read(mapControllerNotifierProvider.notifier).updateState(controller);
          // 最初のマーカーのバルーンを表示する
          await controller.showMarkerInfoWindow(const MarkerId('1'));
          // 初回インストール後の起動で座標の計算がずれる障害への対応
          // このタイミングでカメラの位置を再設定する
          controller.moveCamera(CameraUpdate.newLatLng(
            LatLng(value[0].latitude, value[0].longitude))
          );
        },
      ),
      _ => Container(),
    };
  }

  // マーカーを作成する
  Set<Marker> _createMarkers(List<Work> works) {
    // マーカー画像を取得する
    final images = ref.watch(markerImagesNotifierProvider);
    return works.map((e) => Marker(
      markerId: MarkerId(e.index.toString()),
      position: LatLng(e.latitude, e.longitude),
      icon: images == null ? BitmapDescriptor.defaultMarker
          : e.season == 1 ? images.$4
          : e.season == 2 ? images.$3
          : e.season == 3 ? images.$5
          : e.season == 4 ? images.$2
          : images.$1,
      infoWindow: InfoWindow(
        title: e.getName(context),
      ),
      onTap: () async {
        // カルーセルのカレントアイテムを変更する
        // 選択されている作品インデックスの変更はカルーセルのアイテム変更イベントで実行される
        ref.watch(carouselControllerProvider).jumpToPage(e.index - 1);
      },
    )).toSet();
  }
}
