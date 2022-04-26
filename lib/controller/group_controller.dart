


import 'package:scure_costom_keyboard/controller/userController.dart';
import 'package:scure_costom_keyboard/model/group_model.dart';
import 'package:http/http.dart' as http;
postDataForGroup(Group grop) async
{
  String url='http://${ip}/Api_Custom_Keyboard/api/group/postGroup';
  var data={
    'groupname': grop.groupname,
    'adminno' :grop.adminno,
    'type': grop.type
  };

  var response=await http.post(Uri.parse(url), body: data);
  if(response.statusCode==200)
    {
      return true;
    }
  else
    {
      return false;
    }
}