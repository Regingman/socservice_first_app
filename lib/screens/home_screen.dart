import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static String route = "home_screen";
  HomeScreen({Key key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Home"),
      ),
      body: Text("Login success"),
    );
  }
}
