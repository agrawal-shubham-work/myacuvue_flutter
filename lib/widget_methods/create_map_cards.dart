import 'package:flutter/material.dart';
import 'map_card_details.dart';

class MapBoxes extends StatelessWidget {
  final String storeName, storeAddress;
  final Function onTaped;

  MapBoxes(this.storeName, this.storeAddress, this.onTaped);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTaped,
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: new FittedBox(
          child: Material(
            color: Colors.white,
            elevation: 5.0,
            borderRadius: BorderRadius.circular(24.0),
            shadowColor: Color(0x802196F3),
            child: Container(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: myDetailsContainer1(storeName, storeAddress),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
