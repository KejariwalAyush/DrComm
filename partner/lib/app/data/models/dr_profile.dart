import 'dart:convert';

import 'package:geocoding/geocoding.dart';
import 'package:partner/app/data/data.dart';

class DrProfile {
  final String id;
  final String name;
  final String phno;
  final String certificate;
  final String dp;
  final Gender gender;
  final Placemark? location;
  final String specialization;
  final bool isActive;
  final bool homeVisit;
  final double rating;

  DrProfile({
    required this.id,
    required this.name,
    required this.phno,
    required this.certificate,
    required this.dp,
    required this.gender,
    required this.location,
    required this.specialization,
    required this.isActive,
    required this.homeVisit,
    required this.rating,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'phno': phno,
      'certificate': certificate,
      'dp': dp,
      'gender': getGenderString(gender),
      'location': location?.toJson() ?? null,
      'specialization': specialization,
      'isActive': isActive,
      'homeVisit': homeVisit,
      'rating': rating,
    };
  }

  factory DrProfile.fromMap(Map<String, dynamic> map) {
    return DrProfile(
      id: map['id'],
      name: map['name'],
      phno: map['phno'],
      certificate: map['certificate'],
      dp: map['dp'],
      gender: getGender(map['gender']),
      location:
          map['location'] == null ? null : Placemark.fromMap(map['location']),
      specialization: map['specialization'],
      isActive: map['isActive'],
      homeVisit: map['homeVisit'],
      rating: double.parse(map['rating'].toString()),
    );
  }

  String toJson() => json.encode(toMap());

  factory DrProfile.fromJson(String source) =>
      DrProfile.fromMap(json.decode(source));
}
