import 'package:flutter/material.dart';
import 'package:handysub/components/colors.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'GmarketSans',
      ),
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: main_color,
          title: const Text(
            "HandySub",
            style: TextStyle(fontFamily: 'GmarketSans'),
          ),
        ),
        body: Center(
          child: Image.asset(
            "assets/main_page_pic1.png",
          ),
        ),
      ),
    );
  }
}
