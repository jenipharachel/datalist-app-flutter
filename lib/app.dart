import 'package:flutter/material.dart';
import 'screens/home.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Bike Stations in NYC';

    return MaterialApp(
      title: appTitle,
      theme: ThemeData(primaryColor: Colors.black, accentColor: Colors.red),
      home: MyHomePage(title: appTitle),
    );
  }
}
