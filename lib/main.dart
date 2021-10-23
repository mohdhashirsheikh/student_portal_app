import 'package:flutter/material.dart';
import 'package:student_portal_app/Splashpage/SplashPage.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
          scaffoldBackgroundColor: Color(0xFFBCEBEB),
          appBarTheme: AppBarTheme(
            backgroundColor: Color(0xFF097272),
          )),
      debugShowCheckedModeBanner: false,
      home: SplashPage(),
    );
  }
}
