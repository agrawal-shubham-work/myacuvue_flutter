import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:my_acuvue_flutter/screens/home.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:my_acuvue_flutter/widget_methods/Forms/dropdown.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/splash";
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  TextEditingController _controller;
  String selectedCountry;
  String sgpCodes;
  String phoneNo;
  String verificationId;
  String smsCode;
  FocusNode focusNode1,
      focusNode2,
      focusNode3,
      focusNode4,
      focusNode5,
      focusNode6;

  @override
  void initState() {
    super.initState();

    focusNode1 = FocusNode();
    focusNode2 = FocusNode();
    focusNode3 = FocusNode();
    focusNode4 = FocusNode();
    focusNode5 = FocusNode();
    focusNode6 = FocusNode();

    _controller = TextEditingController();
  }

  @override
  void dispose() {
    _controller.dispose();
    focusNode1.dispose();
    focusNode2.dispose();
    focusNode3.dispose();
    focusNode4.dispose();
    focusNode5.dispose();
    focusNode6.dispose();
    super.dispose();
  }

  goToNextPage(context) {
    Navigator.of(context).pushNamed(Home.route);
  }

  Future<void> verifyPhone() async {
    final PhoneCodeAutoRetrievalTimeout autoRetrieve = (String verId) {
      this.verificationId = verId;
    };

    final PhoneCodeSent smsCodeSent = (String verId, [int forceCodeResend]) {
      this.verificationId = verId;
      smsCodeDialog(context).then((value) {
        print('Signed in');
      });
    };

    final PhoneVerificationCompleted verifiedSuccess =
        (AuthCredential credential) {
      print('verified');
    };

    final PhoneVerificationFailed veriFailed = (AuthException exception) {
      print('${exception.message}');
    };

    await FirebaseAuth.instance.verifyPhoneNumber(
        phoneNumber: "+91$phoneNo",
        codeAutoRetrievalTimeout: autoRetrieve,
        codeSent: smsCodeSent,
        timeout: const Duration(seconds: 5),
        verificationCompleted: verifiedSuccess,
        verificationFailed: veriFailed);
  }

  Future<bool> smsCodeDialog(BuildContext context) {
    return showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return new AlertDialog(
            title: Text('Enter sms Code'),
            content: TextField(
              onChanged: (value) {
                this.smsCode = value;
              },
            ),
            contentPadding: EdgeInsets.all(10.0),
            actions: <Widget>[
              new FlatButton(
                child: Text('Done'),
                onPressed: () {
                  FirebaseAuth.instance.currentUser().then((user) {
                    if (user != null) {
                      Navigator.of(context).pop();
                      Navigator.of(context).pushReplacementNamed(Home.route);
                    } else {
                      Navigator.of(context).pop();
                      signIn();
                    }
                  });
                },
              )
            ],
          );
        });
  }

  signIn() {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId, smsCode: smsCode);
    FirebaseAuth.instance.signInWithCredential(credential).then((user) {
      Navigator.of(context).pushReplacementNamed(Home.route);
    }).catchError((e) {
      print(e);
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<FirebaseUser>(
        future: FirebaseAuth.instance.currentUser(),
        builder: (BuildContext context, AsyncSnapshot<FirebaseUser> snapshot) {
          if (snapshot.hasData) {
            FirebaseUser user = snapshot.data; // this is your user instance
            print(snapshot.data);
            return Home("MyACUVUE");
          }
          return otpScreen();
        });
  }

  Widget otpScreen() {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          mainPhotoWidget(),
          acuvueLogoContainer(),
          bottomMainContainer(),
        ],
      ),
    );
  }

  Widget mainPhotoWidget() {
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Image.asset(
          "images/splash_screen_main.png",
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget acuvueLogoContainer() {
    return Align(
      alignment: Alignment.topCenter,
      child: Container(
        margin: EdgeInsets.only(top: 50.0),
        child: Image.asset(
          "images/splash_logo.png",
          width: 250.0,
          height: 250.0,
        ),
      ),
    );
  }

  Widget bottomMainContainer() {
    return Align(
      alignment: Alignment.bottomLeft,
      child: Container(
        decoration: BoxDecoration(
            color: Colors.white, borderRadius: BorderRadius.circular(5.0)),
        margin: EdgeInsets.all(10.0),
        child: enterPhoneNumberWidget(),
      ),
    );
  }

  Widget enterOtpWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        NumberandOtpTitleWidget(
            context, "Otp has been sent to $selectedCountry $phoneNo"),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            otpWidget(focusNode1,(String value){
              if(value.length!=0)
                {
                  FocusScope.of(context).requestFocus(focusNode2);
                  smsCode=value;
                }
            }),
            otpWidget(focusNode2,(String value){
              if(value.length==0)
                FocusScope.of(context).requestFocus(focusNode1);
              else{
                FocusScope.of(context).requestFocus(focusNode3);
                smsCode=smsCode+value;
              }
            }),
            otpWidget(focusNode3,(String value){
              if(value.length==0)
                FocusScope.of(context).requestFocus(focusNode2);
              else{
                FocusScope.of(context).requestFocus(focusNode4);
                smsCode=smsCode+value;
              }
            }),
            otpWidget(focusNode4,(String value){
              if(value.length==0)
                FocusScope.of(context).requestFocus(focusNode3);
              else{
                FocusScope.of(context).requestFocus(focusNode5);
                smsCode=smsCode+value;
              }
            }),
            otpWidget(focusNode5,(String value){
              if(value.length==0)
                FocusScope.of(context).requestFocus(focusNode4);
              else{
                FocusScope.of(context).requestFocus(focusNode6);
                smsCode=smsCode+value;
              }
            }),
            otpWidget(focusNode6,(String value){
              if(value.length==0)
                FocusScope.of(context).requestFocus(focusNode5);
              else
                smsCode=smsCode+value;
            }),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          color: darkBlueColor,
          child: FlatButton(
            child: Text(
              'Verify Otp',
              style: kReferBtn,
            ),
          ),
        ),
      ],
    );
  }

  Widget enterPhoneNumberWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        NumberandOtpTitleWidget(context, "Please enter your phone number"),
        Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Expanded(
              flex: 1,
              child: Container(
                padding: EdgeInsets.only(bottom: 10.0, left: 5.0),
                child: Material(
                  child: DropDownMainWidget(countryList, (String value) {
                    setState(() {
                      if (value != 'SGP') sgpCodes = null;
                      selectedCountry = value;
                    });
                  }, selectedCountry),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 5.0),
                height: 50.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(7.0),
                  border: Border.all(color: Colors.grey),
                ),
                child: Row(
                  children: <Widget>[
                    selectedCountry == null
                        ? Container()
                        : selectedCountry == 'HKG'
                            ? numberRowContainer('+852')
                            : selectedCountry == 'TWN'
                                ? numberRowContainer('+886')
                                : Container(
                                    padding:
                                        EdgeInsets.only(left: 10.0, right: 0.0),
                                    child: DropdownButton<String>(
                                      style: TextStyle(
                                        color: Color(0xFf013F7C),
                                      ),
                                      hint: Text("Select"),
                                      value: checkSelectedValue(sgpCodes),
                                      items: sgpCodeList.map((String value) {
                                        return new DropdownMenuItem<String>(
                                          value: value,
                                          child: new Text(value),
                                        );
                                      }).toList(),
                                      onChanged: (String value) {
                                        setState(
                                          () {
                                            sgpCodes = value;
                                          },
                                        );
                                      },
                                    ),
                                  ),
                    Expanded(
                      child: Container(
                        child: Material(
                          child: TextFormField(
                            maxLength: 10,
                            controller: _controller,
                            keyboardType: TextInputType.number,
                            decoration: new InputDecoration(
                              counterText: '',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                            onChanged: (String value) {
                              setState(() {
                                phoneNo = value;
                              });
                            },
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          color: darkBlueColor,
          child: FlatButton(
            onPressed: verifyPhone,
            child: Text(
              'Send Verification OTP',
              style: kReferBtn,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          width: MediaQuery.of(context).size.width,
          child: Text(
            'Recover my Account',
            style: kPrivacyPara,
            textAlign: TextAlign.end,
          ),
        )
      ],
    );
  }

  checkSelectedValue(String selectedValue) {
    if (selectedValue == '')
      return 'Select';
    else
      return selectedValue;
  }

  Widget numberRowContainer(String text) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.0),
      child: Text(
        text,
        style: kRewardTerms,
      ),
    );
  }
}

class otpWidget extends StatelessWidget {
  final FocusNode focusNode;
  final Function onTap;

  otpWidget(this.focusNode,this.onTap);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: TextField(
          keyboardType: TextInputType.number,
          focusNode: focusNode,
          autofocus: false,
          onChanged: onTap,
        ),
      ),
    );
  }
}

class NumberandOtpTitleWidget extends StatelessWidget {
  final BuildContext context;
  final String title;

  NumberandOtpTitleWidget(this.context, this.title);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Center(
        child: Container(
          margin: EdgeInsets.all(2.0),
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(color: Colors.grey),
            ),
          ),
          child: Center(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                title,
                style: kRewardTerms,
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
