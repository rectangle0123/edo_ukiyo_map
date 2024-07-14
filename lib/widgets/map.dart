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
    final selected = ref.watch(selectedWorkNotifierProvider);
    final works = ref.watch(allWorksProvider);
    return selected != null
        ? switch (works) {
          AsyncData(:final value) => GoogleMap(
            mapType: MapType.normal,
            myLocationEnabled: true,
            myLocationButtonEnabled: false,
            style: '[{"featureType": "poi", "stylers": [{"visibility": "off"}]}]',
            initialCameraPosition: CameraPosition(
              target: LatLng(selected.latitude, selected.longitude),
              zoom: defaultMapZoom,
              tilt: defaultMapTilt,
            ),
            onMapCreated: (controller) {
              ref.read(mapControllerNotifierProvider.notifier).updateState(controller);
            },
          ),
          _ => Container(),
        }
        : Container();
  }
}
