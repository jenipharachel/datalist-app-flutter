import 'package:flutter/material.dart';
import 'screens/home.dart';

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) => MaterialApp(
//         title: 'List Data App',
//         debugShowCheckedModeBanner: false,
//         theme: ThemeData(primaryColor: Colors.black, accentColor: Colors.black),
//         home: Home(),
//       );
// }

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final appTitle = 'Isolate Demo of Data';

    return MaterialApp(
      title: appTitle,
      theme: ThemeData(primaryColor: Colors.black, accentColor: Colors.red),
      home: MyHomePage(title: appTitle),
    );
  }
}
