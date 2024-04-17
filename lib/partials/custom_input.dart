import 'package:ARGUS/utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CustomInput extends StatelessWidget {
  final String label;
  final TextEditingController controller;
  final TextInputType type;

  const CustomInput({
    super.key,
    required this.label,
    required this.controller,
    this.type = TextInputType.text,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        width: 300,
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: palette["green2"]!, width: 2),
          borderRadius: const BorderRadius.all(Radius.circular(15.0)),
          color: palette["green3"],
        ),
        padding: const EdgeInsets.all(5),
        child: Center(
          child: TextFormField(
            cursorColor: Colors.white,
            maxLength: 40,
            autocorrect: true,
            style: GoogleFonts.inder(color: palette["white"], fontSize: 16),
            decoration: InputDecoration(
              counterText: "",
              border: InputBorder.none,
              errorMaxLines: 1,
              errorStyle: GoogleFonts.inder(
                color: palette["red"]!.withAlpha(255),
                fontSize: 16,
              ),
              label: Center(
                child: Text(
                  label,
                  maxLines: 1,
                  style: GoogleFonts.inder(
                      color: palette["white"]!.withAlpha(150), fontSize: 16),
                ),
              ),
            ),
            controller: controller,
            keyboardType: type,
            validator: (value) =>
                (value == null || value.isEmpty) ? "Campo obrigatório" : null,
          ),
        ),
      ),
    );
  }
}
