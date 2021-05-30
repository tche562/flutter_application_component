import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
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

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(
      length: _tabs.length,
      vsync: this,
    );
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
        title: Text('Home'),
        bottom: TabBar(
          tabs: _tabs,
          controller: _tabController,
        ),
      ),
      body: TabBarView(
        children: _tabContent,
        controller: _tabController,
      ),
    );
  }
}
