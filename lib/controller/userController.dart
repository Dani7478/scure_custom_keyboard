import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../model/user_model.dart';

String ip = '192.168.43.45';

Future<bool> addUser(User user) async {
  var address =
      'http://${ip}/Api_Custom_Keyboard/api/registration/newregistration';
  var data = {
    "contact": user.contact,
    "firstname": user.firstname,
    "lastname": user.lastname,
    "email": user.email,
    "password": user.password,
    "gender": user.gender,
  };
  print(data.toString());
  var response = await http.post(Uri.parse(address), body: data);
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

Future<bool> loginchecker(String number, String password) async {
  var address =
      'http://${ip}/Api_Custom_Keyboard/api/registration/newlogin?number=${number}&password=${password}';
  print('${number}:${password}');

  var response = await http.get(Uri.parse(address));
  if (response.statusCode == 200) {
    print("Ok");
    if (response.body == 'true') {
      return true;
    }
    return false;
  } else {
    return false;
  }
}

getUserList() async {
  var address = 'http://${ip}/Api_Custom_Keyboard/api/registration/getusers';

  var response = await http.get(Uri.parse(address));
  if (response.statusCode == 200) {
    List list = json.decode(response.body);
    return list;
  } else {
    return false;
  }
}
