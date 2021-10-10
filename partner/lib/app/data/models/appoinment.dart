// To parse this JSON data, do
//
//     final drAppoinment = drAppoinmentFromMap(jsonString);

import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:meta/meta.dart';

class DrAppointment {
  DrAppointment({
    required this.appointment,
    required this.user,
  });

  final Appointment appointment;
  final User user;

  factory DrAppointment.fromJson(String str) =>
      DrAppointment.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DrAppointment.fromMap(Map<String, dynamic> json) => DrAppointment(
        appointment: Appointment.fromMap(json["appointment"]),
        user: User.fromMap(json["user"]),
      );

  Map<String, dynamic> toMap() => {
        "appointment": appointment.toMap(),
        "user": user.toMap(),
      };
}

class Appointment {
  Appointment({
    required this.id,
    required this.appointmentType,
    required this.bookingDate,
    required this.appointmentDate,
  });

  final String id;
  final String appointmentType;
  final DateTime bookingDate;
  final DateTime appointmentDate;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'appointmentType': appointmentType,
      'bookingDate': bookingDate.toIso8601String(),
      'appointmentDate': appointmentDate.toIso8601String(),
    };
  }

  factory Appointment.fromMap(Map<String, dynamic> map) {
    return Appointment(
      id: map['id'],
      appointmentType: map['appointmentType'],
      bookingDate: DateTime.parse(map['bookingDate']).toLocal(),
      appointmentDate: DateTime.parse(map['appointmentDate']).toLocal(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Appointment.fromJson(String source) =>
      Appointment.fromMap(json.decode(source));
}

class User {
  User({
    required this.id,
    required this.name,
    required this.phno,
    required this.gender,
    required this.age,
    required this.dp,
    required this.location,
  });

  final String id;
  final String name;
  final String phno;
  final String gender;
  final int age;
  final String dp;
  final Placemark location;

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phno': phno,
      'gender': gender,
      'age': age,
      'dp': dp,
      'location': location.toJson(),
    };
  }

  factory User.fromMap(Map<String, dynamic> map) {
    return User(
      id: map['id'],
      name: map['name'],
      phno: map['phno'],
      gender: map['gender'],
      age: map['age'],
      dp: map['dp'],
      location: Placemark.fromMap(map['location']),
    );
  }

  String toJson() => json.encode(toMap());

  factory User.fromJson(String source) => User.fromMap(json.decode(source));
}
