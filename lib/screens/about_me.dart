import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:my_acuvue_flutter/utilities/textformfield.dart';
import 'package:my_acuvue_flutter/utilities/dropdown.dart';
import 'package:my_acuvue_flutter/utilities/datetimepicker.dart';
import 'package:my_acuvue_flutter/utilities/checkbox.dart';

class AboutMe extends StatefulWidget {
  static const String routeName = '/aboutme';
  @override
  _AboutMeState createState() => _AboutMeState();
}

class _AboutMeState extends State<AboutMe> {
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
        _selectedGender == null ||
        _selectedSpectacles == null ||
        _selectedContactLenses == null ||
        _selectedContactLenseMonth == null) {
      buttonColor = Colors.grey;
    } else {
      buttonColor = Color(0xFf013F7C);
    }
  }

  @override
  void initState() {
    validateFields();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;

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
              }, _firstNameController),
            ),
            TextFormFieldWidget(
              'Last Name',
              true,
              TextFieldMainWidget('Agrawal', TextInputType.text, (value) {
                setState(() {
                  _lastname = value;
                  validateFields();
                });
              }, _lastNameController),
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
              }, _emailController),
            ),
            TextFormFieldWidget(
              'NRIC/FIN Number',
              true,
              TextFieldMainWidget('abcd1234ae', TextInputType.number, (value) {
                setState(() {
                  _nric = value;
                  validateFields();
                });
              }, _nricController),
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
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text('Privacy Policy', style: kPrivacyHeading),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(mPrivacyPara1, style: kPrivacyPara),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(mPrivacyPara2, style: kPrivacyPara),
            ),
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
                      margin: EdgeInsets.all(5.0),
                      color: Colors.grey,
                      child: FlatButton(
                        child: Text(
                          'Cancel',
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

class TextFormFieldWidget extends StatelessWidget {
  final String heading;
  final bool isMandatory;
  final Widget childFunct;

  TextFormFieldWidget(
      @required this.heading, @required this.isMandatory, this.childFunct);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.only(right: 2.0),
                  child: Text(
                    '$heading',
                    style: kFormHeadingStyle,
                  )),
              isMandatory
                  ? Text(
                      '*',
                      style: kMandatorySign,
                    )
                  : SizedBox(
                      width: 0.0,
                    ),
            ],
          ),
          childFunct
        ],
      ),
    );
  }
}
