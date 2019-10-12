import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';

class myDetailsContainer1 extends StatelessWidget {
  final String storeName, storeAddress;

  myDetailsContainer1(this.storeName, this.storeAddress);

  @override
  Widget build(BuildContext context) {
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
}
