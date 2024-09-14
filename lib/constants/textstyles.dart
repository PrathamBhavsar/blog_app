import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'colors.dart';

class AppTextStyles {
  static TextStyle heading = GoogleFonts.poppins(
    color: AppColorsLightMode.text,
    fontSize: 35.0,
    fontWeight: FontWeight.w700,
  );
  static TextStyle chipText = GoogleFonts.poppins(
      color: AppColorsLightMode.text,
      fontSize: 12,
      fontWeight: FontWeight.w600);

  static TextStyle btnTextWhite = GoogleFonts.poppins(
      color: AppColorsLightMode.backgroundWhite,
      fontSize: 14,
      fontWeight: FontWeight.w700);

  static TextStyle btnTextBlack = GoogleFonts.poppins(
      color: AppColorsLightMode.text,
      fontSize: 14,
      fontWeight: FontWeight.w700);
  static TextStyle privacyPolicyText =
      GoogleFonts.poppins(color: AppColorsLightMode.textSecondary);
  static TextStyle loginText = GoogleFonts.poppins(
      color: AppColorsLightMode.primary,
      fontSize: 14,
      fontWeight: FontWeight.w700);
}
