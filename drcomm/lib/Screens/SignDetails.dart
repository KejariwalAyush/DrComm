import 'package:drcomm/Helper/Utils.dart';
import 'package:drcomm/Screens/Login.dart';
import 'package:drcomm/Screens/home.dart';
import "package:firebase_auth/firebase_auth.dart";
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class EditProfile extends StatefulWidget {
  final appbarname;

  const EditProfile({Key? key, @required this.appbarname}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState(appbarname);
}

class _EditProfileState extends State<EditProfile> {
  final _auth = FirebaseAuth.instance;
  final appbarName;

  String _userName = "";
  String _bloodGroup = "";
  String _gender = "Male";
  final dateController = TextEditingController();

  _EditProfileState(@required this.appbarName);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          appbarName,
          style: GoogleFonts.rubik(color: Colors.black, fontSize: 22),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              _auth.signOut();
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => LoginScreen()));
            },
            icon: Icon(
              Icons.logout,
              color: Colors.red,
            ),
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: ListView(
            children: [
              Row(
                children: [
                  Icon(Icons.person, color: Colors.green),
                  Text(
                    "  Account",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Divider(
                height: 18,
                thickness: 2,
              ),
              SizedBox(
                height: 20,
              ),
              profilePicture(Utils.profileImageLink),
              SizedBox(height: 35),
              TextField(
                onChanged: (val) {
                  _userName = val;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 3),
                  labelText: "Full Name",
                  hintText: "Your Good Name",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 35),
              TextField(
                keyboardType: TextInputType.text,
                onChanged: (val) {
                  // _phoneNo = val;
                  _bloodGroup = val;
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.only(bottom: 3),
                  labelText: "Blood Groud",
                  hintText: "Your Blood Group (A+ / A-)",
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  hintStyle: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(height: 35),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Spacer(),
                    Text(dateController.text.length == 0
                        ? "2001/12/31"
                        : dateController.text),
                    Spacer(),
                    IconButton(
                        onPressed: () async {
                          var date = await showDatePicker(
                              context: context,
                              initialDate: DateTime.now(),
                              firstDate: DateTime(1900),
                              lastDate: DateTime(2100));
                          dateController.text =
                              date.toString().substring(0, 10);
                          setState(() {});
                        },
                        icon: Icon(Icons.calendar_today_sharp)),
                    Spacer(),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: DropdownButton(
                    value: _gender,
                    onChanged: (String? newValue) {
                      setState(() {
                        _gender = newValue!;
                      });
                    },
                    items: Utils.dropdownItems),
              ),
              bottomBar(),
            ],
          ),
        ),
      ),
    );
  }

  Widget profilePicture(String link) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 125,
            height: 125,
            decoration: BoxDecoration(
              border: Border.all(width: 2, color: Colors.blue),
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(link),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  color: Colors.green,
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: Colors.white),
                ),
                child: Icon(
                  Icons.edit,
                  color: Colors.white,
                )),
          ),
        ],
      ),
    );
  }

  Widget bottomBar() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        OutlineButton(
          onPressed: () {
            Navigator.pop(context);
          },
          padding: EdgeInsets.symmetric(horizontal: 50),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Text(
            "Cancel",
            style:
                TextStyle(fontSize: 14, letterSpacing: 1.8, color: Colors.red),
          ),
        ),
        // Spacer(),
        OutlineButton(
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => HomePage())),
          padding: EdgeInsets.symmetric(horizontal: 50),
          highlightElevation: 2.2,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          child: Text(
            "Save",
            style: TextStyle(
                fontSize: 14, letterSpacing: 1.8, color: Colors.green),
          ),
        )
      ],
    );
  }
}
