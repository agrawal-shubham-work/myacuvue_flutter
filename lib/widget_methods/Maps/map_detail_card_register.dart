import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:my_acuvue_flutter/dialog/custom_dialog.dart';

class myDetailsContainerRegister extends StatelessWidget {
  final String storeName, storeAddress;

  myDetailsContainerRegister(this.storeName, this.storeAddress);

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
                  storeName,
                  style: kStoreName,
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  color: Color(0xFF013F7C),
                  child: FlatButton(
                    onPressed: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) => CustomDialog(
                          title: "Store Selected $storeName",
                          description:
                              "Cannot register optical store. Device is not registered.",
                          buttonText: "Okay",
                        ),
                      );
                    },
                    child: Text(
                      'Register',
                      style: TextStyle(fontSize: 10.0, color: Colors.white),
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
            storeAddress,
            style: kStoreAddress,
          ),
        ],
      ),
    );
  }
}
