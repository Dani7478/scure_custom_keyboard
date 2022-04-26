import 'dart:developer';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:scroll_app_bar/scroll_app_bar.dart';
import 'package:scure_costom_keyboard/Widgets/text_widget.dart';
import '../../model/gridviewmodel.dart';
import '../../model/gridviewmodel.dart';
import 'package:scure_costom_keyboard/all_links.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({Key? key}) : super(key: key);

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

List<String> gridviewNames = [
  "Theme",
  "Setting",
  "Disable",
  "Share",
  "No Adds",
  "More Apps"
];

List<Icon> gridviewIcons = [
  const Icon(
    Icons.color_lens,
    size: 42,
    color: Colors.lightBlue,
  ),
  const Icon(
    Icons.settings,
    size: 42,
    color: Colors.lightBlue,
  ),
  const Icon(
    Icons.disabled_by_default,
    size: 42,
    color: Colors.lightBlue,
  ),
  const Icon(
    Icons.share,
    size: 42,
    color: Colors.lightBlue,
  ),
  const Icon(
    Icons.newspaper,
    size: 42,
    color:  Colors.lightBlue,
  ),
  const Icon(
    Icons.more,
    size: 42,
    color: Colors.lightBlue,
  ),
];

class _HomePageScreenState extends State<HomePageScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(
      children: [headerPortion(size), innerPortion(size), buttomPortion(size)],
    ));
  }

  //_____________________________________HEADER PORTION
  headerPortion(Size size) {
    return Container(
      height: size.height - 500,
      decoration: const BoxDecoration(
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
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                Icon(
                  Icons.info,
                  size: 30,
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            TextWidget.paragraph2("welcome in"),
            TextWidget.heading2("scure costom keyboard"),
            TextWidget.paragraph2(
                "Now Launch this keyboard and save personal text"),
          ],
        ),
      ),
    );
  }

  //_____________________________________INNER PORTION
  innerPortion(Size size) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
        //color: Colors.red,
        height: 230,
        width: size.width,
        child: Column(children: [
          innerListTile1(size),
          innerListTile2(size),
          // Container(
          //   height: 250,
          //   width: size.width,
          //   color: Colors.white,
          //   child: bottomGridView(size),
          // )
          // bottomGridView(size)
        ]),
      ),
    );
  }

  //_____________________________________1ST LIST TILE
  innerListTile1(Size size) {
    return InkWell(
      onTap: () {
        Get.to(HomeChatView());
      },
      child: Container(
        height: 100,
        child: Card(
          borderOnForeground: true,
          elevation: 20,
          child: Center(
            child: ListTile(
              autofocus: true,
              title: TextWidget.heading5("Open Chatting App"),
              subtitle: TextWidget.paragraph2("Connect with your friend safely"),
              leading: const CircleAvatar(
                maxRadius: 20,
                backgroundColor: Colors.white,
                //child: Image.asset("images/easypaisa.png"),
                child: Icon(
                  Icons.message,
                  color: Colors.lightBlue,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //_____________________________________2ND LIST TILE
  innerListTile2(Size size) {
    return InkWell(
      onTap: () {
        Get.to(RegistrationView());
      },
      child: Container(
        height: 100,
        child: Card(
          borderOnForeground: true,
          elevation: 20,
          child: Center(
            child: ListTile(
              autofocus: true,
              title: TextWidget.heading5("Join Now "),
              subtitle: TextWidget.paragraph2("Its Fully scure chatting app"),
              leading: const CircleAvatar(
                maxRadius: 20,
                backgroundColor: Colors.white,
                //child: Image.asset("images/easypaisa.png"),
                child: Icon(
                  Icons.message,
                  color: Colors.lightBlue,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  //_____________________________________BOTTOM GRID VIEW
  buttomPortion(Size size) {
    return Container(
      width: size.width,
      height: 270,
      // color: Colors.amber,
      child: bottomGridView(size),
    );
  }

  //_____________________________________BOTTOM GRID VIEW

  bottomGridView(Size size) {
    return GridView.count(
      crossAxisCount: 3,
      children: List.generate(6, (index) {
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: GestureDetector(
            onTap: () {
             // Get.to(KeyBoardScreen());
            },
            child: Card(
              elevation: 15,
              child: Container(
                decoration: BoxDecoration(
                    color: Color.fromARGB(240, 255, 255, 255),
                    borderRadius: BorderRadius.circular(10)),
                width: size.width / 3,
                height: size.height / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    gridviewIcons[index],
                    const SizedBox(
                      height: 5,
                    ),
                    TextWidget.heading5(gridviewNames[index]),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
