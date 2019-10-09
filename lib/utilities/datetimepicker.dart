import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class DateTimePickerMainWidget extends StatefulWidget {
  @override
  _DateTimePickerMainWidgetState createState() =>
      _DateTimePickerMainWidgetState();
}

class _DateTimePickerMainWidgetState extends State<DateTimePickerMainWidget> {
  String selectedDate = '';
  final f = new DateFormat('yyyy-MM-dd');

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked.toString();
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _selectDate(context),
      child: Container(
          margin: EdgeInsets.only(top: 10.0),
          width: double.infinity,
          height: 50.0,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              border: Border.all(color: Colors.grey)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(selectedDate.toString() == ''
                    ? 'Select DOB'
                    : selectedDate.toString()),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: Icon(
                  Icons.date_range,
                  color: Colors.grey,
                ),
              ),
            ],
          )),
    );
  }
}
