import 'dart:io';

import 'package:ARGUS/models/location_service.dart';
import 'package:ARGUS/models/user.dart';
import 'package:ARGUS/partials/custom_button.dart';
import 'package:ARGUS/utils.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  File? image;
  String error = "";
  String info = "";
  bool clicked = false;
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(height: 30),
          (error.isNotEmpty)
              ? Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: palette["green1"]!, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    color: palette["green2"],
                  ),
                  child: Center(
                    child: Text(
                      error,
                      textAlign: TextAlign.center,
                      style:
                          GoogleFonts.inder(fontSize: 20, color: Colors.white),
                    ),
                  ),
                )
              : const SizedBox(),
          // ADD BUTTON
          const SizedBox(height: 10),
          _buildCamera(),
          const SizedBox(height: 10),
          (info.isNotEmpty)
              ? Container(
                  width: 300,
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: palette["green1"]!, width: 2),
                    borderRadius: const BorderRadius.all(Radius.circular(15.0)),
                    color: palette["green2"],
                  ),
                  child: Center(
                    child: Text(
                      info,
                      textAlign: TextAlign.center,
                      style:
                          GoogleFonts.inder(fontSize: 20, color: Colors.white),
                    ),
                  ),
                )
              : const SizedBox(),
          const SizedBox(height: 20),
          (loading)
              ? CircularProgressIndicator(
                  color: palette["green2"]!,
                )
              : SizedBox(),
          const SizedBox(height: 20),
          CustomButton(
            content: "ENVIAR",
            onClick: () async {
              setState(() {
                loading = true;
              });

              final prefs = await SharedPreferences.getInstance();
              if (prefs.getString("user") != null) {
                User user = User.fromJson(prefs.getString("user")!);
                LocationService service = LocationService();
                Position position = await service.determinePosition();
                try {
                  if (image != null) {
                    Map<String, dynamic> formData = {
                      'id': user.id.toString(),
                      'lat': position.latitude.toString(),
                      'lng': position.longitude.toString(),
                      'image': base64Encode(image!.readAsBytesSync())
                    };
                    http.Response response = await http
                        .post(Uri.parse("$baseUrl/submit"), body: formData);
                    if (response.statusCode == 200) {
                      setState(() {
                        info = "Report uploaded successfully";
                        error = "";
                        loading = false;
                      });
                    } else {
                      setState(() {
                        error = "Error uploading report";
                        info = "";
                        loading = false;
                      });
                    }
                  } else {
                    setState(() {
                      error = "Image must not be null";
                      info = "";
                      loading = false;
                    });
                  }
                } catch (e) {
                  print(e);
                  setState(() {
                    error = "Failed to send report: ${e.toString()}";
                    info = "";
                    loading = false;
                  });
                }
              }
            },
          )
        ],
      ),
    );
  }

  Widget _buildCamera() {
    return IconButton(
      onPressed: () {
        openCamera();
      },
      icon: Container(
        decoration: BoxDecoration(
          color: palette["gray"],
          border: Border.all(color: palette["green2"]!, width: 1),
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(15),
            bottomRight: Radius.circular(15),
          ),
        ),
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width,
        child: (image != null)
            ? Image.file(image!)
            : const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.camera_enhance,
                    size: 128,
                  ),
                  Text("Clique para adicionar photos")
                ],
              ),
      ),
    );
  }

  void openCamera() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => CameraCamera(
          onFile: (file) {
            image = file;
            error = "";
            info = "";
            Navigator.pop(context);
            setState(() {});
          },
        ),
      ),
    );
  }
}
