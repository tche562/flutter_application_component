import 'package:flutter/material.dart';
import 'package:flutter_application_component/json/jsons.dart';
import 'package:flutter_application_component/start_page.dart';
import 'package:provider/provider.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => JsonFiles(),
        ), // Please make sure your Provider is mentioned here
      ],
      child: MaterialApp(
        title: 'Material App',
        debugShowCheckedModeBanner: false,
        home: StartPage(),
      ),
    );
  }
}
