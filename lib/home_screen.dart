import 'package:flutter/material.dart';
import 'package:final2/Onboarding_1.dart';
import 'package:final2/Onboarding_2.dart';
import 'package:final2/cards.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        '/': (context) => const MyApp(),
        '/OnboardingSecondScreen': (context) => const OnboardingSecondScreen(),
        '/Card': (context) => const CardScreen(),
      },
    );
  }
}
