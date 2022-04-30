// import 'dart:convert';
// import 'dart:math';
// import 'dart:typed_data';
// import 'package:scure_costom_keyboard/Widgets/text_widget.dart';
// import 'package:scure_costom_keyboard/all_links.dart';
// import 'package:virtual_keyboard/virtual_keyboard.dart';


// class KeyBoardScreen extends StatefulWidget {
//   const KeyBoardScreen({Key? key}) : super(key: key);

//   @override
//   State<KeyBoardScreen> createState() => _KeyBoardScreenState();
// }

// String encText = '';

// class _KeyBoardScreenState extends State<KeyBoardScreen> {
//   // Holds the text that user typed.
//   String text = '';
//   // True if shift enabled.
//   bool shiftEnabled = false;
//   // is true will show the numeric keyboard.
//   bool isNumericMode = true;

//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//     return Scaffold(
//       body: Center(
//         child: Column(
//           children: <Widget>[
//             GestureDetector(
//               onTap: () {
              
//               },
//               child: Container(
//                 height: size.height - 400,
//                 color: Colors.amber,
//                 child: Padding(
//                     padding: const EdgeInsets.all(8.0),
//                     child: TextWidget.paragraph1(encText)),
//               ),
//             ),
//             Container(
//               height: 100,
//               width: size.width,
//               color: Colors.purple,
//               child: Padding(
//                 padding: EdgeInsets.all(8.0),
//                 child: SwitchListTile(
//                   title: Text(
//                     'Keyboard Type = ' +
//                         (isNumericMode
//                             ? 'VirtualKeyboardType.Numeric'
//                             : 'VirtualKeyboardType.Alphanumeric'),
//                   ),
//                   value: isNumericMode,
//                   onChanged: (val) {
//                     setState(() {
//                       isNumericMode = val;
//                     });
//                   },
//                 ),
//                 //child: TextWidget.paragraph1(text)
//               ),
//             ),
//             Container(
//               height: 100,
//               width: size.width,
//               color: Colors.deepOrange,
//               child: Padding(
//                   padding: const EdgeInsets.all(8.0),
//                   child: TextWidget.paragraph1(text)),
//             ),
//             Container(
//               color: Colors.deepPurple,
//               child: VirtualKeyboard(
//                   height: 200,
//                   textColor: Colors.white,
//                   type: isNumericMode
//                       ? VirtualKeyboardType.Numeric
//                       : VirtualKeyboardType.Alphanumeric,
//                   onKeyPress: _onKeyPress),
//             )
//           ],
//         ),
//       ),
//     );
//   }

//   /// Fired when the virtual keyboard key is pressed.
//   _onKeyPress(VirtualKeyboardKey key) {
//     if (key.keyType == VirtualKeyboardKeyType.String) {
//       text = text + (shiftEnabled ? key.capsText : key.text);
//     } else if (key.keyType == VirtualKeyboardKeyType.Action) {
//       switch (key.action) {
//         case VirtualKeyboardKeyAction.Backspace:
//           if (text.length == 0) return;
//           text = text.substring(0, text.length - 1);
//           break;
//         case VirtualKeyboardKeyAction.Return:
//           text = text + '\n';
//           break;
//         case VirtualKeyboardKeyAction.Space:
//           text = text + key.text;
//           break;
//         case VirtualKeyboardKeyAction.Shift:
//           shiftEnabled = !shiftEnabled;
//           break;
//         default:
//       }
//     }

  
//     // Update the screen
//     setState(() {});
//   }

  
// }
