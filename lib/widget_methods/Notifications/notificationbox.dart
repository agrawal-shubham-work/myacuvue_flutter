import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';

class createNotificationBox extends StatefulWidget {
  @override
  _createNotificationBoxState createState() => _createNotificationBoxState();
}

class _createNotificationBoxState extends State<createNotificationBox> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: Row(
        children: <Widget>[Image.asset("")],
      ),
    );
  }
}
