import 'dart:async' show Completer, Future;
import 'package:flutter/services.dart' show rootBundle;
import 'dart:convert';
import 'package:my_acuvue_flutter/models/map_data_model.dart';
import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/widget_methods/Forms/dropdown.dart';
import 'package:my_acuvue_flutter/utilities/markers.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:my_acuvue_flutter/widget_methods/Maps/map_detail_card_register.dart';
import 'package:my_acuvue_flutter/widget_methods/Maps/map_details_card.dart';

class MainMap extends StatefulWidget {
  static const String routeName = '/mainmap';
  @override
  _MainMapState createState() => _MainMapState();
}

class _MainMapState extends State<MainMap> {
  int _selectedIndex = 0;
  Completer<GoogleMapController> _controller = Completer();
  Markers markers = Markers();
  List<MapData> mapDetails = [];
  List<String> zoneList = [];
  TextEditingController controller = TextEditingController();
  String filter;
  bool isDropDownSelected = true;
  Future<String> _loadMapData() async {
    return await rootBundle.loadString('assets/map.json');
  }

  Future<List<MapData>> _mapDetails() async {
    String jsonString = await _loadMapData();
    final jsonResponse = json.decode(jsonString);

    var item = List<MapData>();

    for (var mapData in jsonResponse['Location']) {
      MapData data = MapData(mapData['Lat'], mapData['Long'], mapData['Name'],
          mapData['Address'], mapData['Zone']);
      if (zoneList.isEmpty || !zoneList.contains(mapData['Zone']))
        zoneList.add(mapData['Zone']);
      item.add(data);
    }

    return item;
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
    _mapDetails().then((values) {
      setState(() {
        mapDetails.addAll(values);
      });
    });
    controller.addListener(() {
      setState(() {
        filter = controller.text;
      });
    });
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
          /*_buildSearchBox(),*/
          _buildUpperContainer(),
          _buildContainer(),
        ],
      ),
    );
  }

  Widget _buildUpperContainer() {
    return Align(
      alignment: Alignment.topCenter,
      child: Row(
        children: <Widget>[
          Expanded(
            flex: 1,
            child: Container(
              margin: EdgeInsets.only(left: 5.0),
              child: isDropDownSelected
                  ? DropDownMainWidget(zoneList, (String value) {
                      setState(() {
                        filter = value;
                      });
                    }, filter)
                  : _buildSearchBox(),
            ),
          ),
          isDropDownSelected
              ? CreateSearchBtn(Icon(Icons.search))
              : CreateSearchBtn(Icon(Icons.close))
        ],
      ),
    );
  }

  GestureDetector CreateSearchBtn(Icon icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          if (isDropDownSelected)
            isDropDownSelected = false;
          else {
            isDropDownSelected = true;
            filter = null;
          }
        });
      },
      child: Container(
        padding: EdgeInsets.all(10.0),
        child: icon,
      ),
    );
  }

  Widget _buildContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 20.0),
        height: 150.0,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: mapDetails.length,
          itemBuilder: (BuildContext context, int index) {
            return filter == null || filter == ''
                ? _boxes(
                    mapDetails[index].Lat,
                    mapDetails[index].Long,
                    mapDetails[index].Name,
                    mapDetails[index].Address,
                    index + 1,
                  )
                : mapDetails[index]
                            .Name
                            .toLowerCase()
                            .contains(filter.toLowerCase()) ||
                        mapDetails[index]
                            .Address
                            .toLowerCase()
                            .contains(filter.toLowerCase()) ||
                        mapDetails[index]
                            .Zone
                            .toLowerCase()
                            .contains(filter.toLowerCase())
                    ? _boxes(
                        mapDetails[index].Lat,
                        mapDetails[index].Long,
                        mapDetails[index].Name,
                        mapDetails[index].Address,
                        index + 1,
                      )
                    : Container();
          },
        ),
      ),
    );
  }

  _onSelected(int index) {
    setState(() => _selectedIndex = index);
  }

  Widget _boxes(double lat, double long, String storeName, String storeAddress,
      int index) {
    return GestureDetector(
      onTap: () {
        _gotoLocation(lat, long);
        _onSelected(index);
      },
      child: Container(
        child: new FittedBox(
          child: Container(
            margin: EdgeInsets.all(10.0),
            child: Material(
                color: _selectedIndex != null && _selectedIndex == index
                    ? Colors.greenAccent.shade100
                    : Colors.white,
                elevation: 5.0,
                borderRadius: BorderRadius.circular(24.0),
                shadowColor: Color(0x802196F3),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: _selectedIndex == index
                          ? myDetailsContainerRegister(
                              storeName, storeAddress, lat, long)
                          : myDetailsContainer1(storeName, storeAddress),
                    ),
                  ],
                )),
          ),
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

  Widget _buildSearchBox() {
    return Container(
      margin: EdgeInsets.all(10.0),
      decoration:
          new BoxDecoration(shape: BoxShape.rectangle, color: Colors.white),
      child: TextField(
        decoration: InputDecoration(
            border:
                OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
            labelText: "Name/Address",
            hintText: "Search by name or Address(Jurong)"),
        controller: controller,
      ),
    );
  }
}
