import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/check_date.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'dart:io' show Platform;

class DateTimePickerMainWidget extends StatefulWidget {
  @override
  _DateTimePickerMainWidgetState createState() =>
      _DateTimePickerMainWidgetState();
}

class _DateTimePickerMainWidgetState extends State<DateTimePickerMainWidget> {
  String _date = "Select DOB";

  Future<Null> _selectAndroidDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
        context: context,
        initialDate: DateTime.now(),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null)
      setState(() {
        String month = checkDate(picked.month);
        _date = '$month ${picked.day}, ${picked.year}';
      });
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Platform.isAndroid
          ? _selectAndroidDate(context)
          : _selectIOSDate(context),
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
                child: Text(_date == '' ? 'Select DOB' : _date),
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

  _selectIOSDate(BuildContext context) {
    DatePicker.showDatePicker(context,
        theme: DatePickerTheme(
          containerHeight: 210.0,
        ),
        showTitleActions: true,
        maxTime: DateTime.now(), onConfirm: (date) {
      String month = checkDate(date.month);
      setState(() {
        _date = '$month ${date.day}, ${date.year}';
      });
    }, currentTime: DateTime.now(), locale: LocaleType.en);
  }
}
