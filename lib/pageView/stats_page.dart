import 'package:flutter/material.dart';
import 'package:flutter_application_component/Component/root_page_header.dart';
import 'package:flutter_application_component/config/theme.dart';

class StatsPage extends StatefulWidget {
  @override
  _StatsPageState createState() => _StatsPageState();
}

const List<Tab> _tabs = [
  Tab(
    text: 'Teams',
  ),
  Tab(
    text: 'Players',
  ),
  Tab(
    text: 'Games',
  ),
];

final List<Widget> _tabContent = [
  Text('Teams'),
  Text('Players'),
  Text('Games'),
];

class _StatsPageState extends State<StatsPage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
    );

    // _tabController.addListener(() {
    //   _tabController.index;
    // });
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
