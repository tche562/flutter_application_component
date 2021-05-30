import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_component/root_page.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

//jump to rootpage
class _StartPageState extends State<StartPage> {
  late Timer _timer;
  int _currentTime = 2;

  void initState() {
    super.initState();

    _timer = Timer.periodic(Duration(milliseconds: 1000), (timer) {
      setState(() {
        _currentTime--;
      });
      if (_currentTime <= 0) {
        _jumpToRoot();
      }
    });
  }

  void _jumpToRoot() {
    _timer.cancel();
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (BuildContext context) => RootPage()),
        (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            'assets/images/NBA HD Wallpapers For Mobile 2020 Basketball Wallpaper.jpg',
            fit: BoxFit.fill,
            width: double.infinity,
            height: double.infinity,
          ),

          // Center(
          //   child: Text(
          //     'This is your NBA Zone',
          //     style: TextStyle(
          //       color: Colors.white,
          //       fontSize: 18,
          //       letterSpacing: 1,
          //       wordSpacing: 3,
          //     ),
          //   ),
          // ),

          Positioned(
            child: Align(
              alignment: Alignment(0.0, 0.5),
              child: Text(
                'This is your' + '\n' + 'NBA Zone',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  letterSpacing: 1,
                  wordSpacing: 3,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
