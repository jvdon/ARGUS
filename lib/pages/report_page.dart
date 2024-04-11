import 'package:ARGUS/partials/custom_button.dart';
import 'package:ARGUS/utils.dart';
import 'package:camera_camera/camera_camera.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatefulWidget {
  const ReportPage({super.key});

  @override
  State<ReportPage> createState() => _ReportPageState();
}

class _ReportPageState extends State<ReportPage> {
  List images = [];
  bool clicked = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          // ADD BUTTON
          const SizedBox(height: 30),
          // _buildCamera(),
          const SizedBox(height: 10),
          // LIST IMAGES
          Container(
            height: 150,
            decoration: BoxDecoration(
              border: Border.all(color: palette["green2"]!),
            ),
            width: MediaQuery.of(context).size.width * 0.95,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: images.length,
              itemBuilder: (context, index) {
                Image img = kIsWeb
                    ? Image.network(images[index].path)
                    : Image.file(images[index], fit: BoxFit.fitHeight);
                return Container(
                  height: 150,
                  width: 100,
                  child: img,
                );
              },
            ),
          ),
          const SizedBox(height: 20),
          CustomButton(
            content: "ENVIAR",
            onClick: () {},
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
        child: const Column(
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
            images.add(file);
            Navigator.pop(context);
            setState(() {});
          },
        ),
      ),
    );
  }
}
