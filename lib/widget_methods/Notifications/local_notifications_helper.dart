import 'package:flutter/cupertino.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

NotificationDetails get _ongoing {
  final androidChannelSpecifics = AndroidNotificationDetails(
      'MyAcuvue', 'MyAcuvue', 'MyAcuvue',
      importance: Importance.Max,
      priority: Priority.High,
      ongoing: true,
      autoCancel: true);
  final iosChannelSpecifics = IOSNotificationDetails();
  return NotificationDetails(androidChannelSpecifics, iosChannelSpecifics);
}

showOngoingNotification(FlutterLocalNotificationsPlugin notifications,
        {@required String title,
        @required String body,
        @required NotificationDetails type,
        int id = 0}) =>
    showNotification(notifications, title: title, body: body, type: _ongoing);

Future showNotification(FlutterLocalNotificationsPlugin notifications,
        {@required String title,
        @required String body,
        @required NotificationDetails type,
        int id = 0}) =>
    notifications.show(id, title, body, type);
