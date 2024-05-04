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
        padding: const EdgeInsets.all(5),
        decoration: BoxDecoration(
            border: Border.all(color: palette["green2"]!, width: 2),
            borderRadius: const BorderRadius.all(Radius.circular(15)),
            color: palette["green3"]),
        child: TextFormField(
          keyboardType: type,
          obscureText: (type == TextInputType.visiblePassword),
          validator: (value) {
            if (type == TextInputType.visiblePassword) {
              RegExp regExp = RegExp(
                  r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[#?!@$%^&*-]).{8,}$');
              if (value == null || value.isEmpty || !regExp.hasMatch(value)) {
                return "Senha invalida";
              } else {
                return null;
              }
            }

            if (value == null || value.isEmpty) {
              return "Campo Obrigatório";
            } else {
              return null;
            }
          },
          controller: controller,
          cursorColor: Colors.white,
          decoration: InputDecoration(
              alignLabelWithHint: true,
              errorStyle: GoogleFonts.inder(
                  color: palette["red"], fontSize: 12, height: 0.2),
              hintText: label,
              border: InputBorder.none,
              hintStyle: GoogleFonts.inder(
                color: Colors.white,
              ),
              floatingLabelAlignment: FloatingLabelAlignment.center),
          style: GoogleFonts.inder(color: palette["white"], fontSize: 14),
        ),
      ),
    );
  }
}
