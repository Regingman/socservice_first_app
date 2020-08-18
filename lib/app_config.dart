import 'package:flutter/material.dart';
import 'package:socservice_first_app/screens/home_screen.dart';
import 'blocs/auth/auth_screen.dart';

// #51597e
// #ff0000
// #151721

ThemeData getTheme() {
  return ThemeData(
    primaryColor: Colors.blue,
    accentColor: Colors.blueAccent,
    scaffoldBackgroundColor: Colors.white,
    textTheme: TextTheme(
      bodyText1: TextStyle(
        color: Colors.black,
      ),
      bodyText2: TextStyle(
        color: Colors.black,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
    ),
    iconTheme: IconThemeData(
      color: Colors.black,
    ),
    inputDecorationTheme: InputDecorationTheme(
      fillColor: Colors.black,
      labelStyle: TextStyle(
        color: Colors.black,
      ),
    ),
  );
}

Map<String, WidgetBuilder> getRoutes() => <String, WidgetBuilder>{
      AuthScreen.route: (context) => AuthScreen(),
      HomeScreen.route: (context) => HomeScreen(),
      //RegistrationScreen.route: (context) => RegistrationScreen(),
      //IntroScreen.route: (context) => IntroScreen(),
    };
