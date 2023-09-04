import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:toonflix/screens/home_screen.dart';
import 'package:toonflix/widgets/button.dart';
import 'package:toonflix/widgets/card.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(
            textTheme: const TextTheme(
                displayLarge: TextStyle(
              color: Color(0xFF232B55),
            )),
            cardColor: const Color(0xFFF4EDDB),
            colorScheme: ColorScheme.fromSwatch(
              backgroundColor: const Color(0xFFE7626C),
            )),
        home: const HomeScreen());
  }
}
