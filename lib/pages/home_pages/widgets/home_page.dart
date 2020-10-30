import 'package:flutter/material.dart';
import 'package:standex/consts/consts_app.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: <Widget>[
          Image.asset('assets/images/blackladybug.png'),
        ],
      ),
    );
  }
}
