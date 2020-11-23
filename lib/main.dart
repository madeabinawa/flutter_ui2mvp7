import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_ui2mvp7/views/Login.dart';
import 'package:flutter_ui2mvp7/shared_value.dart';
import 'package:flutter_ui2mvp7/api/user_api.dart';
import 'package:flutter_ui2mvp7/api/login_api.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => LoginProvider(),
        ),
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'BRI Booking Service',
        theme: ThemeData(
          // primarySwatch: Colors.blue,
          brightness: Brightness.light,
          primaryColor: SharedColor.mainColor,
          accentColor: SharedColor.secondColor,
        ),
        home: Login(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
