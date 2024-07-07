import 'package:book_app/models/model.dart';
import 'package:book_app/pages/intro_screen.dart';
import 'package:flutter/material.dart';
import 'package:book_app/pages/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  bool isDarkMode = true;
  void toggleDarkMode() {
    setState(() {
      isDarkMode = !isDarkMode;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
        home: IntroScreen(
          toggleDarkMode: toggleDarkMode,
          isDarkMode: isDarkMode,
        ));
  }
}

List<Book> cart = [];
