import 'package:ARGUS/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomText extends StatelessWidget {
  final String text;
  final double fontSize;

  const CustomText(this.text,  {super.key, this.fontSize = 16});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: GoogleFonts.inder(fontSize: fontSize, color: palette["green3"]),);
  }
}