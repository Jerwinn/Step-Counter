import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///This class is made so that the text around the application is identical
///so that the layout is consistent.

class TextFormatWidget extends StatelessWidget {
  double fontSize;
  String titleText;
  TextFormatWidget(this.fontSize, this.titleText, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      titleText,
      style: GoogleFonts.aBeeZee(
        color: Colors.white,
        fontSize: fontSize,
        letterSpacing: 2,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
