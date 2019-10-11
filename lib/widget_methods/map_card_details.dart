import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';

class myDetailsContainer1 extends StatelessWidget {
  final String storeName, storeAddress;
  final int currentIndex, selectedIndex;

  myDetailsContainer1(
      this.storeName, this.storeAddress, this.currentIndex, this.selectedIndex);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Expanded(
                flex: 2,
                child: Text(
                  storeName,
                  style: kRegisterStoreHeading,
                ),
              ),
              selectedIndex == currentIndex
                  ? createFlatButton()
                  : SizedBox(
                      width: 0.0,
                      height: 0.0,
                    )
            ],
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

  Widget createFlatButton() {
    return Expanded(
      flex: 1,
      child: Container(
        color: Color(0xFF013F7C),
        child: FlatButton(
          child: Text(
            'Register',
            style: TextStyle(fontSize: 10.0, color: Colors.white),
          ),
        ),
      ),
    );
  }
}
