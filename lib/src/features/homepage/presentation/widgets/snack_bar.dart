// ignore_for_file: non_constant_identifier_names
import 'package:flutter/material.dart';
import 'package:news_api_clean_architecture_and_bloc/src/core/theme/colors.dart';

SnackBarShow(BuildContext context, String message) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        style: const TextStyle(color: Pallete.blackColor),
      ),
      backgroundColor: Pallete.whiteColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    ),
  );
}
