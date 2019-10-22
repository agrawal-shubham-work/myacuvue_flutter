import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:my_acuvue_flutter/utilities/global_variable.dart';
import 'package:my_acuvue_flutter/widget_methods/Notifications/notificationbox.dart';

class Notifications extends StatefulWidget {
  static const String routeName = '/notifications';
  @override
  _NotificationsState createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Notifications'),
      ),
      body: createNotificationBox(),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            GlobalVariable.notificationList.clear();
          });
        },
        child: Icon(Icons.delete),
      ),
    );
  }
}
