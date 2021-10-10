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

  static List<DropdownMenuItem<String>> get dropdownTimeList {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("9am - 10am"), value: "9am - 10am"),
      DropdownMenuItem(child: Text("10am - 11am"), value: "10am - 11am"),
      DropdownMenuItem(child: Text("3pm - 4pm"), value: "3pm - 4pm"),
      DropdownMenuItem(child: Text("4pm - 5pm"), value: "4pm - 5pm"),
    ];
    return menuItems;
  }

  static Widget profilePicture(String link, bool showActive, bool giveService) {
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
                fit: BoxFit.contain,
                image: NetworkImage(link),
              ),
            ),
          ),
          showActive == false && giveService == false
              ? Container()
              : Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: giveService
                          ? Colors.green
                          : Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(
                          width: 4,
                          color: showActive ? Colors.green : Colors.grey),
                    ),
                  ),
                ),
        ],
      ),
    );
  }

  static Widget BalanceTile(String amount, String name) {
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
                  Text("Doctor Name : " + name,
                      style: GoogleFonts.roboto(
                          color: Colors.black, fontSize: 15)),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }

  List<DoctorDetails> doctorslist = [];

  List<DoctorDetails> getList() {
    doctorslist.add(new DoctorDetails(
        "Rahul Singh",
        "+919053764362",
        false,
        "Male",
        "Child Specialist",
        false,
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse3.mm.bing.net%2Fth%3Fid%3DOIP.605X64sP2gJFtDQmZ2NxGgHaK3%26pid%3DApi&f=1",
        3.2,
        "Morabadi, Ranchi"));
    doctorslist.add(new DoctorDetails(
        "Kunal Raj",
        "+918652014236",
        true,
        "Male",
        "Dentist",
        false,
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse4.mm.bing.net%2Fth%3Fid%3DOIP.EZZ-tIVc7yqb1m_u9o7HxAHaLM%26pid%3DApi&f=1",
        4.5,
        "Harmu, Ranchi"));
    doctorslist.add(new DoctorDetails(
        "Priyanka Goyal",
        "+917263244321",
        true,
        "Female",
        "Neurologist",
        true,
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.sIMaRhEHogXQcRyPIRNyMQHaLI%26pid%3DApi&f=1",
        3.6,
        "Ratu road, Ranchi"));
    doctorslist.add(new DoctorDetails(
        "Ayush Kumar",
        "+919865143012",
        true,
        "Male",
        "Child Specialist",
        false,
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fthumbs.dreamstime.com%2Fb%2Fmale-doctor-11989073.jpg&f=1&nofb=1",
        4.7,
        "Piska More, Ranchi"));
    doctorslist.add(new DoctorDetails(
        "Diya Thakur",
        "+918701361243",
        true,
        "Female",
        "Physical Consultant",
        true,
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Fmedia.sciencephoto.com%2Fimage%2Ff0032010%2F800wm%2FF0032010-A_female_doctor_holding_some_notes.jpg&f=1&nofb=1",
        3.8,
        "Dhurwa, Ranchi"));
    doctorslist.add(new DoctorDetails(
        "Ranjeet Lanjewar",
        "+919563813734",
        false,
        "Male",
        "Child Specialist",
        false,
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.skqJuKhxm_Ew33WBgxBzqgHaLH%26pid%3DApi&f=1",
        4.87,
        "Medical road, Ranchi"));
    doctorslist.add(new DoctorDetails(
        "Riya Kumari",
        "+918461837181",
        true,
        "Female",
        "Child Specialist",
        false,
        "https://external-content.duckduckgo.com/iu/?u=https%3A%2F%2Ftse1.mm.bing.net%2Fth%3Fid%3DOIP.ULbTgj5vpWuLYARsX2eaLgHaJ4%26pid%3DApi&f=1",
        3.9,
        "Lalpur road, Ranchi"));
    return doctorslist;
  }
}

class CustomListItem extends StatelessWidget {
  final String name;
  final String phoneno;
  final bool isActive;
  final String gender;
  final bool giveService;
  final String specialization;
  final String profilePicture;

  const CustomListItem(
      {Key? key,
      required this.name,
      required this.phoneno,
      required this.isActive,
      required this.gender,
      required this.specialization,
      required this.profilePicture,
      required this.giveService})
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
              Utils.profilePicture(profilePicture, isActive, giveService),
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

class DoctorDetails {
  final String name;
  final String phoneno;
  final bool isActive;
  final String gender;
  final String specialization;
  final homeVisit;
  final double ratings;
  final String location;
  final String profilePicture;

  DoctorDetails(
      this.name,
      this.phoneno,
      this.isActive,
      this.gender,
      this.specialization,
      this.homeVisit,
      this.profilePicture,
      this.ratings,
      this.location);
}
