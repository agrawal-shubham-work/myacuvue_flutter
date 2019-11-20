import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/dialog/custom_dialog.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:my_acuvue_flutter/utilities/get_current_user_id.dart';
import 'package:my_acuvue_flutter/utilities/global_variable.dart';

class myDetailsContainerRegister extends StatefulWidget {
  final String storeName, storeAddress;
  double lat, long;

  myDetailsContainerRegister(
      this.storeName, this.storeAddress, this.lat, this.long);

  @override
  _myDetailsContainerRegisterState createState() =>
      _myDetailsContainerRegisterState();
}

class _myDetailsContainerRegisterState
    extends State<myDetailsContainerRegister> {
  bool isUserRegistered = true, loadData = false;

  Future<void> checkDataIfExists(String userId) async {
    final snapShot =
        await Firestore.instance.collection("form").document(userId).get();
    if (snapShot.exists) {
      setState(() {
        isUserRegistered = true;
        loadData = false;
      });
    } else {
      setState(() {
        isUserRegistered = false;
        loadData = false;
      });
    }
  }

  Map<String, dynamic> toJson() => {
        "storename": widget.storeName,
        "storeaddress": widget.storeAddress,
        "lat": widget.lat,
        "long": widget.long,
      };

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(toJson());
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10.0),
      width: 250.0,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Text(
                  widget.storeName,
                  style: kStoreName,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Color(0xFF013F7C),
                  child: FlatButton(
                    onPressed: () async {
                      setState(() {
                        loadData = true;
                      });
                      checkDataIfExists(GlobalVariable.userId);
                      isUserRegistered
                          ? saveDataInDatabase(GlobalVariable.userId)
                          : showDialog(
                              context: context,
                              builder: (BuildContext context) => CustomDialog(
                                title: "Store Selected ${widget.storeName}",
                                description:
                                    "Cannot register optical store. Device is not registered.",
                                buttonText: "Okay",
                              ),
                            );
                    },
                    child: loadData
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Text(
                            'Register',
                            style:
                                TextStyle(fontSize: 10.0, color: Colors.white),
                          ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10.0,
          ),
          Text(
            widget.storeAddress,
            style: kStoreAddress,
          ),
        ],
      ),
    );
  }

  saveDataInDatabase(String userId) async {
    await Firestore.instance
        .collection("store")
        .document(userId)
        .setData(toJson())
        .whenComplete(() {
      Navigator.pop(context, true);
    });
  }
}
