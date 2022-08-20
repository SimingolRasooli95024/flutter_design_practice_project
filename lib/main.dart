import 'dart:ui';
import 'package:design_flutter_app/screens/landingScreen.dart';
import 'package:design_flutter_app/utils/constants.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp();

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double screenwidth = window.physicalSize.width;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Episode 1',
      theme: ThemeData(
          primaryColor: COLOR_WHITE, accentColor: COLOR_DARK_BLUE , textTheme: screenwidth < 500 ? TEXT_THEME_DEFULT : TEXT_THEME_SMALL),
      home:LandingScreen(

      ),
    );
  }
}

