import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:medicine_tracker/styles/colors.dart';

class TextFonts {
  static final _monteserratBaseStyle = GoogleFonts.openSans(
    fontWeight: FontWeight.normal,
    color: ColorPackage.black,
  );

  static final head1 =
      _monteserratBaseStyle.copyWith(fontSize: 24, fontWeight: FontWeight.bold);
  static final head2 = _monteserratBaseStyle.copyWith(fontSize: 18);

  static final body1 = _monteserratBaseStyle.copyWith(fontSize: 16);
}
