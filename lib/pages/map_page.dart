import 'package:ARGUS/models/report.dart';
import 'package:ARGUS/repos/report_repo.dart';
import 'package:ARGUS/utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: FutureBuilder<List<Trash>>(
      future: ReportRepo().getReports(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return const Center(
              child: Column(
                children: [
                  CircularProgressIndicator(),
                  Text("Waiting on gps position")
                ],
              ),
            );
          case ConnectionState.done:
            List<Trash> trashs = snapshot.data!;
            return FlutterMap(
              options: const MapOptions(
                initialCenter: LatLng(37.4219983, -122.084),
              ),
              children: [
                TileLayer(
                  urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                  tileBuilder: _darkModeTileBuilder,
                  userAgentPackageName: 'com.zeyk.Gs',
                ),
                MarkerLayer(
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
                                          Text(e.toString())
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
                ),
              ],
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
    ));
  }
}

Widget _darkModeTileBuilder(
  BuildContext context,
  Widget tileWidget,
  TileImage tile,
) {
  return ColorFiltered(
    colorFilter: const ColorFilter.matrix(<double>[
      -0.2126, -0.7152, -0.0722, 0, 255, // Red channel
      -0.2126, -0.7152, -0.0722, 0, 255, // Green channel
      -0.2126, -0.7152, -0.0722, 0, 255, // Blue channel
      0, 0, 0, 1, 0, // Alpha channel
    ]),
    child: tileWidget,
  );
}
