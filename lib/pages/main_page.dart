import 'package:ARGUS/pages/map_page.dart';
import 'package:ARGUS/pages/report_page.dart';
import 'package:ARGUS/utils.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currId = 0;
  List<Widget> pages = [
    MapPage(),
    ReportPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currId],
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black.withAlpha(10),
        currentIndex: currId,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.map_sharp, color: palette["green2"]), label: "Mapa"),
          BottomNavigationBarItem(
              icon: Icon(Icons.add_a_photo_outlined, color: palette["green2"]), label: "Report")
        ],
        onTap: (value) {
          setState(() {
            currId = value;
          });
        },
      ),
    );
  }
}

