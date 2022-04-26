import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:scure_costom_keyboard/all_links.dart';
import 'package:scure_costom_keyboard/model/group_model.dart';


import '../../Widgets/bottom_nav_bar.dart';
import '../../Widgets/custom_snackbar.dart';
import '../../controller/group_controller.dart';

class AddNewGroup extends StatefulWidget {
  const AddNewGroup({Key? key}) : super(key: key);

  @override
  _AddNewGroupState createState() => _AddNewGroupState();
}
late TextEditingController _controlGroupName= TextEditingController();
List<String> groupTypes=['Friendship', 'Informative', 'Politics', 'Fun', 'Girls'];
String dropdownValue = 'Friendship';

class _AddNewGroupState extends State<AddNewGroup> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Scaffold(
      //____________________________________BODY
      body: SingleChildScrollView(
        child: Container(
          width: size.width,
          height: size.height,
          child: Column(
            children: [
              Expanded(
                  flex: 50,
                  child:Container(
                   // color: Colors.red,
                    width: size.width,
                    child: HeaderImage(),
                  )),
              Expanded(
                  flex: 50,
                  child:Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                    child: Container(
                      //color: Colors.yellow,

                 child: FormCollumn(),
                    ),
                  ))
            ],
          ),
        ),
      ),

      //____________________________________BOTTOM BAR
      bottomNavigationBar: groupNavigator,
    );
  }
}


class HeaderImage extends StatelessWidget {
  const HeaderImage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Image.asset('images/addgroup.jpg',
        fit: BoxFit.cover,
      )
    );
  }
}

class FormCollumn extends StatefulWidget {
  const FormCollumn({Key? key}) : super(key: key);

  @override
  _FormCollumnState createState() => _FormCollumnState();
}

class _FormCollumnState extends State<FormCollumn> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: size.width-40,
            height: 50,
            decoration: BoxDecoration(
              color: Colors.grey,
              border: Border.all(
                color: Colors.black26,
              ),
              borderRadius: BorderRadius.circular(15),
            ),
            child: TextFormField(
              controller:_controlGroupName,
              decoration: const InputDecoration(
                  border: InputBorder.none,
                prefixIcon: Icon(
                  Icons.person,
                  size: 16,
                  color:Colors.black54,
                ),
                hintText: "Enter Group Name",
                hintStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                  fontWeight: FontWeight.w300,
                )
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Center(
              child: DropdownButtonHideUnderline(
                child: DropdownButton2(
                  dropdownFullScreen: true,
                 isExpanded: true,
                  hint: Row(
                    children: const [
                      Icon(
                        Icons.list,
                        size: 16,
                        color: Colors.green,
                      ),
                      SizedBox(
                        width: 4,
                      ),
                      Expanded(
                        child: Text(
                          'Select Item',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  items: groupTypes
                      .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      overflow: TextOverflow.ellipsis,
                    ),
                  ))
                      .toList(),
                  value: dropdownValue,
                  onChanged: (value) {
                    setState(() {
                      dropdownValue = value as String;
                    });
                  },
                  icon: const Icon(
                    Icons.arrow_forward_ios_outlined,
                  ),
                  iconSize: 14,
                  iconEnabledColor: Colors.white,
                  iconDisabledColor: Colors.grey,
                  buttonHeight: 50,
                  buttonWidth: size.width,
                  buttonPadding: const EdgeInsets.only(left: 14, right: 14),
                  buttonDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: Colors.black26,
                    ),
                    color: Colors.grey,
                  ),
                  buttonElevation: 2,
                  itemHeight: 40,
                  itemPadding: const EdgeInsets.only(left: 14, right: 14),
                  dropdownMaxHeight: 200,
                  dropdownWidth: size.width-40,
                  dropdownPadding: null,
                  dropdownDecoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: Colors.grey,
                  ),
                  dropdownElevation: 8,
                  scrollbarRadius: const Radius.circular(40),
                  scrollbarThickness: 6,
                  scrollbarAlwaysShow: true,
                  offset: const Offset(-20, 0),
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 40),
            child: MaterialButton(
              onPressed: () async
              {
                Group group=Group(
                   groupname: _controlGroupName.text,
                   type: dropdownValue.toString(),
                  adminno: '03105499844'
                );
               bool check=await postDataForGroup(group);
               if(check==true)
                 {
                   print('Data Saved ....!!!!');
                   showSnackBar(context, 'Group Added Successfully', 'ok');
                 }
               else{
                 print('Not Saved ....!!!!');
                 showSnackBar(context, 'Something Went Wrong', 'ok');
                 //Snackbar
               }
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey,
                  border: Border.all(
                    color: Colors.black26,
                  ),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Center(
                  child: Text("Add Group", style: GoogleFonts.josefinSans(
                  fontSize: 18,
                    fontWeight: FontWeight.w800,

                  ),),
                ),

              ),
            ),
          )
        ],
      ),
    );
  }
}

