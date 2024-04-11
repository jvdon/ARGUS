import 'package:flutter/material.dart';

Color fromHex(String hexString) {
  final buffer = StringBuffer();
  if (hexString.length == 6 || hexString.length == 7) buffer.write('ff');
  buffer.write(hexString.replaceFirst('#', ''));
  return Color(int.parse(buffer.toString(), radix: 16));
}

Map<String, Color> palette = {
  "green1": fromHex("#219653"),
  "green2": fromHex("#27AE60"),
  "green3": fromHex("#6FCF97"),
  "white": fromHex("#F2F2F2"),
  "gray": fromHex("#333333")
};
