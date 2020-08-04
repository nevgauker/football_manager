import 'package:flutter/material.dart';
import 'package:footballmanager/screens/main_screen.dart';
import 'screens/team_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: MyHomePage.screeen_id,
      routes: {
        MyHomePage.screeen_id: (context) => MyHomePage(),
      },
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
    );
  }
}
