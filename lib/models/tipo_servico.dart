// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';

class TipoServico {
  String nome;
  Color color;

  TipoServico({
    required this.nome,
    required this.color,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'nome': nome,
      'color': color.value,
    };
  }

  factory TipoServico.fromMap(Map<String, dynamic> map) {
    return TipoServico(
      nome: map['nome'] as String,
      color: Color(map['color'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory TipoServico.fromJson(String source) =>
      TipoServico.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant TipoServico other) {
    if (identical(this, other)) return true;

    return other.nome == nome && other.color == color;
  }

  @override
  int get hashCode => nome.hashCode ^ color.hashCode;
}
