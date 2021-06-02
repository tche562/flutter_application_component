import 'package:flutter/material.dart';
import 'package:flutter_application_component/config/theme.dart';
import 'package:flutter_application_component/pageView/home_page.dart';
import 'package:flutter_application_component/pageView/profile_page.dart';
import 'package:flutter_application_component/pageView/schedule_page.dart';
import '/pageView/standings.dart';
import 'package:flutter_application_component/pageView/stats_page.dart';

class RootPage extends StatefulWidget {
  @override
  _RootPageState createState() => _RootPageState();
}

const Map<String, String> _bottomNames = {
  'baseketball': 'Home',
  'stats_0': 'Stats',
  'schedule': 'Schedule',
  'profile': 'Profile',
};

class _RootPageState extends State<RootPage> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    Standings(),
    StatsPage(),
    SchedulePage(),
    ProfilePage()
  ];
  final List<BottomNavigationBarItem> _bottomNavBarList = [];

  @override
  void initState() {
    super.initState();

    _bottomNames.forEach((key, value) {
      _bottomNavBarList.add(_bottomNavigationBarItem(key, value));
    });
  }

  void _onTabClick(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: NBATheme.NBAblue,
        items: _bottomNavBarList,
        currentIndex: _currentIndex,
        onTap: _onTabClick,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: NBATheme.whiteDark,
        selectedItemColor: NBATheme.whiteLight,
      ),
    );
  }

  BottomNavigationBarItem _bottomNavigationBarItem(String key, String value) {
    return BottomNavigationBarItem(
      icon: Image.asset(
        'assets/images/icons/$key.png',
        width: 24,
        height: 24,
        color: NBATheme.whiteLight,
      ),
      label: value,
    );
  }
}
