import 'package:flutter/material.dart';

class LoadingScreen extends StatelessWidget {
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    return Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          SizedBox(
            height: screenWidth * 0.6,
            width: screenWidth * 0.6,
            child: CircularProgressIndicator(
              valueColor:
                  AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
              strokeWidth: 10,
            ),
          ),
        ]));
  }
}
