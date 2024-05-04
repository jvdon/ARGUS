import 'package:ARGUS/models/tipo_servico.dart';
import 'package:flutter/material.dart';

String baseUrl = "http://192.168.15.177:5000";

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
  "gray": fromHex("#333333"),
  "red": fromHex("#EB5757"),
  "blue": fromHex("#2F80ED"),
};

List<TipoServico> servicos = [
  TipoServico(nome: "Orgânico", color: fromHex("#e0c097")),
  TipoServico(nome: "Plástico", color: fromHex("#d45d79")),
  TipoServico(nome: "Vidro", color: fromHex("#a3ddcb")),
  TipoServico(nome: "Metal", color: fromHex("#f1ef99")),
  TipoServico(nome: "Papel", color: fromHex("#9ea1d4")),
  TipoServico(nome: "Eletrônicos", color: fromHex("#f8b195")),
  TipoServico(nome: "Pilha/Bateria", color: fromHex("#f8b195")),
  TipoServico(nome: "Remédios", color: fromHex("#fef6fb")),
];
