import 'package:flutter/material.dart';

import 'app_bar.dart';

class SplashScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AppBarTitle(),
            Text('Все начинается с тебя!'),
          ],
        ),
      ),
    );
  }
}
