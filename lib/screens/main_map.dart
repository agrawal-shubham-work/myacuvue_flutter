import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/markers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_acuvue_flutter/widget_methods/create_map_cards.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;

class MainMap extends StatefulWidget {
  static const String routeName = '/mainmap';
  @override
  _MainMapState createState() => _MainMapState();
}

class _MainMapState extends State<MainMap> {
  static int selectedIndex = 0;
  Completer<GoogleMapController> _controller = Completer();
  Markers markers = Markers();
  List<Widget> mapBox = [];

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
    )));
  }

  Future<String> _loadData() async {
    return await rootBundle.loadString('assets/map_json.json');
  }

  Future loadCrossword() async {
    String mapJson = await _loadData();
    _parseJsonForMap(mapJson);
  }

  void _parseJsonForMap(String jsonString) {
    int count = 0;
    Map decoded = jsonDecode(jsonString);
    for (var map in decoded['Location']) {
      setState(() {
        count++;
      });
    }
  }

  @override
  void initState() {
    super.initState();
  }

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
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            MapBoxes(
                'AZPEC OPTICS',
                "BLK 762 JURONG WEST ST 75 #01-274 GEK POH Shopping CTR SINGAPORE  640762, JURONG, JURONG",
                1,
                selectedIndex, () {
              _gotoLocation(1.348928, 103.697599);
              setState(() {
                selectedIndex = 1;
              });
            }),
            MapBoxes(
                'KAI JOO OPTOMETRY (EAST POINT MALL)',
                "3 SIMEI STREET 6#01-30 EASTPOINT MALL SINGAPORE 528833, CHANGI/SIMEI, CHANGI/SIMEI",
                2,
                selectedIndex, () {
              _gotoLocation(1.342757, 103.953052);
              setState(() {
                selectedIndex = 2;
              });
            }),
            MapBoxes(
                'OBLIQUE OPTICS PTE LTD',
                "2 HANDY ROAD #01-07 THE CATHAY, DHOBY GHAUT/ CENTRAL, DHOBY GHAUT/ CENTRAL",
                3,
                selectedIndex, () {
              _gotoLocation(1.299521, 103.847612);
              setState(() {
                selectedIndex = 3;
              });
            }),
            MapBoxes(
                'PEARL\'S OPTICAL CO P/L (PEOPLE\'S PARK CENTRE)',
                "Oscar Enterprise Mobile Phone Repair & Camera Service Centre, 101 Upper Cross St, #B1-18A, People's Park Centre, Singapore 058357",
                4,
                selectedIndex, () {
              _gotoLocation(1.348928, 103.697599);
              setState(() {
                selectedIndex = 4;
              });
            }),
            MapBoxes(
                'Spectacle Hut ( Great World City 2)',
                "#01-130 Great World City, 1 Kim Seng Promenade Singapore 237994, River Valley, River Valley",
                5,
                selectedIndex, () {
              _gotoLocation(1.293609, 103.832006);
              setState(() {
                selectedIndex = 5;
              });
            }),
          ],
        ),
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
