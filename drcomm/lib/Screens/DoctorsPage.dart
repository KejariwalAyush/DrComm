import 'package:drcomm/Helper/Utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shimmer/shimmer.dart';

class DoctorsPage extends StatefulWidget {
  final DoctorDetails dc;

  const DoctorsPage({Key? key, required this.dc}) : super(key: key);

  @override
  _DoctorsPageState createState() => _DoctorsPageState();
}

class _DoctorsPageState extends State<DoctorsPage> {
  late DoctorDetails doctorDetails;
  String appointmentTime = "9am - 10am";

  @override
  Widget build(BuildContext context) {
    doctorDetails = widget.dc;
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(
          color: Colors.black, //change your color here
        ),
        title: Text(
          "Doctor's Details",
          style: GoogleFonts.rubik(color: Colors.black, fontSize: 22),
        ),
        backgroundColor: Colors.white,
      ),
      body: Container(
        padding: EdgeInsets.only(left: 16, top: 25, right: 16),
        child: ListView(
          physics: BouncingScrollPhysics(),
          children: [
            profilePicture(doctorDetails.profilePicture),
            SizedBox(
              height: 25,
            ),
            Center(
              child: Text(
                doctorDetails.name,
                style: GoogleFonts.roboto(
                    fontSize: 25,
                    color: Colors.black,
                    fontWeight: FontWeight.w500),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Center(
              child: Text(
                " ${doctorDetails.specialization}",
                style: GoogleFonts.abel(
                    fontSize: 22,
                    color: Colors.black,
                    fontWeight: FontWeight.w400),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Number(),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.location_on),
                SizedBox(
                  width: 20,
                ),
                Text(
                  doctorDetails.location,
                  style: GoogleFonts.abel(fontSize: 18),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            doctorAvailablity(),
            SizedBox(
              height: 20,
            ),
            genderAndRating(),
            SizedBox(
              height: 15,
            ),
            Center(
              child: DropdownButton(
                  value: appointmentTime,
                  onChanged: (String? newValue) {
                    setState(() {
                      appointmentTime = newValue!;
                    });
                  },
                  items: Utils.dropdownTimeList),
            ),
            SizedBox(
              height: 60,
            ),
            OutlineButton(
              onPressed: () {

              },
              child: Center(
                child: Container(
                  padding: EdgeInsets.all(5),
                  child: Shimmer.fromColors(
                    baseColor: Colors.green,
                    highlightColor: Colors.yellow,
                    child: Text(
                      'Book Your Appointment',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget genderAndRating() {
    return Row(
      children: [
        Text(
          "Gender : ${doctorDetails.gender}",
          style: GoogleFonts.abel(fontSize: 18),
        ),
        SizedBox(
          width: 5,
        ),
        doctorDetails.gender == 'Male'
            ? Icon(
                Icons.male,
                color: Colors.black,
              )
            : Icon(
                Icons.female,
                color: Colors.pink,
              ),
        Spacer(),
        Text(
          "Ratings ${doctorDetails.ratings}/5 ⭐️",
          style: GoogleFonts.abel(fontSize: 18),
        ),
        SizedBox(
          width: 20,
        ),
      ],
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
                fit: BoxFit.contain,
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
                color: doctorDetails.homeVisit ? Colors.green : Colors.grey,
                shape: BoxShape.circle,
                border: Border.all(
                    width: 3,
                    color: doctorDetails.isActive ? Colors.green : Colors.grey),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget Number() {
    return Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.phone),
          SizedBox(
            width: 10,
          ),
          Text(
            doctorDetails.phoneno,
            style: GoogleFonts.roboto(
                fontSize: 18,
                color: Colors.black.withOpacity(0.6),
                fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }

  Widget doctorAvailablity() {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.all(20.0),
      child: Table(
        border: TableBorder.all(color: Colors.green),
        children: [
          TableRow(children: [
            Center(
                child: Text(
              'Doctor is in Clinic',
              style: GoogleFonts.lato(fontSize: 15),
            )),
            Center(
                child: Text(
              'Home Consultancy',
              style: GoogleFonts.lato(fontSize: 15),
            )),
          ]),
          TableRow(children: [
            doctorDetails.isActive
                ? Icon(
                    Icons.check,
                    color: Colors.green,
                  )
                : Icon(
                    Icons.close_outlined,
                    color: Colors.red,
                  ),
            // doctorDetails.isActive? Icon
            doctorDetails.homeVisit
                ? Icon(
                    Icons.check,
                    color: Colors.green,
                  )
                : Icon(
                    Icons.close_outlined,
                    color: Colors.red,
                  ),
          ])
        ],
      ),
    );
  }
}
