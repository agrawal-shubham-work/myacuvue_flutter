import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class Markers {
  Marker getMarker(String markerId, double lat, double long, String title) {
    return Marker(
      markerId: MarkerId(markerId),
      position: LatLng(lat, long),
      infoWindow: InfoWindow(title: title),
      icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
    );
  }
}
