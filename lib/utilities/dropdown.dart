import 'package:flutter/material.dart';

class DropDownMainWidget extends StatelessWidget {
  final List<String> dataList;
  final Function onTap;
  final String selectedValue;

  DropDownMainWidget(this.dataList, this.onTap, this.selectedValue);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: Container(
        height: 50.0,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7.0),
            border: Border.all(color: Colors.grey)),
        child: Padding(
          padding: EdgeInsets.all(10.0),
          child: DropdownButton<String>(
            style: TextStyle(
              color: Color(0xFf013F7C),
            ),
            hint: Text("Select"),
            value: selectedValue == '' ? 'Select' : selectedValue,
            items: dataList.map((String value) {
              return new DropdownMenuItem<String>(
                value: value,
                child: new Text(value),
              );
            }).toList(),
            isExpanded: true,
            onChanged: onTap,
          ),
        ),
      ),
    );
  }
}
