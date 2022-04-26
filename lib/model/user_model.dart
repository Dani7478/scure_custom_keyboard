import 'package:flutter/material.dart';
import 'dart:convert';

class User {
  String? contact;
  String? firstname;
  String? lastname;
  String? email;
  String? password;
  String? gender;

  User(
      {
        required this.contact,
      required this.firstname,
      required this.lastname,
      required this.email,
      required this.password,
      required this.gender});

  User.fromJson(Map<String, dynamic> json) {
    contact = json['contact'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    password = json['password'];
    gender = json['gender'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['contact'] = this.contact;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['email'] = this.email;
    data['password'] = this.password;
    data['gender'] = this.gender;
    return data;
  }
}
