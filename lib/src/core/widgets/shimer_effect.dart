import 'package:flutter/material.dart';
import 'package:news_api_clean_architecture_and_bloc/src/core/theme/colors.dart';
import 'package:news_api_clean_architecture_and_bloc/src/core/widgets/text_style.dart';
import 'package:shimmer/shimmer.dart';

class ShimerEffect extends StatelessWidget {
  const ShimerEffect({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Shimmer.fromColors(
        baseColor: Pallete.redColor,
        highlightColor: Pallete.whiteColor,
        child: const BoldText(
          text: 'BBC NEWS',
          size: 36,
        ),
      ),
    );
  }
}
