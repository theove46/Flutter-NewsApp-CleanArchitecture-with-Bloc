import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PlainText extends StatelessWidget {
  const PlainText({super.key, required this.text, required this.size});
  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.ubuntu(
        fontSize: size,
      ),
    );
  }
}

class BoldText extends StatelessWidget {
  const BoldText({Key? key, required this.text, required this.size})
      : super(key: key);
  final String text;
  final double size;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: GoogleFonts.ubuntu(
        fontSize: size,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
