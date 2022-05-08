

import 'dart:convert';

import 'package:scure_costom_keyboard/controller/userController.dart';
import 'package:http/http.dart' as http;

addNewMessage(var data) async {
  String url = 'http://${ip}/Api_Custom_Keyboard/api/Message/AddNewMessage';
  var response = await http.post(Uri.parse(url), body: data);
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}


getSingleConservation(String send, String reci) async {
  var address = 'http://${ip}/Api_Custom_Keyboard/api/Message/getSingleConservation?send=${send}&reci=${reci}';

  var response = await http.get(Uri.parse(address));
  if (response.statusCode == 200) {
    List list = json.decode(response.body);
    print('Conservation Length: ${list.length}');
    return list;
  } else {
    return false;
  }
}