import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:doingbusiness/constants.dart';
import 'package:doingbusiness/views/pages/explore_screen.dart';
import 'package:doingbusiness/views/pages/home_screen.dart';
import 'package:doingbusiness/views/pages/profile_screen.dart';
import 'package:flutter/material.dart';

class MyNavigationBar extends StatefulWidget {
  const MyNavigationBar({super.key});

  @override
  _MyNavigationBarState createState() => _MyNavigationBarState();
}

class _MyNavigationBarState extends State<MyNavigationBar> {
  int _selectedIndex = 0;
  static final List<Widget> _widgetOptions = <Widget>[
    HomeScreen(),
    ExploreScreen(),
    ProfileScreen()
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
        extendBody: true,
        bottomNavigationBar: bottomNavigationBar());
  }

  bottomNavigationBar() {
    return CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        color: primaryColor,
        animationDuration: const Duration(milliseconds: 300),
        items: const <Widget>[
          Icon(
            Icons.home,
            color: Colors.white,
          ),
          Icon(
            Icons.search,
            color: Colors.white,
          ),
          Icon(
            Icons.person,
            color: Colors.white,
          ),
        ],
        onTap: _onItemTapped);
  }
}
