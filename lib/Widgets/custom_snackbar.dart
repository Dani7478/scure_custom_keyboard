import 'package:scure_costom_keyboard/all_links.dart';

showSnackBar(BuildContext context, String message, String lbl) {
  final scaffold = ScaffoldMessenger.of(context);
  return scaffold.showSnackBar(
    SnackBar(
      //backgroundColor: Color(0xFF04128f),
      backgroundColor: const Color(0xffae00f0),
      duration: Duration(seconds: 2),
      behavior: SnackBarBehavior.fixed,
      content: Text(
        message,
        style: const TextStyle(
          fontWeight: FontWeight.w800,
          color: Colors.white,
        ),
      ),
      action: SnackBarAction(
        label: lbl,
        onPressed: scaffold.hideCurrentSnackBar,
        textColor: Colors.red,
      ),
    ),
  );
  // final snackBar = SnackBar(
  //   content: const Text('Hello, Coflutter!'),
  //   backgroundColor: const Color(0xffae00f0),
  //   behavior: SnackBarBehavior.floating,
  //   duration: const Duration(seconds: 2),
  //   action: SnackBarAction(
  //       label: 'Done',
  //       textColor: Colors.white,
  //       onPressed: () {
  //         print('Done pressed!');
  //       }),
  // );
  //
  // Scaffold.of(context).showSnackBar(snackBar);
}
