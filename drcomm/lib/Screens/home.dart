import 'package:drcomm/Helper/Utils.dart';
import 'package:drcomm/Screens/SignDetails.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late List<DoctorList> doctors ;

  @override
  Widget build(BuildContext context) {
    doctors = Utils().getList();
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Home Page",
          style: GoogleFonts.rubik(color: Colors.black, fontSize: 22),
        ),
        backgroundColor: Colors.white,
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => EditProfile(
                            appbarname: "Edit Profile",
                          )));
            },
            icon: Icon(
              Icons.settings,
              color: Colors.black,
            ),
          )
        ],
      ),
      body: Column(
        children: [
          Utils.BalanceTile("16/02/2002 , 3 PM", "R.D Singh "),
          Container(
            height: MediaQuery.of(context).size.height - 200,
            child: ListView.builder(
              itemCount: doctors.length,
              itemBuilder: (BuildContext context, int i) {
                return SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: CustomListItem(
                    isActive: doctors[i].isActive,
                    name: doctors[i].name,
                    phoneno: doctors[i].phoneno,
                    specialization: doctors[i].specialization,
                    gender: doctors[i].gender,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
