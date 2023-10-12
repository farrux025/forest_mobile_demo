import 'dart:async';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:yandex_mapkit/yandex_mapkit.dart';

class MapScreen extends StatefulWidget {
  const MapScreen({super.key});

  @override
  State<MapScreen> createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  final Completer<YandexMapController> _completer = Completer();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: YandexMap(
        onMapCreated: _onMapCreated,
        // nightModeEnabled: true,
      ),
    );
  }

  void _onMapCreated(YandexMapController controller) async {
    _completer.complete(controller);
    Point initialPoint;
    await Geolocator.getCurrentPosition().then((value) {
      initialPoint =
          Point(latitude: value.latitude, longitude: value.longitude);
      controller.moveCamera(
          CameraUpdate.newCameraPosition(CameraPosition(target: initialPoint)));
      controller.moveCamera(CameraUpdate.zoomTo(10));
      controller.toggleUserLayer(visible: true);
    });
  }
}
