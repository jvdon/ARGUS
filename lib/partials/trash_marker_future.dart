import 'package:ARGUS/models/report.dart';
import 'package:ARGUS/partials/custom_button.dart';
import 'package:ARGUS/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:latlong2/latlong.dart';

class TrashMarkerFuture extends StatelessWidget {
  final Future<List<Report>> future;
  const TrashMarkerFuture({
    super.key,
    required this.future,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Report>>(
      future: future,
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: Column(
                children: [
                  CircularProgressIndicator(),
                  Text("Loading reports")
                ],
              ),
            );
          case ConnectionState.done:
            List<Report> trashs = snapshot.data!.cast<Report>();
            return MarkerLayer(
              markers: trashs
                  .map(
                    (e) => Marker(
                      point: LatLng(e.lat, e.lng),
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
                                      Expanded(
                                        child: Image.network(
                                            "$baseUrl/${e.image_url!}"),
                                      ),
                                      Text(e.toString()),
                                      CustomButton(
                                        content: "Click to view on Maps",
                                        onClick: () async {
                                          String query = Uri.encodeFull(
                                              "http://maps.google.com/maps?z=12&t=m&q=loc:${e.lat}+${e.lng}");
                                          final Uri url = Uri.parse(query);
                                          try {
                                            if (!await launchUrl(url)) {
                                              throw Exception(
                                                  'Could not launch $url');
                                            }
                                          } catch (e) {
                                            print(e);
                                          }
                                        },
                                      )
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
                    ),
                  )
                  .toList(),
            );
          default:
            return const Center(
              child: Column(
                children: [
                  Icon(Icons.question_mark),
                  Text("Oops! Something went wrong!")
                ],
              ),
            );
        }
      },
    );
  }
}
