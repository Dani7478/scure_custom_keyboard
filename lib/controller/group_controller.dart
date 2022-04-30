import 'dart:convert';

import 'package:scure_costom_keyboard/controller/userController.dart';
import 'package:scure_costom_keyboard/model/group_model.dart';
import 'package:http/http.dart' as http;
import 'package:scure_costom_keyboard/model/user_model.dart';

postDataForGroup(Group grop) async {
  String url = 'http://${ip}/Api_Custom_Keyboard/api/group/postGroup';
  var data = {
    'groupname': grop.groupname,
    'adminno': grop.adminno,
    'type': grop.type
  };

  var response = await http.post(Uri.parse(url), body: data);
  if (response.statusCode == 200) {
    return true;
  } else {
    return false;
  }
}

getGroupList(int id) async {
  late List<Group> groupList=<Group>[];
  print('start......');
  String url = 'http://${ip}/Api_Custom_Keyboard/api/group/getAllGroups';
  var response = await http.get(
    Uri.parse(url),
  );
  if(response.statusCode==200)
  {
    print('data fetch successfuly......');
  var jasonString = response.body;
  List list = json.decode(jasonString);
  print('List Created......');
  for (int i = 0; i < list.length; i++) {
   var group=Group(
      id: list[i]['id'],
      adminno: list[i]['adminno'],
      groupname: list[i]['groupname'],
      type: list[i]['groupname'],
    );
    print('Parsing......');
    groupList.add(group);
  }
  return groupList;
  }
  else 
  {
    return [];
  }
}
