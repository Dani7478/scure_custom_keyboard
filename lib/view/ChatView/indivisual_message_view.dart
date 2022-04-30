import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scure_costom_keyboard/all_links.dart';

class IndivisualMessageView extends StatefulWidget {
  final String name;
  final String phonno;


  const IndivisualMessageView({required this.name, required this.phonno});

  @override
  State<IndivisualMessageView> createState() => _IndivisualMessageViewState();
}

bool _isCapital = false;
bool _isSpecialCahr = false;
String message='';

class _IndivisualMessageViewState extends State<IndivisualMessageView> {
  //const IndivisualMessageView({Key? key}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: const Color(0xFF0f65b3),
          toolbarHeight: 60.0,
          title: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.name,
                style: GoogleFonts.josefinSans(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                widget.phonno,
                style: GoogleFonts.josefinSans(
                  fontSize: 15,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          actions: [
            Stack(
              children: [
                FlatButton(
                  onPressed: () async {
                   //encrypt();
                  },
                  child: const Center(
                    child: Icon(
                      Icons.notifications,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
                Positioned(
                  top: 25,
                  right: 17,
                  child: CircleAvatar(
                    backgroundColor: Colors.black,
                    radius: 6,
                  ),
                ),
                Container(),
              ],
            ),
            PopupMenuButton<String>(onSelected: (value) {
              if (value == "logout") {
                //____
              }
            }, itemBuilder: (BuildContext context) {
              return [
                PopupMenuItem(
                  child: Row(
                    children: [
                      IconButton(
                        icon: const Icon(
                          Icons.logout,
                          color: Color(0xFF0f65b3),
                        ),
                        onPressed: () async {},
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      const Text(
                        "Logout",
                        style: TextStyle(fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                  value: "logout",
                ),
              ];
            }),
          ],
        ),
        backgroundColor: Colors.white,
        body: Container(
          height: size.height,
          width: size.width,
          //color: Colors.grey,
          child: Column(
            children: [
              Expanded(
                  flex: 6,
                  child: Container(
                    color: Colors.red,
                  )),
              Expanded(
                  flex: 3,
                  child: Container(
                 //   color: Colors.green,
                    child: KeayBoard(),
                  ))
            ],
          ),
        ));
  }

  MessageDetail1(Size size) {
    return Align(
      alignment: Alignment.topRight,
      child: Container(
        width: size.width / 1.5,
        height: size.height / 12,
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topRight: Radius.circular(2),
            topLeft: Radius.circular(8),
            bottomRight: Radius.circular(8),
            bottomLeft: Radius.circular(8),
          ),
          gradient: LinearGradient(
            colors: [Colors.purple, Colors.red],
            begin: Alignment.bottomRight,
            end: Alignment.topLeft,
          ),
        ),
      ),
    );
  }
}

class KeayBoard extends StatefulWidget {
 // const KeayBoard({Key? key}) : super(key: key);

  @override
  State<KeayBoard> createState() => _KeayBoardState();
}

class _KeayBoardState extends State<KeayBoard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.grey,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3, horizontal: 5),
                  child: Text(message,
                    style: GoogleFonts.roboto(
                      fontSize: 12,
                      fontWeight: FontWeight.w500
                    ),
                  ),
                ),
              )),
          Expanded(
              flex: 4,
              child: Container(
                //color: Colors.black,
                width: double.infinity,
                child: Column(
                  children: [
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                              child:
                                  FlatButton(
                                    onPressed: () { message=message+'1';
                                    setState(() {});
                                    print(message);},
                                    hoverColor: Colors.lightGreenAccent,
                                    highlightColor: Colors.yellowAccent,
                                    child: Container(
                                        child: Center(child: Text("1"))),
                                  )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'2';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("2"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'3';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("3"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'4';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("4"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'5';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("5"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'6';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("6"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'7';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("7"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'8';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("8"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'9';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("9"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'0';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("0"))),
                              )
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'q';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("q"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'w';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("w"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'e';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("e"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'r';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("r"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'t';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("t"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'y';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("y"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'u';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("u"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'i';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("i"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'o';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("o"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'p';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("p"))),
                              )
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'a';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("a"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'s';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("s"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'d';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("d"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'f';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("f"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'g';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("g"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'h';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("h"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'j';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("j"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'k';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("k"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'l';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("l"))),
                              )
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'z';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("z"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'x';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("x"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'c';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("c"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'v';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("v"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'b';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("b"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'n';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("n"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () { message=message+'m';
                                setState(() {});
                                print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("m"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () {
                                  if (message != null && message.length > 0) {
                                    message = message.substring(0, message.length - 1);
                                  }
                                  setState((){});
                                },
                                onLongPress: (){
                                  message='';
                                  setState((){});
                                },
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Icon(Icons.delete, size: 20,))),
                              )
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        children: [
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () {
                                  _isCapital=true;
                                  setState(() {});
                                  print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("cpas"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () {
                                  message=message+' ';
                                  setState(() {});
                                  print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("space"))),
                              )
                          ),
                          Expanded(
                              child:
                              FlatButton(
                                onPressed: () {
                                  _isSpecialCahr=true;
                                  setState(() {});
                                  print(message);},
                                hoverColor: Colors.lightGreenAccent,
                                highlightColor: Colors.yellowAccent,
                                child: Container(
                                    child: Center(child: Text("@#%^"))),
                              )
                          ),

                        ],
                      ),
                    ),
                  ],
                ),
              )),
        ],
      ),
    );
  }
}
