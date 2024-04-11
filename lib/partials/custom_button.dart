import 'package:ARGUS/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomButton extends StatelessWidget {
  final Function() onClick;
  final String content;

  const CustomButton({super.key, required this.content, required this.onClick});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      height: 50,
      decoration: BoxDecoration(
        border: Border.all(color: palette["green1"]!, width: 2),
        borderRadius: const BorderRadius.all(Radius.circular(15.0)),
        color: palette["green2"],
      ),
      child: IconButton(
        onPressed: onClick,
        icon: Text(content, style: GoogleFonts.inder(color: Colors.white)),
      ),
    );
  }
}
