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
  bool dataInRegisteredBase = false,
      appointmentData = false,
      bookAppointmentBTN;
  bool dataLoading = true;
  String storeName,
      storeAddress,
      appointmentDate,
      appointmentTime,
      appointmentStatus;
  double lat, long;

  Future<void> checkDataIfExists() async {
    String userId = await inputData();
    final snapShot =
        await Firestore.instance.collection("store").document(userId).get();
    if (snapShot.exists) {
      setState(() {
        getDataFromDataBase(userId).whenComplete(() {
          dataInRegisteredBase = true;
          checkDataInAppointment(userId);
        });
      });
    } else {
      setState(() {
        dataInRegisteredBase = false;
        dataLoading = false;
      });
    }
  }

  Future<void> checkDataInAppointment(String userId) async {
    final snapShot = await Firestore.instance
        .collection("appointment")
        .document(userId)
        .get();
    if (snapShot.exists) {
      setState(() {
        getFromAppointmentDatabase(userId).whenComplete(() {
          appointmentData = true;
          dataLoading = false;
          bookAppointmentBTN = false;
        });
      });
    } else {
      setState(() {
        appointmentData = false;
        dataLoading = false;
        bookAppointmentBTN = true;
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
                      onTap: () async {
                        await Navigator.of(context)
                            .pushNamed(MainMap.routeName)
                            .then((result) async {
                          if (result == true) {
                            setState(() {
                              dataLoading = true;
                              checkDataIfExists();
                            });
                          }
                        });
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
                      Expanded(
                        child: InkWell(
                          onTap: () async {
                            if (bookAppointmentBTN) {
                              await Navigator.push(context,
                                  MaterialPageRoute(builder: (context) {
                                return BookDate();
                              })).then((result) async {
                                if (result == true) {
                                  dataLoading = true;
                                  checkDataIfExists();
                                }
                              });
                            }
                          },
                          child: Container(
                            padding: EdgeInsets.all(15.0),
                            margin: EdgeInsets.all(2.0),
                            decoration: BoxDecoration(
                                color: bookAppointmentBTN
                                    ? Color(0xff013f7c)
                                    : Colors.grey,
                                borderRadius: BorderRadius.circular(5.0)),
                            child: Text(
                              'BOOKING',
                              style: kRewardBtn,
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                      ),
                      MakeStoreCardBTN("DIRECTIONS", () {}),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: !appointmentData
                      ? Center(
                          child: Text(
                            'No Appointment Booked',
                            style: TextStyle(
                                fontSize: 16.0, color: Color(0xff013f7c)),
                          ),
                        )
                      : Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 5.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      appointmentDate,
                                      style: kStoreAddress,
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(
                                      appointmentTime,
                                      style: kStoreAddress,
                                    ),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: <Widget>[
                                    Text(
                                      'Status:',
                                      style: kContactUsTextStyle,
                                    ),
                                    Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 4.0),
                                      padding: EdgeInsets.all(10.0),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: appointmentStatus == 'pending'
                                            ? Colors.yellow.shade700
                                            : Colors.green.shade700,
                                      ),
                                    ),
                                    Text(
                                      appointmentStatus == 'pending'
                                          ? 'Pending'
                                          : 'Success',
                                      style: kContactUsTextStyle,
                                    ),
                                  ],
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Row(
                                  children: <Widget>[
                                    InkWell(
                                      onTap: () async {
                                        await Navigator.push(context,
                                            MaterialPageRoute(
                                                builder: (context) {
                                          return BookDate();
                                        })).then((result) async {
                                          if (true) {
                                            dataLoading = true;
                                            checkDataIfExists();
                                          }
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.all(10.0),
                                        margin: EdgeInsets.only(right: 5.0),
                                        color: Color(0xff013f7c),
                                        child: Text(
                                          'Reschedule',
                                          style: kRewardBtn,
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () async {
                                        String userId = await inputData();
                                        Firestore.instance
                                            .collection("appointment")
                                            .document(userId)
                                            .delete()
                                            .then((result) {
                                          dataLoading = true;
                                          checkDataIfExists();
                                        });
                                      },
                                      child: Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 10.0, horizontal: 25.0),
                                        color: Color(0xff013f7c),
                                        child: Text(
                                          'Cancel',
                                          style: kRewardBtn,
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                ),
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
    DocumentSnapshot snapshot =
        await Firestore.instance.collection("store").document(id).get();
    setState(() {
      storeName = snapshot['storename'];
      storeAddress = snapshot['storeaddress'];
      lat = snapshot['lat'].toDouble();
      long = snapshot['storename'].toDouble();
    });
  }

  Future<void> getFromAppointmentDatabase(String userId) async {
    DocumentSnapshot snapshot = await Firestore.instance
        .collection("appointment")
        .document(userId)
        .get();

    setState(() {
      appointmentDate = snapshot['date'];
      appointmentTime = snapshot['timing'];
      appointmentStatus = snapshot['status'];
    });
  }

  addDataToList(String name, String address, double lat, double long) {
    setState(() {
      storeName = name;
      storeAddress = address;
      lat = lat;
      long = long;
    });
  }
}
