import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/boarding_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xFF012169),
        textTheme: GoogleFonts.interTextTheme(
          Theme.of(context).textTheme,
        ).apply(
          bodyColor: Color(0xFF012169),
          displayColor: Color(0xFF012169),
        ),
      ),
      home: BoardingScreen(),
    );
  }
}