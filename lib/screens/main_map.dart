import 'dart:async';
import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/markers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MainMap extends StatefulWidget {
  static const String routeName = '/mainmap';
  @override
  _MainMapState createState() => _MainMapState();
}

class _MainMapState extends State<MainMap> {
  Completer<GoogleMapController> _controller = Completer();
  Markers markers = Markers();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Register My Optical Store'),
      ),
      body: Stack(
        children: <Widget>[
          _buildGoogleMap(context),
          /*_zoomMinusFunct(context),
        _zoomPlusFunc(context),*/
          _buildContainer(),
        ],
      ),
    );
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
      ),
    );
  }

  Widget _buildGoogleMap(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition:
            CameraPosition(target: LatLng(1.299521, 103.847612), zoom: 10),
        onMapCreated: (GoogleMapController controller) {
          _controller.complete(controller);
        },
        markers: {
          markers.getMarker('singapore1', 1.348928, 103.697599, 'AZPEC OPTICS'),
          markers.getMarker('singapore2', 1.342757, 103.953052,
              'KAI JOO OPTOMETRY (EAST POINT MALL)'),
          markers.getMarker(
              'singapore3', 1.299521, 103.847612, 'OBLIQUE OPTICS PTE LTD'),
          markers.getMarker('singapore4', 1.285904, 103.843991,
              'PEARL\'S OPTICAL CO P/L (PEOPLE\'S PARK CENTRE)'),
          markers.getMarker('singapore5', 1.293609, 103.832006,
              'Spectacle Hut ( Great World City 2)'),
        },
      ),
    );
  }
}
