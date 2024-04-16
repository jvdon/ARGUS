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
      body: FlutterMap(
        options: MapOptions(
            initialCenter: LatLng(-23.533773, -46.625290),),
        children: [
          TileLayer(
            urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
            tileBuilder: _darkModeTileBuilder,
            userAgentPackageName: 'com.zeyk.Gs',
          ),
          MarkerLayer(
            markers: [
              Marker(
                  point: LatLng(-23.534331196, -46.634497462),
                  child: GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return Dialog(
                            child: Container(
                              width: 300,
                              height: 300,
                              child: Column(
                                children: [
                                  Expanded(
                                    child: GridView(
                                      gridDelegate:
                                          const SliverGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 3,
                                              mainAxisSpacing: 15,
                                              crossAxisSpacing: 15),
                                      children: List.generate(
                                        9,
                                        (index) => Image.asset(
                                            "assets/images/ARGUS.png"),
                                      ),
                                    ),
                                  ),
                                  Text("LAT LONG")
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
                  )),
              Marker(
                  point: LatLng(-20.534331196, -40.634497462),
                  child: GestureDetector(
                    child: Icon(
                      Icons.location_on,
                      size: 32,
                      color: palette["green2"],
                    ),
                  )),
              Marker(
                  point: LatLng(-32.534331196, -50.634497462),
                  child: GestureDetector(
                    child: Icon(
                      Icons.location_on,
                      size: 32,
                      color: palette["green2"],
                    ),
                  )),
              Marker(
                  point: LatLng(-18.534331196, -64.634497462),
                  child: GestureDetector(
                    child: Icon(
                      Icons.location_on,
                      size: 32,
                      color: palette["green2"],
                    ),
                  ))
            ],
          ),
        ],
      ),
    );
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
