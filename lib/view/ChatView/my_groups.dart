import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scure_costom_keyboard/all_links.dart';

import '../../controller/group_controller.dart';
import '../../controller/userController.dart';
import '../../model/user_model.dart';
import 'package:http/http.dart' as http;

class MyGroupsScreen extends StatefulWidget {
  const MyGroupsScreen({Key? key}) : super(key: key);

  @override
  _MyGroupsScreenState createState() => _MyGroupsScreenState();
}

late String searching;
List? grouplist;

class _MyGroupsScreenState extends State<MyGroupsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData();
  }

  getData() async {
   var url='http://${ip}/Api_Custom_Keyboard/api/group/getAllGroups';
   var respons=await http.get(Uri.parse(url));
   if(respons.statusCode==200)
   {
     grouplist=json.decode(respons.body);
     setState((){});
   }

  }

// getPhoneNumber() async
//   {
//     return await getUserNumber();
//   }
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: size.width,
        height: size.height,
        decoration: const BoxDecoration(
          color: Colors.white,
          // image: DecorationImage(
          //   image: AssetImage("images/Wall Paper2.jpg"),
          //   fit: BoxFit.cover,
          //   opacity: 0.6,
          // ),
          gradient: LinearGradient(
            colors: [
              Colors.lightBlue,
              Colors.greenAccent,
            ],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              Searchbar(),
          
              grouplist!.length == 0
                  ? const Center(
                      child: CircularProgressIndicator(
                      color: Colors.white,
                    ))
                  : const 
                  ListMembers(),
            ],
          ),
        ),
      ),
      //____________________________________BOTTOM BAR
      bottomNavigationBar: groupNavigator,
    );
  }
}

class Searchbar extends StatefulWidget {
  const Searchbar({Key? key}) : super(key: key);

  @override
  _SearchbarState createState() => _SearchbarState();
}

class _SearchbarState extends State<Searchbar> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Container(
        height: size.height * 0.07,
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: Colors.black)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Align(
            alignment: Alignment.centerLeft,
            child: TextFormField(
              onChanged: (value) {
                searching = value.toString();
                setState(() {});
                print(size.height);
              },
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  // prefixIcon: Icon(
                  //   Icons.person,
                  //   size: 16,
                  //   color:Colors.black54,
                  // ),
                  hintText: "Search by name or number",
                  hintStyle: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.w300,
                  )),
              style: TextStyle(
                color: Colors.black,
                fontSize: 15,
                fontWeight: FontWeight.w300,
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class ListMembers extends StatefulWidget {
  const ListMembers({Key? key}) : super(key: key);

  @override
  _ListMembersState createState() => _ListMembersState();
}

class _ListMembersState extends State<ListMembers> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
      child: Container(
        // color: Colors.black,
        height: size.height * 0.7,
        child: ListView.builder(
          itemCount: grouplist?.length,
          itemBuilder: (context, index) {
            return SizedBox(
                height: 80,
                child: Card(
                  color: Colors.white,
                  elevation: 20,
                  shadowColor: Colors.yellowAccent,
                  clipBehavior: Clip.antiAliasWithSaveLayer,
                  child: Align(
                      alignment: Alignment.centerLeft,
                      child: ListTile(
                        onTap: () {},
                        leading: const CircleAvatar(
                          backgroundColor: Color(0xcFFFe1e8e3),
                          radius: 20,
                        ),
                        title: Text(
                          '${grouplist![index]['groupname']}',
                          style: GoogleFonts.josefinSans(
                            fontSize: 18,
                            fontWeight: FontWeight.w900,
                          ),
                        ),
                        subtitle: Text(
                          grouplist![index]['type'].toString(),
                          style: GoogleFonts.josefinSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        trailing: MaterialButton(
                            onPressed: () async {
                              // await getUserList();
                            },
                            child: Icon(
                              Icons.add_box,
                              size: 25,
                            )),
                      )),
                ));
          },
        ),
      ),
    );
  }
}
