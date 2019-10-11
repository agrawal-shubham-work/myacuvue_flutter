import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';

class myDetailsContainer1 extends StatelessWidget {
  final String storeName, storeAddress;

  myDetailsContainer1(this.storeName, this.storeAddress);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              storeName,
              style: kRegisterStoreHeading,
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(
              storeAddress,
              style: kRegisterStoreSubHeading,
            ),
          ),
        ],
      ),
    );
  }
}
