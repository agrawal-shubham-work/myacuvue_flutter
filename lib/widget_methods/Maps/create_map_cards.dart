import 'package:flutter/material.dart';

import 'map_card_details.dart';

class MapBoxes extends StatefulWidget {
  final String storeName, storeAddress;
  final int currentIndex;
  int selectedIndex;
  final Function onTaped;

  MapBoxes(this.storeName, this.storeAddress, this.currentIndex,
      this.selectedIndex, this.onTaped);

  @override
  _MapBoxesState createState() => _MapBoxesState();
}

class _MapBoxesState extends State<MapBoxes> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTaped,
      child: Container(
        margin: EdgeInsets.all(10.0),
        child: new FittedBox(
          child: Material(
            color: Colors.white,
            elevation: 10.0,
            shadowColor: Color(0x802196F3),
            child: Container(
              color: widget.selectedIndex == widget.currentIndex
                  ? Colors.green.shade200
                  : Colors.white,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: myDetailsContainer1(
                    widget.storeName,
                    widget.storeAddress,
                    widget.currentIndex,
                    widget.selectedIndex),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
