import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:my_acuvue_flutter/utilities/global_variable.dart';

class createNotificationBox extends StatefulWidget {
  @override
  _createNotificationBoxState createState() => _createNotificationBoxState();
}

class _createNotificationBoxState extends State<createNotificationBox> {
  @override
  Widget build(BuildContext context) {
    return GlobalVariable.notificationList.length == 0
        ? Container(
            child: Center(
              child: Text(
                'No Notification',
                style: kRewardTerms,
              ),
            ),
          )
        : ListView.builder(
            scrollDirection: Axis.vertical,
            itemCount: GlobalVariable.notificationList.length,
            itemBuilder: (BuildContext context, int index) {
              return createBox(index);
            },
          );
  }

  Widget createBox(int index) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Expanded(flex: 1, child: Image.asset("images/solace_app_icon.png")),
          Expanded(
            flex: 9,
            child: Container(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    GlobalVariable.notificationList[index].title,
                    style: kNotificationHeading,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                    child: Text(
                      GlobalVariable.notificationList[index].message,
                      style: kNotificationSubHeading,
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Text(
                      GlobalVariable.notificationList[index].date,
                      style: kNotificationDate,
                      textAlign: TextAlign.right,
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: FlatButton(
              onPressed: () {
                setState(() {
                  GlobalVariable.notificationList.removeAt(index);
                });
              },
              child: Icon(
                Icons.delete_forever,
                color: Color(0xFF013F7C),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
