import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'launches/launches.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "SpaceX Today",
      home: HomeLayout(),
    );
  }
}

class HomeLayout extends StatefulWidget {
  @override
  _HomeLayoutState createState() => _HomeLayoutState();
}

class _HomeLayoutState extends State<HomeLayout> {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    LaunchesScreen(),
    Text('Index 1: Noticias'),
    Text('Index 2: Starlink'),
    Text('Index 3: Info'),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _widgetOptions.elementAt(_selectedIndex),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.rocket),
            label: 'Lançamentos',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.news_solid),
            label: 'Noticias',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.track_changes),
            label: 'Starlink',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.info),
            label: 'Info',
          ),
        ],
        currentIndex: _selectedIndex,
        iconSize: 26,
        type: BottomNavigationBarType.fixed,
        //19518B
        unselectedItemColor: Color.fromRGBO(125, 125, 129, 100.0),
        selectedItemColor: Color.fromRGBO(0, 65, 108, 100.0),
        onTap: _onItemTapped,
      ),
    );
  }
}