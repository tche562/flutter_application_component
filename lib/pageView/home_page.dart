import 'package:flutter/material.dart';
import 'package:flutter_application_component/Component/root_page_header.dart';
import 'package:flutter_application_component/config/theme.dart';
import 'package:flutter_application_component/Component/game_page_header.dart';
import 'package:flutter_application_component/pageView/sub_pages/east_page.dart';
import 'package:flutter_application_component/pageView/sub_pages/west_page.dart';
import '/json/jsons.dart';
import '/http/network.dart';
import '/http/urls.dart';
import 'package:provider/provider.dart';
import '/component/connection.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

const List<Tab> _tabs = [
  Tab(
    text: 'West',
  ),
  Tab(
    text: 'East',
  ),

  // Tab(
  //   text: 'Games',
  // ),
];

final List<Widget> _tabContent = [
  WestPage(),
  EastPage(),

  // Text('Games'),
];

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
    );

    _tabController.addListener(() {
      _tabController.index;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: NBATheme.NBAblue,
        title: RootPageHeader(),
        bottom: TabBar(
          tabs: _tabs,
          controller: _tabController,
          isScrollable: true,
        ),
      ),
      body: TabBarView(
        children: _tabContent,
        controller: _tabController,
      ),
    );
  }
}
