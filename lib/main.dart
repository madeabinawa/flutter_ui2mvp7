import 'package:flutter/material.dart';
import 'package:flutter_ui2mvp7/views/Login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // primarySwatch: Colors.blue,
        brightness: Brightness.light,
        primaryColor: Color(0xff021e52),
        accentColor: Color(0xFFff8400),
      ),
      home: Login(),
      debugShowCheckedModeBanner: false,
    );
  }
}
