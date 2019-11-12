import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:my_acuvue_flutter/utilities/get_current_user_id.dart';
import 'package:my_acuvue_flutter/widget_methods/Forms/datetimepicker.dart';
import 'package:my_acuvue_flutter/models/notification_model.dart' as Inside;
import 'package:my_acuvue_flutter/models/form_models.dart';
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
  var notifications = FlutterLocalNotificationsPlugin();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _nricController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  final databaseRef = Firestore.instance;
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  bool showCircularBar = true,
      dataInDatabase,
      updateBtnBar = false,
      dataCircularBar = true,
      dataSaved,
      firstNameEdited = false,
      lastNameEdited = false,
      emailEdited = false,
      enableUpdateBTN = false;

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  String dropdownValue;
  String userId,
      firstNameData,
      lastNameData,
      genderData,
      birthDateData,
      emailData,
      editedFirstName,
      editedLastName,
      editedEmailId;
  Color buttonColor = Color(0xFf013F7C);

  String _firstname = '',
      _lastname = '',
      _email = '',
      _nric = '',
      _selectedGender,
      _selectedSpectacles,
      _selectedContactLenses,
      _selectedContactLenseMonth;

  bool checkPrivacyState1 = false,
      checkPrivacyState2 = false,
      submitButtonEnabled;

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
      submitButtonEnabled = false;
    } else {
      if (_selectedContactLenses == 'No') {
        buttonColor = Color(0xFf013F7C);
        submitButtonEnabled = true;
        print(submitButtonEnabled);
      } else {
        if (_selectedContactLenseMonth != null) {
          buttonColor = Color(0xFf013F7C);
          submitButtonEnabled = true;
          print(submitButtonEnabled);
        } else {
          buttonColor = Colors.grey;
          submitButtonEnabled = false;
        }
      }
    }
  }

  Future<void> checkDataIfExists() async {
    userId = await inputData();
    final snapShot =
        await Firestore.instance.collection("form").document(userId).get();
    if (snapShot.exists) {
      setState(() {
        stroeDatainFields(userId);
        dataInDatabase = true;
        showCircularBar = false;
      });
    } else {
      setState(() {
        dataInDatabase = false;
        showCircularBar = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    checkDataIfExists();
    var settingAndroid = AndroidInitializationSettings('app_icon');
    var settingIOS = IOSInitializationSettings(
        onDidReceiveLocalNotification: (id, title, body, payload) =>
            onSelectNotification(payload));
    notifications.initialize(InitializationSettings(settingAndroid, settingIOS),
        onSelectNotification: onSelectNotification);
  }

  Future onSelectNotification(String payload) async =>
      await Navigator.of(context).pushNamed(AboutMe.routeName);

  void saveUserDataInDatabase() async {
    userId = await inputData();
    FormModel form = FormModel(
        _firstname,
        _lastname,
        _selectedGender,
        GlobalVariable.userDOB,
        _email,
        _nric,
        _selectedSpectacles,
        _selectedContactLenses,
        _selectedContactLenses == 'No' ? "No" : _selectedContactLenseMonth);
    await databaseRef
        .collection("form")
        .document(userId)
        .setData(form.toJson());
    createSnackBar("OK");
    checkDataIfExists();
  }

  createSnackBar(String text) {
    final snackbar = SnackBar(
      content: Text(text),
      duration: Duration(milliseconds: 500),
    );
    _scaffoldkey.currentState.showSnackBar(snackbar);
  }

  Widget dataAlreadyTheirWidget() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
      child: ListView(
        scrollDirection: Axis.vertical,
        children: <Widget>[
          DataFromDatabaseFormWidget(
              "First Name",
              firstNameData,
              true,
              () {
                setState(() {
                  if (firstNameEdited) {
                    firstNameEdited = false;
                  } else
                    firstNameEdited = true;
                });
              },
              firstNameEdited,
              (String value) {
                setState(() {
                  firstNameData = value;
                  validateEditedFields();
                });
              }),
          DataFromDatabaseFormWidget(
              "Last Name",
              lastNameData,
              true,
              () {
                setState(() {
                  if (lastNameEdited) {
                    lastNameEdited = false;
                  } else
                    lastNameEdited = true;
                });
              },
              lastNameEdited,
              (String value) {
                setState(() {
                  lastNameData = value;
                  validateEditedFields();
                });
              }),
          DataFromDatabaseFormWidget(
              "Gender", genderData, false, () {}, false, () {}),
          DataFromDatabaseFormWidget(
              "Date of Birth", birthDateData, false, () {}, false, () {}),
          DataFromDatabaseFormWidget(
              "Email",
              emailData,
              true,
              () {
                setState(() {
                  if (emailEdited) {
                    emailEdited = false;
                  } else
                    emailEdited = true;
                });
              },
              emailEdited,
              (String value) {
                setState(() {
                  emailData = value;
                  validateEditedFields();
                });
              }),
          SizedBox(
            height: 20.0,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: Container(),
              ),
              Expanded(
                child: InkWell(
                  onTap: () {
                    if (enableUpdateBTN) {
                      setState(() {
                        updateBtnBar = true;
                      });
                      Map<String, dynamic> toJson() => {
                            "firstName": firstNameData,
                            "lastName": lastNameData,
                            "email": emailData,
                          };
                      Firestore.instance
                          .collection("form")
                          .document(userId)
                          .updateData(toJson())
                          .whenComplete(() {
                        createSnackBar("PROFILE UPDATED SUCCESSFULLY");
                        setState(() {
                          updateBtnBar = false;
                        });
                      });

                      stroeDatainFields(userId);
                      setState(() {
                        firstNameEdited = false;
                        lastNameEdited = false;
                        emailEdited = false;
                      });
                    } else
                      createSnackBar("No Change in data");
                  },
                  child: Container(
                    padding: EdgeInsets.all(15.0),
                    color: enableUpdateBTN ? Color(0xff013f7c) : Colors.grey,
                    child: updateBtnBar
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : Text(
                            'UPDATE',
                            style: kRewardBtn,
                            textAlign: TextAlign.center,
                          ),
                  ),
                ),
              ),
              Expanded(
                child: Container(),
              )
            ],
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldkey,
      appBar: AppBar(
        title: Text('About me'),
      ),
      body: showCircularBar
          ? Center(
              child: CircularProgressIndicator(),
            )
          : dataInDatabase
              ? dataAlreadyTheirWidget()
              : dataNotInDatabaseWidget(),
    );
  }

  Container dataNotInDatabaseWidget() {
    return Container(
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
                  child: GestureDetector(
                    onTap: () {
                      if (submitButtonEnabled) {
                        saveUserDataInDatabase();
                      }
                    },
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
                ),
              ],
            ),
          ),
        ],
      ),
    ));
  }

  Widget editTextField(String dataText, Function tapFunc) {
    return Padding(
      padding: EdgeInsets.only(top: 10.0),
      child: TextFormField(
        initialValue: dataText,
        keyboardType: TextInputType.text,
        decoration: new InputDecoration(
          counterText: '',
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5.0),
          ),
        ),
        onChanged: tapFunc,
      ),
    );
  }

  Future<void> stroeDatainFields(String id) async {
    String first, last, gen, birth, ema;
    await Firestore.instance.collection('form').document(id).get().then(
        (DocumentSnapshot) =>
            first = DocumentSnapshot.data['firstName'].toString());
    await Firestore.instance.collection('form').document(id).get().then(
        (DocumentSnapshot) =>
            last = DocumentSnapshot.data['lastName'].toString());
    await Firestore.instance.collection('form').document(id).get().then(
        (DocumentSnapshot) => gen = DocumentSnapshot.data['gender'].toString());
    await Firestore.instance.collection('form').document(id).get().then(
        (DocumentSnapshot) => birth = DocumentSnapshot.data['dob'].toString());
    await Firestore.instance.collection('form').document(id).get().then(
        (DocumentSnapshot) => ema = DocumentSnapshot.data['email'].toString());

    setState(() {
      firstNameData = first;
      editedFirstName = first;
      editedLastName = last;
      editedEmailId = ema;
      lastNameData = last;
      genderData = gen;
      birthDateData = birth;
      emailData = ema;
      dataCircularBar = false;
      dataSaved = true;
    });
  }

  Widget DataFromDatabaseFormWidget(
      String headingText,
      String dataText,
      bool isEditable,
      Function onTaped,
      bool checkEditState,
      Function onTapedForDataSaving) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            padding: EdgeInsets.all(3.0),
            child: Text(
              '$headingText :',
              style: TextStyle(
                fontSize: 18.0,
                color: Color(0xff013f7c),
              ),
            ),
          ),
        ),
        Expanded(
          child: dataCircularBar
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : checkEditState
                  ? editTextField(dataText, onTapedForDataSaving)
                  : dataSaved
                      ? Container(
                          padding: EdgeInsets.all(3.0),
                          child: Text(
                            dataText,
                            style: TextStyle(
                              fontSize: 18.0,
                              color: Colors.black,
                            ),
                            textAlign: TextAlign.start,
                          ),
                        )
                      : Container(),
        ),
        isEditable
            ? checkEditState
                ? GestureDetector(
                    onTap: onTaped,
                    child: Container(
                      padding: EdgeInsets.all(3.0),
                      height: 30.0,
                      width: 30.0,
                      child: Icon(
                        Icons.close,
                        color: Color(0xff013f7c),
                      ),
                    ),
                  )
                : GestureDetector(
                    onTap: onTaped,
                    child: Container(
                      padding: EdgeInsets.all(3.0),
                      height: 30.0,
                      width: 30.0,
                      child: Icon(
                        Icons.edit,
                        color: Color(0xff013f7c),
                      ),
                    ),
                  )
            : SizedBox(
                width: 30.0,
                height: 30.0,
              )
      ],
    );
  }

  validateEditedFields() {
    if (editedFirstName != firstNameData ||
        editedLastName != lastNameData ||
        editedEmailId != emailData) {
      setState(() {
        enableUpdateBTN = true;
      });
    } else
      setState(() {
        enableUpdateBTN = false;
      });
  }
}
