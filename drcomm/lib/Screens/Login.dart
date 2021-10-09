import 'dart:async';
import 'package:drcomm/Screens/test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:pin_code_fields/pin_code_fields.dart';


enum MobileVerificationState {
  SHOW_MOBILE_FORM_STATE,
  SHOW_OTP_FORM_STATE,
}

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String phoneAppBar = 'Continue with Phone';
  String otpAppBar = 'Verify Phone';
  static Color downbar = Color(0xff202c3b);
  var onTapRecognizer;
  bool hasError = false;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  final formKey1 = GlobalKey<FormState>();
  TextEditingController textEditingController = TextEditingController();
  late StreamController<ErrorAnimationType> errorController;
  String currentText = "";

  // bool correct = true;
  String _otp_code = "";

  void initState() {
    onTapRecognizer = TapGestureRecognizer()
      ..onTap = () async {
        print('here');

        MobileSent();
      };
    errorController = StreamController<ErrorAnimationType>();
    super.initState();
  }

  MobileVerificationState currentState =
      MobileVerificationState.SHOW_MOBILE_FORM_STATE;
  bool showLoading = false;
  final _auth = FirebaseAuth.instance;
  String verificationID = "";

  void SignInWithPhoneAuthCredential(
      PhoneAuthCredential phoneAuthCredential) async {
    setState(() {
      showLoading = true;
    });

    try {
      final authCredential =
          await _auth.signInWithCredential(phoneAuthCredential);
      setState(() {
        showLoading = false;

        if (authCredential.user != null) {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Testing()));
        }
      });
    } on FirebaseAuthException catch (e) {
      setState(() {
        showLoading = false;
      });
      _scaffoldKey.currentState!
          .showSnackBar(SnackBar(content: Text(e.message.toString())));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Colors.white,
      key: _scaffoldKey,
      appBar: AppBar(
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            SystemNavigator.pop();
          },
          child: Icon(
            Icons.close,
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.white,
        title: Text(
          currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
              ? phoneAppBar
              : otpAppBar,
          style: GoogleFonts.roboto(fontSize: 25, color: Colors.green),
        ),
      ),
      // body:
      //     showLoading ? Center(child: CircularProgressIndicator()) : InputBox(),
      body: InputBox(),
    );
  }

  Widget InputBox() {
    return SingleChildScrollView(
      child: Container(
        color: Colors.white,
        // padding: EdgeInsets.all(20),
        child: currentState == MobileVerificationState.SHOW_MOBILE_FORM_STATE
            ? PhoneInput2(context)
            : OTPinput(context),
      ),
    );
  }

  static final TextEditingController controller = TextEditingController();
  static final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  // static String initialCountry = 'IN';
  String _phoneNo = "";
  PhoneNumber number = PhoneNumber(isoCode: 'IN');

  // it will take input from userand forward it for further verfication
  Widget PhoneInput2(context) {
    return Form(
      key: formKey,
      child: Container(
        padding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 30),
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Text(
              'You\'ll recieve a 6 Digit Code \n to verify next !',
              style: GoogleFonts.crimsonText(
                fontSize: 22,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 30,
            ),
            Container(
              decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.2),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20))),
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.all(15),
              child: Column(children: [
                InternationalPhoneNumberInput(
                  spaceBetweenSelectorAndTextField: 3,
                  scrollPadding: const EdgeInsets.all(2),
                  selectorButtonOnErrorPadding: 4.0,

                  cursorColor: Colors.blue,
                  hintText: 'Your Mobile Number',

                  onInputChanged: (PhoneNumber number) {
                    print("Here " + number.phoneNumber.toString());
                    _phoneNo = number.phoneNumber.toString();
                  },
                  onInputValidated: (bool value) {
                    print(value);
                  },
                  selectorConfig: SelectorConfig(
                    showFlags: true,
                    leadingPadding: 1.0,

                    // setSelectorButtonAsPrefixIcon :true,
                    selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
                  ),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.disabled,
                  selectorTextStyle: TextStyle(color: Colors.black),
                  initialValue: number,
                  maxLength: 10,
                  // initialValue: ,
                  textFieldController: controller,
                  formatInput: false,
                  keyboardType: TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  inputBorder: OutlineInputBorder(),
                  onSaved: (PhoneNumber number) {
                    print('On Saved: $number');
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () async {
                    MobileSent();
                  },
                  child: Container(
                    width: 150,
                    margin: EdgeInsets.only(left: 10, right: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Colors.green,
                    ),
                    padding: EdgeInsets.only(
                        left: 20, right: 20, top: 15, bottom: 15),
                    child: showLoading
                        ? Center(
                            child: CircularProgressIndicator(
                            color: Colors.white,
                          ))
                        : Text(
                            'Continue',
                            textAlign: TextAlign.center,
                            style: GoogleFonts.aldrich(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w500),
                          ),
                  ),
                ),
                SizedBox(
                  height: 30,
                ),
                Text(
                  'A fit body, a calm mind, a house full of love. These things cannot be bought – they must be earned.',
                  style: GoogleFonts.abel(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: Colors.blueGrey,
                      fontStyle: FontStyle.italic),
                ),
              ]),
            ),
          ],
        ),
      ),
    );
  }

  //
  MobileSent() async {
    formKey.currentState!.validate();

    print("final is" + _phoneNo);
    setState(() {
      showLoading = true;
    });

    await _auth.verifyPhoneNumber(
        // timeout: Duration(seconds: 25),
        phoneNumber: _phoneNo,
        verificationCompleted: (phoneAuthCredential) async {
          setState(() {
            showLoading = false;
          });
          // SignInWithPhoneAuthCredential(phoneAuthCredential);
        },
        verificationFailed: (verificationFailed) async {
          setState(() {
            showLoading = false;
          });
          _scaffoldKey.currentState!.showSnackBar(SnackBar(
              content: Text(
            verificationFailed.message.toString(),
            style: TextStyle(color: Colors.red),
          )));
        },
        codeSent: (verificationId, resendingToken) async {
          setState(() {
            showLoading = false;
          });
          print("CODE SENT");
          currentState = MobileVerificationState.SHOW_OTP_FORM_STATE;
          setState(() {
            print("VERIFICATION ID SAVED " + verificationId);
            this.verificationID = verificationId;
          });
        },
        codeAutoRetrievalTimeout: (verificationId) async {});
  }

  void getPhoneNumber(String phoneNumber) async {
    PhoneNumber number =
        await PhoneNumber.getRegionInfoFromPhoneNumber(phoneNumber, 'IN');
    setState(() {
      this.number = number;
    });
  }

  Widget OTPinput(context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      color: Colors.white,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Text(
              'Phone Number Verification',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
              textAlign: TextAlign.center,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8),
            child: RichText(
              text: TextSpan(
                  text: "Enter the code sent to ",
                  children: [
                    TextSpan(
                        text: _phoneNo,
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 15)),
                  ],
                  style: TextStyle(color: Colors.black54, fontSize: 15)),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(
            height: 20,
          ),
          Form(
            key: formKey1,
            child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 10),
                child: PinCodeTextField(
                  mainAxisAlignment: MainAxisAlignment.center,

                  appContext: context,

                  pastedTextStyle: TextStyle(
                    color: Colors.green.shade600,
                    fontWeight: FontWeight.bold,
                  ),
                  length: 6,

                  obscureText: false,
                  obscuringCharacter: '*',
                  animationType: AnimationType.fade,
                  validator: (v) {
                    if (v!.length < 3) {
                      return "I'm from validator";
                    } else {
                      return null;
                    }
                  },
                  pinTheme: PinTheme(
                    selectedColor: Colors.green,
                    selectedFillColor: Colors.white,
                    inactiveFillColor: Colors.white,
                    shape: PinCodeFieldShape.box,
                    borderRadius: BorderRadius.circular(5),
                    fieldHeight: 40,
                    inactiveColor: Colors.grey,
                    fieldOuterPadding: EdgeInsets.symmetric(horizontal: 10),
                    activeColor: Colors.white,
                    fieldWidth: 30,
                    activeFillColor: hasError ? Colors.orange : Colors.white,
                  ),
                  cursorColor: Colors.black,
                  animationDuration: Duration(milliseconds: 300),
                  textStyle: TextStyle(fontSize: 20, height: 1.6),
                  backgroundColor: Colors.white,
                  enableActiveFill: true,
                  errorAnimationController: errorController,
                  controller: textEditingController,
                  keyboardType: TextInputType.number,
                  boxShadows: [
                    BoxShadow(
                      offset: Offset(0, 1),
                      color: Colors.black12,
                      blurRadius: 4,
                    )
                  ],
                  onCompleted: (v) {
                    print("Completed");
                  },
                  // onTap: () {
                  //   print("Pressed");
                  // },
                  onChanged: (value) {
                    print(value);
                    setState(() {
                      currentText = value;
                    });
                  },
                  beforeTextPaste: (text) {
                    print("Allowing to paste $text");
                    //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                    //but you can show anything you want here, like your pop up saying wrong paste format or etc
                    return true;
                  },
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Text(
              hasError ? "*Please fill up all the cells properly" : "",
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 12,
                  fontWeight: FontWeight.w400),
            ),
          ),
          SizedBox(
            height: 20,
          ),
          RichText(
            textAlign: TextAlign.center,
            text: TextSpan(
                text: "Didn't receive the code? ",
                style: TextStyle(color: Colors.black54, fontSize: 15),
                children: [
                  TextSpan(
                      text: " RESEND",
                      recognizer: onTapRecognizer,
                      style: TextStyle(
                          color: Color(0xFF91D3B3),
                          fontWeight: FontWeight.bold,
                          fontSize: 16))
                ]),
          ),
          SizedBox(
            height: 14,
          ),
          GestureDetector(
            onTap: () {
              formKey1.currentState!.validate();
              // conditions for validating
              print("Currrent length :" + currentText.length.toString());
              if (currentText.length != 6) {
                print("HERE");
                errorController.add(ErrorAnimationType
                    .shake); // Triggering error shake animation
                setState(() {
                  hasError = true;
                });
              } else {
                setState(() {
                  hasError = false;
                }
                   
                    );

                _otp_code = currentText;
                PhoneAuthCredential phoneAuthCredential =
                    PhoneAuthProvider.credential(
                        verificationId: verificationID, smsCode: _otp_code);
                SignInWithPhoneAuthCredential(phoneAuthCredential);
                // VerifyOTP();
              }
            },
            child: Container(
                decoration: BoxDecoration(
                  color: Color(0xffFEDB3E),
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.4),
                      spreadRadius: 2,
                      blurRadius: 2,
                      offset: Offset(0, 3), // changes position of shadow
                    )
                  ],
                ),
                padding: EdgeInsets.all(10),
                height: 40,
                width: 50,
                margin: EdgeInsets.symmetric(
                    horizontal: MediaQuery.of(context).size.width / 2 - 100),
                child: Center(
                  child: showLoading
                      ? Center(
                          child: Container(
                            height: 25,
                            width: 25,
                            child: CircularProgressIndicator(
                              color: Colors.white,
                            ),
                          ),
                        )
                      : Text(
                          'Verify',
                          style: GoogleFonts.quicksand(
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              letterSpacing: 1.5,
                              fontSize: 15),
                        ),
                )),
          ),
        ],
      ),
    );
  }

  void dispose() {
    errorController.close();

    super.dispose();
  }
}
