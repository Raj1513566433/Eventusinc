import 'package:eventusinc/Splash_Screen/splash_screen.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Eventus Inc',
      theme: ThemeData(fontFamily: 'Roboto'), // Use a clean sans-serif font
      home: const SplashScreen(),
    );
  }
}