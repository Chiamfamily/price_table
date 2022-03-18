import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:price_table/pages/root.dart';

import 'theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: themeColor,
      ),
      home: AnimatedSplashScreen(
        duration: 3000,
        splash: Icon(Icons.workspace_premium),
        nextScreen: rootApp(),
        splashTransition: SplashTransition.fadeTransition,
        backgroundColor: white,
      ),
    );
  }
}
