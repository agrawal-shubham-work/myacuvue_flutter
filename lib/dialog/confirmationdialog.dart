import 'package:flutter/material.dart';

showConfirmationDialog(BuildContext context, String title, String message,
    Function close, Function accept) {
  // flutter defined function
  showDialog(
    context: context,
    builder: (BuildContext context) {
      // return object of type Dialog
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: <Widget>[
          // usually buttons at the bottom of the dialog
          FlatButton(
            child: Text("CANCEL"),
            onPressed: close,
          ),
          FlatButton(
            child: Text("ACCEPT"),
            onPressed: accept,
          ),
        ],
      );
    },
  );
}
