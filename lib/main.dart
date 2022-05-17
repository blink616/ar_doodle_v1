import 'package:flutter/material.dart';
import 'package:flutter__dummy_geofencing/doodles.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'ar_draw.dart';
import 'feed.dart';
import 'search.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      theme: ThemeData(fontFamily: 'JosefinSans'),
      home: const MyStatefulWidget(),
      // home: ARMain(),
    );
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    // Feed(),
    Doodles(),
    ARMain(),
    Search(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.informationOutline),
            label: 'Feed',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.draw),
            label: 'AR Draw',
          ),
          BottomNavigationBarItem(
            icon: Icon(MdiIcons.mapMarker),
            label: 'Explore',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.black,
        onTap: _onItemTapped,
        unselectedItemColor: const Color.fromRGBO(0, 0, 0, .6),
        backgroundColor: Colors.white,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
    );
  }
}
