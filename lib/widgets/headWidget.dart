import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

///This class is used to help format a toolbar.
///However currently it is just used to display the date.

class Header extends StatelessWidget {
  String text;
  Function onPress;
  Header(this.text, this.onPress, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: GestureDetector(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Text(
              text,
              style: GoogleFonts.aBeeZee(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  letterSpacing: 2),
            ),
            const SizedBox(
              height: 5,
            ),
          ],
        ),
      ),
    );
  }
}