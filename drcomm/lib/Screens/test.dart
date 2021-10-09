import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'Login.dart';

class Testing extends StatelessWidget {
  const Testing({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _auth = FirebaseAuth.instance;
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                _auth.signOut();
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => LoginScreen()));
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: Center(child: Text("WELCOME")),
    );
  }
}
