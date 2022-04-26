import 'package:flutter/cupertino.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';

class TextWidget {
  //__________________________________________HEADINGS
  static heading1(String text) {
    return Text(
      text,
      style: GoogleFonts.josefinSans(
        fontSize: 36,
        color: Colors.black,
        fontWeight: FontWeight.w800,
      ),
    );
  }

  static heading2(String text) {
    return Text(
      text,
      style: GoogleFonts.josefinSans(
        fontSize: 30,
        color: Colors.black,
        fontWeight: FontWeight.w700,
      ),
    );
  }

  static heading3(String text) {
    return Text(
      text,
      style: GoogleFonts.josefinSans(
          fontSize: 28, color: Colors.black, fontWeight: FontWeight.w600),
    );
  }

  static heading4(String text) {
    return Text(
      text,
      style: GoogleFonts.josefinSans(
        fontSize: 24,
        color: Colors.black,
      ),
    );
  }

  static heading5(String text) {
    return Text(
      text,
      style: GoogleFonts.josefinSans(
          fontSize: 18, color: Colors.black, fontWeight: FontWeight.w600),
    );
  }

  //__________________________________________PARAGRAPH
  static paragraph1(String text) {
    return Text(
      text,
      style: const TextStyle(
        fontSize: 15,
        color: Colors.black,
      ),
    );
  }

  static paragraph2(String text) {
    return Text(
      text,
      style: GoogleFonts.roboto(
          fontSize: 12, color: Colors.black, fontWeight: FontWeight.w500),
    );
  }

  static paragraph3(String text) {
    return Text(
      text,
      style: GoogleFonts.fredokaOne(
        fontSize: 8,
        color: Colors.black,
      ),
    );
  }
}
