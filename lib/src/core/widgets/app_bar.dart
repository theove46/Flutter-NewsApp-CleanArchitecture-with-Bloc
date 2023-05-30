import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_api_clean_architecture_and_bloc/src/core/theme/colors.dart';

class BBCAppBar extends StatelessWidget {
  const BBCAppBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          'B',
          style: GoogleFonts.ubuntu(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            backgroundColor: Pallete.whiteColor,
            color: Pallete.redColor,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          'B',
          style: GoogleFonts.ubuntu(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            backgroundColor: Pallete.whiteColor,
            color: Pallete.redColor,
          ),
        ),
        const SizedBox(
          width: 3,
        ),
        Text(
          'C',
          style: GoogleFonts.ubuntu(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            backgroundColor: Pallete.whiteColor,
            color: Pallete.redColor,
          ),
        ),
        Text(
          ' NEWS',
          style: GoogleFonts.ubuntu(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Pallete.whiteColor,
          ),
        ),
      ],
    );
  }
}
