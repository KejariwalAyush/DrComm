import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Utils {
  static AppBar customAppBar(String title) {
    return AppBar(
      title: Text(
        title,
        style: GoogleFonts.rubik(color: Colors.black, fontSize: 22),
      ),
      backgroundColor: Colors.white,
    );
  }

  static String profileImageLink =
      "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fpost.healthline.com%2Fwp-content%2Fuploads%2F2020%2F06%2Forthopedic-doctor-ankle-1200x628-facebook-1200x628.jpg&f=1&nofb=1";

  static List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("Male"), value: "Male"),
      DropdownMenuItem(child: Text("Female"), value: "Female"),
      DropdownMenuItem(child: Text("Others"), value: "Others"),
    ];
    return menuItems;
  }

  static Widget profilePicture(String link, bool showActive) {
    return Center(
      child: Stack(
        children: [
          Container(
            width: 85,
            height: 85,
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
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                color: showActive ? Colors.green : Colors.grey,
                shape: BoxShape.circle,
                border: Border.all(width: 2, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
  static Widget BalanceTile(String amount, String name ) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff4484F7).withOpacity(.8),
          borderRadius: BorderRadius.circular(15),
        ),
        height: 100,
        child: Container(
          padding: EdgeInsets.all(5),
          child: Row(
            children: [
          Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Appointment at : ${amount}",
                    style:
                    GoogleFonts.roboto(color: Colors.white, fontSize: 15),
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text("Doctor Name : "+name,
                      style:
                      GoogleFonts.roboto(color: Colors.limeAccent, fontSize: 15)),

                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  List <DoctorList> doctorslist = [];
  List<DoctorList> getList()
  {
    doctorslist.add(new DoctorList("Rahul Singh", "+919053764362", false, "Male", "Child Specialist", false));
    doctorslist.add(new DoctorList("Kunal Raj",   "+918652014236", true, "Male", "Dentist", false));
    doctorslist.add(new DoctorList("Priyanka Goyal","+917263244321", true, "Female", "Neurologist", true));
    doctorslist.add(new DoctorList("Ayush Kumar", "+919865143012", true, "Male", "Child Specialist", false));
    doctorslist.add(new DoctorList("Diya Thakur", "+918701361243", true, "Female", "Physical Consultant", true));
    doctorslist.add(new DoctorList("Ranjeet Lanjewar", "+919563813734", false, "Male", "Child Specialist", false));
    doctorslist.add(new DoctorList("Riya Kumari", "+918461837181", true, "Female", "Child Specialist", false));
    return doctorslist;
  }

  }

class CustomListItem extends StatelessWidget {
  final String name;
  final String phoneno;
  final bool isActive;
  final String gender;
  final String specialization;

  const CustomListItem(
      {Key? key,
      required this.name,
      required this.phoneno,
      required this.isActive,
      required this.gender,
      required this.specialization})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Card(
        child: Container(
          width: MediaQuery.of(context).size.width,
          // height: 85,
          padding: EdgeInsets.all(10),
          child: Row(
            children: [
              Utils.profilePicture(Utils.profileImageLink, isActive),
              SizedBox(
                width: 15,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: GoogleFonts.lato(
                        fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text("Specialization : " + specialization),
                  SizedBox(
                    height: 8,
                  ),
                  Text("Gender : " + gender.toUpperCase())
                ],
              ),
              Spacer(),
              Container(
                height: 40,
                width: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(width: 2, color: Colors.green),
                ),
                child: Icon(Icons.payment),
              ),
            ],
          ),
        ),
      ),
    );
  }


}



class DoctorList
{
  final String name;
  final String phoneno;
  final bool isActive;
  final String gender;
  final String specialization;
  final homeVisit;
  DoctorList(this.name, this.phoneno, this.isActive, this.gender, this.specialization, this.homeVisit);

}