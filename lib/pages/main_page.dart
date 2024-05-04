import 'package:ARGUS/pages/dropout_page.dart';
import 'package:ARGUS/pages/logout_page.dart';
import 'package:ARGUS/pages/map_page.dart';
import 'package:ARGUS/pages/report_page.dart';
import 'package:ARGUS/utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  final bool empresa;
  const MainPage({super.key, required this.empresa});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int currId = 0;
  List<Widget> pages = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pages = [
      const MapPage(),
      (widget.empresa) ? const DropoutPage() : const ReportPage(),
      const LogoutPage()
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[currId],
      extendBody: true,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.black.withAlpha(10),
        currentIndex: currId,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.map_sharp, color: palette["green2"]),
              label: "Mapa"),
          BottomNavigationBarItem(
              icon: Icon(
                  (widget.empresa)
                      ? Icons.add_business
                      : Icons.add_a_photo_outlined,
                  color: palette["green2"]),
              label: (widget.empresa) ? "Cadastrar" : "Report"),
          BottomNavigationBarItem(
              icon: Icon(Icons.logout, color: palette["green2"]),
              label: "Logout"),
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
