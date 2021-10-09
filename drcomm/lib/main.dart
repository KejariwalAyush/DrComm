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
    const bool kIsWeb = identical(0, 0.0);
    bool check = false;
    if (kIsWeb == false) {
      final _auth = FirebaseAuth.instance;

      if (_auth.currentUser == null) {
        check = false;
        print("NOt LOGGED IN");
      } else {
        check = true;
        print("Logged in");
        setState(() {});
        setState(() {});
      }
    }

    return MaterialApp(
      // theme: ThemeData.dark(),

      // theme: kIsWeb?ThemeData.light():ThemeData.dark(),̨

      debugShowCheckedModeBanner: false,
      home: check ? Testing() : LoginScreen(),
    );

    // home: LoginMobile(),
    // home: TestScreent( phoneNumber: '9931036296',),
  }
}
