import 'dart:async' show Completer, Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:my_acuvue_flutter/map_data_model.dart';
import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
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
  List<MapData> mapDetails = [];
  Future<String> _loadMapData() async {
    return await rootBundle.loadString('assets/map.json');
  }

  Future<List<MapData>> _mapDetails() async {
    String jsonString = await _loadMapData();
    final jsonResponse = json.decode(jsonString);

    for (var mapData in jsonResponse['Location']) {
      MapData data = MapData(
          mapData['Lat'], mapData['Long'], mapData['Name'], mapData['Address']);
      mapDetails.add(data);
    }

    return mapDetails;
  }

  Future<void> _gotoLocation(double lat, double long) async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(
      target: LatLng(lat, long),
      zoom: 15,
      tilt: 50.0,
      bearing: 45.0,
    )));
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
      child: FutureBuilder(
        future: _mapDetails(),
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          if (snapshot.data != null) {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 150.0,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: snapshot.data.length,
                itemBuilder: (BuildContext context, int index) {
                  return _boxes(
                    snapshot.data[index].Lat,
                    snapshot.data[index].Long,
                    snapshot.data[index].Name,
                    snapshot.data[index].Address,
                  );
                },
              ),
            );
          } else {
            return Container(
              margin: EdgeInsets.symmetric(vertical: 20.0),
              height: 150.0,
              child: Center(
                child: Text('Loading'),
              ),
            );
          }
        },
      ),
    );
  }

  Widget _boxes(
      double lat, double long, String storeName, String storeAddress) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(lat, long);
      },
      child: Container(
        child: new FittedBox(
          child: Container(
            margin: EdgeInsets.all(10.0),
            child: Material(
                color: Colors.white,
                elevation: 5.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: Color(0x802196F3),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: myDetailsContainer1(storeName, storeAddress),
                    ),
                  ],
                )),
          ),
        ),
      ),
    );
  }

  Widget myDetailsContainer1(String storeName, String storeAddress) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 250.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Text(
            storeName,
            style: kStoreName,
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            storeAddress,
            style: kStoreAddress,
          ),
        ],
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
