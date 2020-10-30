import 'package:flutter/material.dart';
import 'package:standex/consts/consts_app.dart';
import 'package:standex/pages/home_pages/widgets/app_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double statusHeight = MediaQuery.of(context).padding.top;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Positioned(
            child: Opacity(
              child: Image.asset(
                ConstsApp.blackladybug,
                height: 600,
                width: 600,
              ),
              opacity: 0.1,
            ),
            top: -(400 / 1.8),
            left: -(screenWidth - 480),
          ),
          Container(
            child: Column(
              children: [
                Container(
                  height: statusHeight,
                ),
                AppBarHome(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
