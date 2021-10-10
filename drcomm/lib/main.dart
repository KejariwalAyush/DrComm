import 'package:drcomm/Screens/SignDetails.dart';
import 'package:drcomm/Screens/test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'Screens/Login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {

    bool check = false;
  

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: check ? EditProfile(appbarname: "Your Profile",) : LoginScreen(),
    );

    // home: LoginMobile(),
    // home: TestScreent( phoneNumber: '9931036296',),
  }
}
