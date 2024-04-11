// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'package:latlong2/latlong.dart';

class Trash {
  int id;
  LatLng coords;
  String image;
  Trash({
    required this.id,
    required this.coords,
    required this.image,
  });

  Trash copyWith({
    int? id,
    LatLng? coords,
    String? image,
  }) {
    return Trash(
      id: id ?? this.id,
      coords: coords ?? this.coords,
      image: image ?? this.image,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'coords': coords.toJson(),
      'image': image,
    };
  }

  factory Trash.fromMap(Map<String, dynamic> map) {
    return Trash(
      id: map['id'] as int,
      coords: LatLng.fromJson(map['coords'] as Map<String, dynamic>),
      image: map['image'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Trash.fromJson(String source) =>
      Trash.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'Trash(id: $id, coords: $coords, image: $image)';

  @override
  int get hashCode => id.hashCode ^ coords.hashCode ^ image.hashCode;
}
