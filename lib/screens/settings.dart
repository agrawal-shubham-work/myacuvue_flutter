import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';

class Settings extends StatefulWidget {
  static const String routeName = '/settings';

  @override
  _SettingsState createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  bool isMarketing = false;
  bool isAppointment = false;
  bool isReminders = false;
  bool isFacebook = false;
  bool isGoogle = false;
  bool isTwitter = false;
  bool isEmail = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Container(
        margin: EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Row(
              children: <Widget>[
                Expanded(
                  flex: 1,
                  child: CreateTextWidget('Language', kSettingText),
                ),
                CreateTextWidget('English', kSettingText),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: CreateTextWidget('Notifications', kSettingsHeading),
            ),
            _createSwitchContainer("Marketing", kSettingText, (val) {
              setState(() {
                isMarketing = val;
              });
            }, isMarketing),
            _createSwitchContainer("Appointments", kSettingText, (val) {
              setState(() {
                isAppointment = val;
              });
            }, isAppointment),
            _createSwitchContainer("Reminders", kSettingText, (val) {
              setState(() {
                isReminders = val;
              });
            }, isReminders),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 10.0),
              child: CreateTextWidget(
                  'Account recovery options', kSettingsHeading),
            ),
            _createSwitchContainer("Facebook", kSettingText, (val) {
              setState(() {
                isFacebook = val;
              });
            }, isFacebook),
            _createSwitchContainer("Twitter", kSettingText, (val) {
              setState(() {
                isTwitter = val;
              });
            }, isTwitter),
            _createSwitchContainer("Google", kSettingText, (val) {
              setState(() {
                isGoogle = val;
              });
            }, isGoogle),
            _createSwitchContainer("Email", kSettingText, (val) {
              setState(() {
                isEmail = val;
              });
            }, isEmail),
          ],
        ),
      ),
    );
  }

  Text CreateTextWidget(String text, TextStyle style) {
    return Text(
      text,
      style: style,
    );
  }

  Widget _createSwitchContainer(String titleText, TextStyle style,
      Function onChanged, bool selectedValue) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(color: Colors.grey),
        ),
      ),
      child: Row(
        children: <Widget>[
          Expanded(
            child: CreateTextWidget(titleText, style),
          ),
          Switch(
            onChanged: onChanged,
            value: selectedValue,
          )
        ],
      ),
    );
  }
}
