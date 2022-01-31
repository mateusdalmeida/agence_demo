import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

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
      myLocationEnabled: true,
      onMapCreated: (GoogleMapController controller) async {
        _controller.complete(controller);
        await getLocationPermission();

        Location location = Location();

        LocationData _locationData;

        _locationData = await location.getLocation();

        controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
          target: LatLng(_locationData.latitude!, _locationData.longitude!),
          zoom: 14,
        )));
      },
    );
  }
}

Future<void> getLocationPermission() async {
  Location location = Location();

  bool _serviceEnabled;
  PermissionStatus _permissionGranted;

  _serviceEnabled = await location.serviceEnabled();
  if (!_serviceEnabled) {
    _serviceEnabled = await location.requestService();
    if (!_serviceEnabled) {
      return;
    }
  }

  _permissionGranted = await location.hasPermission();
  if (_permissionGranted == PermissionStatus.denied) {
    _permissionGranted = await location.requestPermission();
    if (_permissionGranted != PermissionStatus.granted) {
      return;
    }
  }
}
