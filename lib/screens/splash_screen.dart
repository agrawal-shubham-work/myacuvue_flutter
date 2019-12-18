import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_acuvue_flutter/models/user_model.dart';
import 'package:my_acuvue_flutter/screens/home.dart';
import 'package:my_acuvue_flutter/utilities/constants.dart';
import 'package:my_acuvue_flutter/utilities/get_current_user_id.dart';
import 'package:my_acuvue_flutter/widget_methods/Forms/dropdown.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = "/splash";

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  final GlobalKey<ScaffoldState> _scaffoldkey = GlobalKey<ScaffoldState>();
  TextEditingController _controller;
  String selectedCountry;
  String sgpCodes;
  String selectedCountryCode;
  String phoneNo;
  String verificationId;
  String smsCode, currentUserId;
  final dataBaseRef = Firestore.instance;
  FocusNode focusNode1,
      focusNode2,
      focusNode3,
      focusNode4,
      focusNode5,
      focusNode6;
  String opt1, opt2, otp3, opt4, opt5, opt6;
  bool otpBox = false, isRecoverAcoount = false, startLoading = false;

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
      setState(() {
        otpBox = true;
        startLoading = false;
      });
    };

    final PhoneVerificationCompleted verifiedSuccess =
        (AuthCredential credential) {
      print('verified');
    };

    final PhoneVerificationFailed veriFailed = (AuthException exception) {
      print('${exception.message}');
      setState(() {
        startLoading = false;
      });
      final snackbar = SnackBar(
        content: Text('${exception.message}'),
        duration: Duration(milliseconds: 500),
      );
      _scaffoldkey.currentState.showSnackBar(snackbar);
    };

    await FirebaseAuth.instance
        .verifyPhoneNumber(
            phoneNumber: "+91$phoneNo",
            codeAutoRetrievalTimeout: autoRetrieve,
            codeSent: smsCodeSent,
            timeout: const Duration(seconds: 5),
            verificationCompleted: verifiedSuccess,
            verificationFailed: veriFailed)
        .catchError((e) {
      final snackbar = SnackBar(
        content: Text('${e}'),
        duration: Duration(milliseconds: 500),
      );
      _scaffoldkey.currentState.showSnackBar(snackbar);
      setState(() {
        startLoading = false;
      });
    }).whenComplete(() {
      setState(() {
        startLoading = true;
      });
    });
  }

  signIn() {
    final AuthCredential credential = PhoneAuthProvider.getCredential(
        verificationId: verificationId, smsCode: smsCode);
    FirebaseAuth.instance.signInWithCredential(credential).then((user) async {
      setState(() {
        otpBox = false;
      });
      String userId = await inputData();
      createRecord(userId);
      Navigator.of(context).pushReplacementNamed(Home.route);
    }).catchError((e) {
      final snackbar = SnackBar(
        content: Text("Please enter the correct OTP"),
        duration: Duration(milliseconds: 500),
      );
      _scaffoldkey.currentState.showSnackBar(snackbar);
    });
  }

  void createRecord(String id) async {
    User user = User("+91$phoneNo");
    await dataBaseRef.collection("users").document(id).setData(user.toJson());
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
      key: _scaffoldkey,
      body: Stack(
        children: <Widget>[
          mainPhotoWidget(),
          loadingContainer(),
          acuvueLogoContainer(),
          bottomMainContainer(),
        ],
      ),
    );
  }

  Widget loadingContainer() {
    return startLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : SizedBox(
            height: 0.0,
            width: 0.0,
          );
  }

  Widget mainPhotoWidget() {
    return SafeArea(
      child: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/splash_screen_main.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.85), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
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
          width: (MediaQuery.of(context).size.width) * 0.7,
          height: (MediaQuery.of(context).size.width) * 0.7,
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
        child: otpBox
            ? enterOtpWidget()
            : isRecoverAcoount
                ? recoverAccoutWidget()
                : enterPhoneNumberWidget(),
      ),
    );
  }

  Widget enterOtpWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        NumberandOtpTitleWidget(
            context, "OTP has been sent to $selectedCountryCode $phoneNo"),
        Row(
          mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            otpWidget(focusNode1, (String value) {
              if (value.length != 0) {
                FocusScope.of(context).requestFocus(focusNode2);
              }
              opt1 = value;
            }),
            otpWidget(focusNode2, (String value) {
              if (value.length == 0)
                FocusScope.of(context).requestFocus(focusNode1);
              else {
                FocusScope.of(context).requestFocus(focusNode3);
              }
              opt2 = value;
            }),
            otpWidget(focusNode3, (String value) {
              if (value.length == 0)
                FocusScope.of(context).requestFocus(focusNode2);
              else {
                FocusScope.of(context).requestFocus(focusNode4);
              }
              otp3 = value;
            }),
            otpWidget(focusNode4, (String value) {
              if (value.length == 0)
                FocusScope.of(context).requestFocus(focusNode3);
              else {
                FocusScope.of(context).requestFocus(focusNode5);
              }
              opt4 = value;
            }),
            otpWidget(focusNode5, (String value) {
              if (value.length == 0)
                FocusScope.of(context).requestFocus(focusNode4);
              else {
                FocusScope.of(context).requestFocus(focusNode6);
              }
              opt5 = value;
            }),
            otpWidget(focusNode6, (String value) {
              if (value.length == 0) {
                FocusScope.of(context).requestFocus(focusNode5);
              }
              opt6 = value;
            }),
          ],
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          color: darkBlueColor,
          child: FlatButton(
            onPressed: () {
              smsCode = '$opt1$opt2$otp3$opt4$opt5$opt6';
              signIn();
            },
            child: Text(
              'Verify OTP',
              style: kReferBtn,
            ),
          ),
        ),
      ],
    );
  }

  Widget recoverAccoutWidget() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 2.0, top: 5.0, bottom: 5.0),
              child: InkWell(
                onTap: () {
                  setState(() {
                    isRecoverAcoount = false;
                  });
                },
                child: Icon(
                  Icons.close,
                  color: Color(0xff013f7c),
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(10.0),
          child: Text(
            'Recover your Account',
            style: TextStyle(
              color: Colors.black,
              fontSize: 20.0,
            ),
          ),
        ),
        createSocialBTN("Facebook"),
        createSocialBTN("Twitter"),
        createSocialBTN("Google"),
        Container(
            margin: EdgeInsets.only(bottom: 5.0),
            child: createSocialBTN("Email")),
      ],
    );
  }

  Widget createSocialBTN(String text) {
    return Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.only(right: 5.0, left: 5.0, top: 5.0),
      width: MediaQuery.of(context).size.width,
      color: Color(0xff013f7c),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              text,
              style: TextStyle(color: Colors.white, fontSize: 15.0),
            ),
          )
        ],
      ),
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
                      if (value == 'SGP') {
                        selectedCountryCode = null;
                        sgpCodes = "+65";
                      } else if (value == 'HKG') {
                        selectedCountryCode = '+852';
                        sgpCodes = null;
                        sgpCodes = null;
                      } else if (value == 'TWN') {
                        sgpCodes = null;
                        selectedCountryCode = '+886';
                        sgpCodes = null;
                      }
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
                                            selectedCountryCode = value;
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
                            inputFormatters: [
                              WhitelistingTextInputFormatter.digitsOnly
                            ],
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
          color: startLoading ? Colors.grey : darkBlueColor,
          child: FlatButton(
            onPressed: () {
              if (selectedCountryCode == null && sgpCodes == null) {
                final snackbar = SnackBar(
                  content: Text('Select your country code'),
                  duration: Duration(milliseconds: 500),
                );
                _scaffoldkey.currentState.showSnackBar(snackbar);
              } else
                verifyPhone();
            },
            child: Text(
              'Send Verification OTP',
              style: kReferBtn,
            ),
          ),
        ),
        Container(
          margin: EdgeInsets.symmetric(vertical: 10.0, horizontal: 5.0),
          width: MediaQuery.of(context).size.width,
          child: GestureDetector(
            onTap: () {
              setState(() {
                isRecoverAcoount = true;
              });
            },
            child: Text(
              'Recover my Account',
              style: kPrivacyPara,
              textAlign: TextAlign.end,
            ),
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

  otpWidget(this.focusNode, this.onTap);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        margin: EdgeInsets.all(5.0),
        child: TextFormField(
          textAlign: TextAlign.center,
          decoration: new InputDecoration(
            counterText: '',
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
          ),
          keyboardType: TextInputType.number,
          focusNode: focusNode,
          maxLength: 1,
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
