import 'package:flutter/material.dart';
import 'package:flutter_application_component/config/theme.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: NBATheme.NBAblue,
        title: Text('User Information'),
        actions: [
          IconButton(
            icon: Icon(
              Icons.settings,
              size: 20,
              color: NBATheme.whiteLight,
            ),
            onPressed: () {},
          ),
        ],
      ),
    );
  }
}
