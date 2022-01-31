import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatelessWidget {
  final Completer<GoogleMapController> _controller = Completer();

  static const CameraPosition _brazilCoordinates = CameraPosition(
    target: LatLng(-14.2400732, -53.1805017),
    zoom: 2.2,
  );

  MapView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GoogleMap(
      initialCameraPosition: _brazilCoordinates,
      onMapCreated: (GoogleMapController controller) async {
        _controller.complete(controller);
        await Future.delayed(const Duration(seconds: 3));

        controller
            .animateCamera(CameraUpdate.newCameraPosition(const CameraPosition(
          target: LatLng(-6.079218760533462, -49.88386273237121),
          zoom: 14,
        )));
      },
    );
  }
}
