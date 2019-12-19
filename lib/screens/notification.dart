import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/dialog/confirmationdialog.dart';
import 'package:my_acuvue_flutter/utilities/global_variable.dart';
import 'package:my_acuvue_flutter/widget_methods/Notifications/notificationbox.dart';

class Notifications extends StatefulWidget {
  static const String routeName = '/notifications';

  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: createNotificationBox(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            if (GlobalVariable.notificationList.length != 0)
              showConfirmationDialog(context, "Notification",
                  "Do you really want to delete all notification", () {
                Navigator.pop(context);
              }, () {
                setState(() {
                  GlobalVariable.notificationList.clear();
                });
                Navigator.pop(context);
              });
            else {
              final snackbar = SnackBar(
                content: Text('No Notification to delete'),
                duration: Duration(milliseconds: 500),
              );
              _scaffoldkey.currentState.showSnackBar(snackbar);
            }
          });
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
