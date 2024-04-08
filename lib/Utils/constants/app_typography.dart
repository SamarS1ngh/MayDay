import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_colors.dart';

class AppTypography {
  static TextStyle primaryStyle = const TextStyle(fontSize: 25);
  static TextStyle titleText = GoogleFonts.kanit(
      fontWeight: FontWeight.w600, color: Colors.white, fontSize: 40);

  static TextStyle bodyText = GoogleFonts.poppins(
      fontWeight: FontWeight.w500, color: AppColors.primaryColor, fontSize: 30);

  static TextStyle subTitles = GoogleFonts.montserrat(
      fontWeight: FontWeight.w400,
      color: AppColors.secondaryColor,
      fontSize: 26);
}
