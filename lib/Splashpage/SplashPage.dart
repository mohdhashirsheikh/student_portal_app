import 'dart:async';
import 'package:flutter/material.dart';
import 'package:student_portal_app/Dashboard/DashboardPage.dart';

class SplashPage extends StatefulWidget {
  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    Timer(
        Duration(seconds: 2),
        () => Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => DashboardPage())));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          width: 250,
          height: 250,
          child: const Image(
            image: AssetImage('assets/images/SchoolLogo.png'),
          ),
        ),
      ),
    );
  }
}
