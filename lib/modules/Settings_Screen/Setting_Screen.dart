import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Settings Screen',
            style: TextStyle(
                fontSize: 20.0,fontWeight: FontWeight.bold
                ),
            ),
        ],
        ),
      );
  }
}