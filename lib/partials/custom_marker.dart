import 'package:ARGUS/models/report.dart';
import 'package:ARGUS/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class CustomMarker {
  final Trash trash;

  const CustomMarker({required this.trash});

  Marker build(BuildContext context) {
    return Marker(
      point: LatLng(trash.lat, trash.lng),
      child: GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (context) {
              return Dialog(
                child: SizedBox(
                  width: 300,
                  height: 300,
                  child: Column(
                    children: [
                      Expanded(child: Image.network(trash.image_url!)),
                      Text(trash.toString())
                    ],
                  ),
                ),
              );
            },
          );
        },
        child: Icon(
          Icons.location_on,
          size: 32,
          color: palette["green2"],
        ),
      ),
    );
  }
}
