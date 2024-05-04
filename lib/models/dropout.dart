// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:ffi';

import 'package:ARGUS/models/tipo_servico.dart';

class Dropout {
  int id;
  String nome;
  double lng;
  double lat;
  List<TipoServico> servicos;

  Dropout({
    required this.id,
    required this.nome,
    required this.lng,
    required this.lat,
    required this.servicos,
  });

  Dropout copyWith({
    int? id,
    String? nome,
    double? lng,
    double? lat,
    List<TipoServico>? servicos,
  }) {
    return Dropout(
      id: id ?? this.id,
      nome: nome ?? this.nome,
      lng: lng ?? this.lng,
      lat: lat ?? this.lat,
      servicos: servicos ?? this.servicos,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'nome': nome,
      'lng': lng,
      'lat': lat,
      'servicos': servicos.map((x) => x.toMap()).toList(),
    };
  }

  factory Dropout.fromMap(Map<String, dynamic> map) {
    return Dropout(
      id: map['id'] as int,
      nome: map['nome'] as String,
      lng: double.parse((map['lng'] as String)),
      lat: double.parse((map['lat'] as String)),
      servicos: (jsonDecode(map['servicos']) as List)
          .map<TipoServico>(
              (x) => TipoServico.fromMap(x as Map<String, dynamic>))
          .toList(),
    );
  }

  String toJson() => json.encode(toMap());

  factory Dropout.fromJson(String source) =>
      Dropout.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'Dropout(id: $id, nome: $nome, lng: $lng, lat: $lat, servicos: $servicos)';
  }
}
