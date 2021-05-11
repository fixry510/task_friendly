import 'package:flutter/material.dart';

class PersonHelp extends ChangeNotifier {
  String uid;
  String name;
  String lastname;
  List<ServiceType> service;
  String profileImage;
  String gender;
  String email;
  int age;

  PersonHelp(
      {this.uid,
      this.name,
      this.lastname,
      this.email,
      this.profileImage,
      this.gender,
      this.age,
      this.service});
}

class ServiceType {
  String serviceType;
  String description;
  List<dynamic> imageSkill;
  String jobType;

  ServiceType({
    this.serviceType,
    this.description,
    this.imageSkill,
    this.jobType,
  });
}
