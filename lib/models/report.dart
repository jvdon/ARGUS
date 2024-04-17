// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class Trash {
  int? report_id;
  double lat;
  double lng;
  String? image_url;

  Trash({
    this.report_id,
    required this.lat,
    required this.lng,
    this.image_url,
  });

  Map<String, dynamic> toMap(int userId) {
    return <String, dynamic>{
      'id': userId.toString(),
      'lat': lat.toString(),
      'lng': lng.toString(),
      'image': image_url,
    };
  }

  factory Trash.fromMap(Map<String, dynamic> map) {
    return Trash(
      report_id: map['report_id'] as int,
      lat: map['lat'] as double,
      lng: map['lng'] as double,
      image_url: map["file_path"],
    );
  }

  String toJson(int userId) => json.encode(toMap(userId));

  factory Trash.fromJson(String source) =>
      Trash.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return '(Latitude: $lat, Longitude: $lng)';
  }
}
