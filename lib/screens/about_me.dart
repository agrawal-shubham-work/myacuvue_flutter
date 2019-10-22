import 'package:intl/intl.dart';
import 'package:my_acuvue_flutter/widget_methods/Forms/datetimepicker.dart';
import 'package:my_acuvue_flutter/notification_model.dart' as Inside;
import 'package:my_acuvue_flutter/screens/home.dart';
import 'package:my_acuvue_flutter/utilities/global_variable.dart';
import 'package:my_acuvue_flutter/widget_methods/Forms/text_form_field_main_widget.dart';
import 'package:my_acuvue_flutter/widget_methods/Forms/text_form_field_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:my_acuvue_flutter/widget_methods/Forms/dropdown.dart';
import 'package:my_acuvue_flutter/utilities/check_date.dart';
import 'package:my_acuvue_flutter/widget_methods/Forms/checkbox.dart';
import 'package:my_acuvue_flutter/widget_methods/Notifications/local_notifications_helper.dart';
import 'package:my_acuvue_flutter/widget_methods/para_style_widget.dart';

class AboutMe extends StatefulWidget {
  static const String routeName = '/aboutme';
  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
  var notifications = new FlutterLocalNotificationsPlugin();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _nricController = TextEditingController();
  TextEditingController _emailController = TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dropdownValue;

  Color buttonColor = Color(0xFf013F7C);

  String _firstname = '',
      _lastname = '',
      _email = '',
      _nric = '',
      _selectedGender,
      _selectedSpectacles,
      _selectedContactLenses,
      _selectedContactLenseMonth;

  bool checkPrivacyState1 = false, checkPrivacyState2 = false;

  void validateFields() {
    if (_firstname.length == 0 ||
        _lastname.length == 0 ||
        _email.length == 0 ||
        _nric.length == 0 ||
        _selectedGender.length == 0 ||
        _selectedSpectacles.length == 0 ||
        _selectedContactLenses.length == 0 ||
        !checkPrivacyState2 ||
        !checkPrivacyState1) {
      buttonColor = Colors.grey;
    } else {
      if (_selectedContactLenses == 'No') {
        buttonColor = Color(0xFf013F7C);
      } else {
        if (_selectedContactLenseMonth != null)
          buttonColor = Color(0xFf013F7C);
        else
          buttonColor = Colors.grey;
      }
    }
  }

  @override
  void initState() {
    validateFields();
    super.initState();
    var settingAndroid = new AndroidInitializationSettings('app_icon');
    var settingIOS = new IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));
    notifications.initialize(InitializationSettings(settingAndroid, settingIOS),
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async =>
      await Navigator.of(context).pushNamed(AboutMe.routeName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('About me'),
      ),
      body: Container(
          child: Form(
        key: this._formKey,
        child: ListView(
          children: <Widget>[
            TextFormFieldWidget(
              'Firsr Name',
              true,
              TextFieldMainWidget('Shubham', TextInputType.text, (value) {
                setState(() {
                  _firstname = value;
                  validateFields();
                });
              }, _firstNameController, 50),
            ),
            TextFormFieldWidget(
              'Last Name',
              true,
              TextFieldMainWidget('Agrawal', TextInputType.text, (value) {
                setState(() {
                  _lastname = value;
                  validateFields();
                });
              }, _lastNameController, 50),
            ),
            TextFormFieldWidget(
              'Gender',
              true,
              DropDownMainWidget(genderList, (String value) {
                setState(() {
                  _selectedGender = value;
                  validateFields();
                });
              }, _selectedGender),
            ),
            TextFormFieldWidget(
              'Date of Birth',
              true,
              DateTimePickerMainWidget(),
            ),
            TextFormFieldWidget(
              'Email',
              true,
              TextFieldMainWidget('abc@xyz.com', TextInputType.emailAddress,
                  (value) {
                setState(() {
                  _email = value;
                  validateFields();
                });
              }, _emailController, 50),
            ),
            TextFormFieldWidget(
              'NRIC/FIN Number',
              true,
              TextFieldMainWidget('abcd1234ae', TextInputType.number, (value) {
                setState(() {
                  _nric = value;
                  validateFields();
                });
              }, _nricController, 9),
            ),
            TextFormFieldWidget(
              'Do you wear Spectacles?',
              true,
              DropDownMainWidget(spectacleList, (String value) {
                setState(() {
                  _selectedSpectacles = value;
                  validateFields();
                });
              }, _selectedSpectacles),
            ),
            TextFormFieldWidget(
              'Do you wear Contact Lenses?',
              true,
              DropDownMainWidget(contactLenseList, (String value) {
                setState(() {
                  _selectedContactLenses = value;
                  if (value == 'No') _selectedContactLenseMonth = null;
                  print(_selectedContactLenseMonth);
                  validateFields();
                });
              }, _selectedContactLenses),
            ),
            _selectedContactLenses == 'No' || _selectedContactLenses == null
                ? SizedBox(
                    width: 0.0,
                    height: 0.0,
                  )
                : TextFormFieldWidget(
                    'How long have you worn contact lenses?',
                    true,
                    DropDownMainWidget(contactLenseListMonth, (String value) {
                      setState(() {
                        _selectedContactLenseMonth = value;
                        validateFields();
                      });
                    }, _selectedContactLenseMonth),
                  ),
            PrivacyParaWidget('Privacy Policy', kPrivacyHeading),
            PrivacyParaWidget(mPrivacyPara1, kPrivacyPara),
            PrivacyParaWidget(mPrivacyPara2, kPrivacyPara),
            CheckBoxMainWidgetState(checkPrivacyState1, mCheckPrivacyPara1,
                (bool state) {
              setState(() {
                checkPrivacyState1 = state;
                validateFields();
              });
            }),
            CheckBoxMainWidgetState(checkPrivacyState2, mCheckPrivacyPara2,
                (bool state) {
              setState(() {
                checkPrivacyState2 = state;
                validateFields();
              });
            }),
            Container(
              margin: EdgeInsets.all(10.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    flex: 1,
                    child: Container(
                      margin: EdgeInsets.only(right: 5.0),
                      color: Colors.grey,
                      child: FlatButton(
                        onPressed: () {
                          var now = DateTime.now();
                          String moth = checkDate(now.month);
                          String date =
                              "$moth ${now.day}, ${now.year} ${DateFormat("H:m:s").format(now)}";

                          Inside.Notification notificaions = Inside.Notification(
                              "Registration",
                              "Complete your registration now to enjoy all the benefits of the MyACUVUE app.",
                              "$date");
                          GlobalVariable.notificationList.add(notificaions);
                          showOngoingNotification(notifications,
                              title: "Registration",
                              body:
                                  "Complete Registration now to enjoy all the benefits.");
                        },
                        child: Text(
                          'Skip',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Container(
                      color: buttonColor,
                      child: FlatButton(
                        child: Text(
                          'Submit',
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
