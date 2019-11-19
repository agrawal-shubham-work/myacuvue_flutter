import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/screens/main_map.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:my_acuvue_flutter/utilities/get_current_user_id.dart';
import 'package:my_acuvue_flutter/widget_methods/Maps/calendar%20Widget.dart';
import 'package:my_acuvue_flutter/widget_methods/para_style_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class MainStore extends StatefulWidget {
  static const String routeName = '/mainstore';
  @override
  _MainStoreState createState() => _MainStoreState();
}

class _MainStoreState extends State<MainStore> {
  bool dataInRegisteredBase = false;
  bool dataLoading = true;
  String storeName, storeAddress;
  double lat, long;

  Future<void> checkDataIfExists() async {
    String userId = await inputData();
    print(userId);
    final snapShot =
        await Firestore.instance.collection("store").document(userId).get();
    if (snapShot.exists) {
      setState(() {
        getDataFromDataBase(userId);
        dataInRegisteredBase = true;
        dataLoading = false;
      });
    } else {
      setState(() {
        dataInRegisteredBase = false;
        dataLoading = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkDataIfExists();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: dataLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : dataInRegisteredBase
              ? showSelectedStoreWidget()
              : SelectStoreWidget(context),
    );
  }

  Widget showSelectedStoreWidget() {
    return storeName == null
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Card(
            elevation: 8.0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0)),
            margin: EdgeInsets.all(5.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(10.0),
                      child: Icon(
                        Icons.store,
                        color: Color(0xff013f7c),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.all(10.0),
                              child: Text(
                                storeName,
                                style: kStoreNameStyle,
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.all(5.0),
                              child: Text(
                                storeAddress,
                                style: kStoreAddressStyle,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pushNamed(MainMap.routeName);
                      },
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: Icon(
                          Icons.close,
                          color: Color(0xff013f7c),
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 5.0),
                  child: Row(
                    children: <Widget>[
                      MakeStoreCardBTN("CALL", () {
                        _launchCaller("800-101-3130");
                      }),
                      MakeStoreCardBTN("BOOKING", () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return BookDate();
                        }));
                      }),
                      MakeStoreCardBTN("DIRECTIONS", () {}),
                    ],
                  ),
                )
              ],
            ),
          );
  }

  Expanded MakeStoreCardBTN(String text, Function onTaped) {
    return Expanded(
      child: InkWell(
        onTap: onTaped,
        child: Container(
          padding: EdgeInsets.all(15.0),
          margin: EdgeInsets.all(2.0),
          decoration: BoxDecoration(
              color: Color(0xff013f7c),
              borderRadius: BorderRadius.circular(5.0)),
          child: Text(
            text,
            style: kRewardBtn,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  _launchCaller(String telNo) async {
    String url = "tel:$telNo";
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  Container SelectStoreWidget(BuildContext context) {
    return Container(
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushNamed(MainMap.routeName);
            },
            child: Container(
              child: Image.asset("images/add_ecp_normal.png"),
            ),
          ),
          PrivacyParaWidget('Select ECP', kStoreHeading),
          Text(
            mStorePara,
            style: kStoreSubHeading,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }

  Future<void> getDataFromDataBase(String id) async {
    String storeNaame, storeAdddress;
    double latitude, longitude;
    await Firestore.instance.collection('store').document(id).get().then(
        (DocumentSnapshot) =>
            storeNaame = DocumentSnapshot.data['storename'].toString());
    await Firestore.instance.collection('store').document(id).get().then(
        (DocumentSnapshot) =>
            storeAdddress = DocumentSnapshot.data['storeaddress'].toString());
    await Firestore.instance.collection('store').document(id).get().then(
        (DocumentSnapshot) =>
            latitude = DocumentSnapshot.data['lat'].toDouble());
    await Firestore.instance.collection('store').document(id).get().then(
        (DocumentSnapshot) =>
            longitude = DocumentSnapshot.data['long'].toDouble());

    setState(() {
      storeName = storeNaame;
      storeAddress = storeAdddress;
      lat = latitude;
      long = longitude;
    });
  }
}
