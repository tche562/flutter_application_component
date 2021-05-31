import 'package:flutter/material.dart';
import 'package:flutter_application_component/Component/root_page_header.dart';
import 'package:flutter_application_component/config/theme.dart';

class SchedulePage extends StatefulWidget {
  @override
  _SchedulePageState createState() => _SchedulePageState();
}

class _SchedulePageState extends State<SchedulePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: NBATheme.NBAblue,
        title: RootPageHeader(),
      ),
      body: Text('Schedule'),
    );
  }
}
