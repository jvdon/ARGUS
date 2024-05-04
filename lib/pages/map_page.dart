import 'package:ARGUS/models/user.dart';
import 'package:ARGUS/partials/dropout_marker_future.dart';
import 'package:ARGUS/partials/trash_marker_future.dart';
import 'package:ARGUS/repos/dropout_repo.dart';
import 'package:ARGUS/repos/report_repo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        switch (snapshot.connectionState) {
          case ConnectionState.done:
            if (snapshot.hasError) {
              return const Center(
                child: Column(
                  children: [Icon(Icons.error), Text("Failed to load user")],
                ),
              );
            } else {
              SharedPreferences preferences = snapshot.data!;
              User user = User.fromJson(preferences.getString("user")!);

              return Scaffold(
                body: FlutterMap(
                  options: const MapOptions(
                    initialCenter: LatLng(37.4219983, -122.084),
                  ),
                  children: [
                    TileLayer(
                      urlTemplate:
                          'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                      tileBuilder: _darkModeTileBuilder,
                      userAgentPackageName: 'com.zeyk.Gs',
                    ),
                    (user.empresa)
                        ? TrashMarkerFuture(future: ReportRepo().getReports())
                        : DropoutMarkerFuture(
                            future: DropoutRepo().getDropouts())
                  ],
                ),
              );
            }
          case ConnectionState.waiting:
            return const Center(
              child: Column(
                children: [CircularProgressIndicator(), Text("Loading user")],
              ),
            );
          default:
            return const Center(
              child: Column(
                children: [Icon(Icons.question_mark), Text("Unknown")],
              ),
            );
        }
      },
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
