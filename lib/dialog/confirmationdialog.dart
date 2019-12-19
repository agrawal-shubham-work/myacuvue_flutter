import 'package:flutter/material.dart';

showConfirmationDialog(BuildContext context, String title, String message,
    Function close, Function accept) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: Text(
          title,
          style: TextStyle(
            fontFamily: 'GRABBOLD',
          ),
        ),
        content: Text(message),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          FlatButton(
            child: Text(
              "CANCEL",
              style: TextStyle(fontFamily: 'GRABBOLD'),
            ),
            onPressed: close,
          ),
          FlatButton(
            child: Text(
              "ACCEPT",
              style: TextStyle(fontFamily: 'GRABBOLD'),
            ),
            onPressed: accept,
          ),
        ],
      );
    },
  );
}
