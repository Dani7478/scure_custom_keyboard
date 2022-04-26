// ignore_for_file: unnecessary_const

import 'package:flutter/material.dart';
import 'package:scure_costom_keyboard/Widgets/text_widget.dart';
import 'package:scure_costom_keyboard/controller/userController.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final TextEditingController _cnrollerPhone1 = TextEditingController();
  final TextEditingController _cnrollerPassword1 = TextEditingController();

  identify() async {
    bool isidentify =
        await loginchecker(_cnrollerPhone1.text, _cnrollerPassword1.text);
    if(isidentify==true)
      {
        final prefs = await SharedPreferences.getInstance();
        prefs.setString('phoneno', _cnrollerPhone1.text);
      }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // backgroundColor: Colors.amberAccent,
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: Column(
              children: [
                Container(
                  height: size.height - 500,
                  // color: Colors.pink,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextWidget.heading2("Login"),
                    ],
                  ),
                ),
                Container(
                  height: 300,
                  // color: Colors.red,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          //width: size.width / 2 - 25,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: ourtextField(size, "Enter phone Number",
                              Icons.phone, _cnrollerPhone1, false),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          //width: size.width / 2 - 25,
                          height: 50,
                          decoration: BoxDecoration(
                             color:Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: ourtextField(size, "Enter Password",
                              Icons.password, _cnrollerPassword1, true),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 50),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () async {
                            await identify();
                          },
                          child: Container(
                            //width: size.width / 2 - 25,
                            height: 50,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(8)),
                            child: Center(child: TextWidget.heading5("Login")),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          //width: size.width / 2 - 25,
                          height: 50,
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(8)),
                          child: Center(child: TextWidget.heading5("Register")),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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

//1000 500 500