import 'package:flutter/material.dart';
import 'package:flutter_application_component/start_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      debugShowCheckedModeBanner: false,
      home: StartPage(),
    );
  }
}
