import 'package:flutter/material.dart';
import 'package:next_resume/Auth/Sign_Up.dart';
import 'package:next_resume/Onbording_Screen/OnbordingScreen.dart';
import 'package:next_resume/Splash_Screen/SplashScreen.dart';


class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'NextResume',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const Splashscreen(),
        '/onboarding': (context) => const Onbordingscreen(),
        '/signup': (context) => const SignUp(),
      },
    );
  }
}