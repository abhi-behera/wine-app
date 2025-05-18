import 'package:flutter/material.dart';
import 'package:wineapp/screens/collection.dart';
import 'package:wineapp/screens/scanner.dart';
import 'package:wineapp/screens/settings.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 1;
  final List<Widget> _pages = [
    ScannerPage(),
    CollectionPage(),
    SettingsPage(),
    SettingsPage(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(14, 28, 33, 1),
        title: Container(
          margin: const EdgeInsets.only(top: 8.0),
          padding: const EdgeInsets.only(top: 8.0),
          child: Row(
            children: [
              Text(
                "My Collection",
                style: TextStyle(
                  fontFamily: 'serif',

                  fontSize: 29,
                  color: Colors.white,
                ),
              ),
              Spacer(),
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  SizedBox(
                    height: 70,
                    width: 50,
                    child: IconButton(
                      onPressed: () {},
                      icon: Image.asset('assets/bell.png', color: Colors.white),
                      iconSize: 40,
                    ),
                  ),
                  Positioned(
                    bottom: 24,
                    right: 12,
                    child: Container(
                      width: 10,
                      height: 10,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(14, 28, 33, 1),
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: 24,
                    right: 12,
                    child: Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: Colors.red,
                        shape: BoxShape.circle,
                      ),
                    ),
                  ),
                ],
              ),
              // Padding(
              //   padding: EdgeInsets.all(8),
              //   child: Align(
              //     child: IconButton(
              //       onPressed: () {},
              //       icon: Image.asset('assets/bell.png', color: Colors.white),
              //     ),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      body: Container(
        padding: const EdgeInsets.only(top: 22, left: 12.0, right: 12.0),
        color: Color.fromRGBO(14, 28, 33, 1),
        child: _pages[_selectedIndex],
      ),
      bottomNavigationBar: Container(
        color: Color.fromRGBO(11, 21, 25, 1),
        padding: const EdgeInsets.only(top: 8.0),
        child: BottomNavigationBar(
          backgroundColor: Color.fromRGBO(11, 21, 25, 1),
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.white30,
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: [
            BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(11, 21, 25, 1),

              icon: ImageIcon(AssetImage('assets/Scan.png')),
              label: 'Scanner',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(11, 21, 25, 1),

              icon: ImageIcon(AssetImage('assets/SquaresFour.png')),
              label: 'Collection',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(11, 21, 25, 1),

              icon: ImageIcon(AssetImage('assets/bottle.png')),
              label: 'Shop',
            ),
            BottomNavigationBarItem(
              backgroundColor: Color.fromRGBO(11, 21, 25, 1),
              icon: ImageIcon(AssetImage('assets/GearSix.png')),
              label: 'Settings',
            ),
          ],
        ),
      ),
    );
  }
}
