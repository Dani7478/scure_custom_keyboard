import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:scure_costom_keyboard/view/ChatView/add_new_group.dart';
import 'package:scure_costom_keyboard/view/ChatView/indivisual_message_view.dart';
import 'package:scure_costom_keyboard/view/ChatView/my_groups.dart';
import 'package:scure_costom_keyboard/view/HomepageView/home_page.dart';
import 'package:scure_costom_keyboard/view/screens/testing.dart';
import 'all_links.dart';

//_____________________________________MAIN
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

//_____________________________________APPLICATON CALL

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Scure Keyboard',
      theme: ThemeData(
        //primarySwatch: Colors.teal,
        primarySwatch: Colors.green,
      ),
      home:const LoginView()
    );
  }
}


//flutter run --no-sound-null-safety