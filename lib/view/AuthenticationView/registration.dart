import 'package:flutter/material.dart';
import 'package:scure_costom_keyboard/Widgets/text_widget.dart';
import 'package:scure_costom_keyboard/all_links.dart';
import 'package:scure_costom_keyboard/model/user_model.dart';

import '../../controller/userController.dart';

class RegistrationView extends StatefulWidget {
  const RegistrationView({Key? key}) : super(key: key);

  @override
  State<RegistrationView> createState() => _RegistrationViewState();
}

class _RegistrationViewState extends State<RegistrationView> {
  String _groupvalue = "Male";
  final TextEditingController _cnrollerFname = TextEditingController();
  final TextEditingController _cnrollerLname = TextEditingController();
  final TextEditingController _cnrollerPhone = TextEditingController();
  final TextEditingController _cnrollerEmail = TextEditingController();
  final TextEditingController _cnrollerPass = TextEditingController();
  final TextEditingController _cnrollerConPass = TextEditingController();

  RegisternewUser() async {
    User newuser = User(
      contact: _cnrollerPhone.text,
      firstname: _cnrollerFname.text,
      lastname: _cnrollerLname.text,
      email: _cnrollerEmail.text,
      password: _cnrollerPass.text,
      gender: _groupvalue,
    );
    bool result = await addUser(newuser);
    print("______________________________${result}");
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Container(
      decoration: const BoxDecoration(
        // color: Colors.white,
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
      height: size.height,
      width: size.width,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                //width: ,
                height: size.height / 15,
                // color: Color.fromARGB(255, 168, 226, 7),
                child: TextWidget.heading2("Registeration"),
              ),
              SizedBox(
                height: size.height / 25,
              ),
              Row(
                children: [
                  Container(
                    width: size.width / 2 - 25,
                    height: size.height / 15,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: ourtextField(size, "First Name", Icons.person,
                        _cnrollerFname, false),
                  ),
                  const SizedBox(width: 10),
                  Container(
                    width: size.width / 2 - 25,
                    height: size.height / 15,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: ourtextField(
                        size, "Last Name", Icons.person, _cnrollerLname, false),
                  ),
                ],
              ),
              SizedBox(
                height: size.height / 30,
              ),
              Container(
                //width: ,
                height: size.height / 15,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: ourtextField(
                    size, "Phone Number", Icons.phone, _cnrollerPhone, false),
              ),
              SizedBox(
                height: size.height / 30,
              ),
              Container(
                //width: ,
                height: size.height / 15,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: ourtextField(
                    size, "Email Address", Icons.email, _cnrollerEmail, false),
              ),
              SizedBox(
                height: size.height / 30,
              ),
              Container(
                //width: ,
                height: size.height / 15,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: ourtextField(
                    size, "Password ", Icons.password, _cnrollerPass, true),
              ),
              SizedBox(
                height: size.height / 30,
              ),
              Container(
                //width: ,
                height: size.height / 15,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8)),
                child: ourtextField(size, "Confirm password", Icons.password,
                    _cnrollerConPass, true),
              ),
              SizedBox(
                height: size.height / 30,
              ),
              Container(
                //width: ,
                height: size.height / 15,
                //color: Color.fromARGB(255, 168, 226, 7),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Radio(
                        // activeColor: Color.fromARGB(255, 168, 226, 7),
                        //fillColor:  Colors.greenAccent,
                        // hoverColor: Color.fromARGB(255, 168, 226, 7),
                      //fillColor: MaterialStateProperty(BlendMode.color),
                        value: "Male",
                        groupValue: _groupvalue,
                        onChanged: (value) {
                          setState(() {
                            _groupvalue = value.toString();
                          });
                        }),
                    TextWidget.paragraph2("Male"),
                    SizedBox(width: size.width / 6),
                    Radio(
                        value: "Female",
                        groupValue: _groupvalue,
                        onChanged: (value) {
                          setState(() {
                            _groupvalue = value.toString();
                          });
                        }),
                    TextWidget.paragraph2("Female"),
                  ],
                ),
              ),
              SizedBox(
                height: size.height / 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: GestureDetector(
                  onTap: () {
                    RegisternewUser();
                  },
                  child: Container(
                    width: size.width / 2 - 25,
                    height: size.height / 15,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(child: TextWidget.heading5("Register")),
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 30,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 50),
                child: InkWell(
                  onTap: () {
                    Get.to(const LoginView());
                  },
                  child: Container(
                    width: size.width / 2 - 25,
                    height: size.height / 15,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(8)),
                    child: Center(child: TextWidget.heading5("I have Account")),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ));
  }

  //_______________________TextForm Field
  ourtextField(Size size, String hint, IconData icon,
      TextEditingController _controller, bool abscr) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: TextFormField(
        obscureText: abscr,
        controller: _controller,
        decoration: InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            icon,
            size: 16,
            //color: Color(0xFF04128f),
            //color: Color(0xFF060607),
            color: Colors.black54,
          ),
          suffix: abscr == true
              ? GestureDetector(
                  onTap: () {
                    if (abscr) {
                      setState(() {
                        abscr = false;
                      });

                      print(abscr);
                    }
                    esle() {
                      setState(() {
                        abscr = true;
                      });
                    }

                    setState(() {});
                  },
                  child: const Icon(
                    Icons.remove_red_eye,
                    size: 16,
                    color: Colors.black54,
                  ),
                )
              : Icon(null),
          hintText: hint,
          hintStyle: const TextStyle(
            fontSize: 15,
            color: Colors.black,
          ),
        ),
        style: const TextStyle(
          fontSize: 15,
          color: Colors.black,
        ),
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
      ),
    );
  }
}

//290