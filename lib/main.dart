import 'package:flutter/material.dart';
import 'package:handysub/components/colors.dart';
import 'package:handysub/pages/loginPage.dart';

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
      home: Builder(builder: (BuildContext context) {
        final height = MediaQuery.of(context).size.height;
        final width = MediaQuery.of(context).size.width;
        return Scaffold(
          body: Stack(
            children: [
              Container(
                height: height,
                width: width,
                child: Image.asset(
                  'assets/main_page_pic1.png',
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                alignment: Alignment(0.0, -0.5),
                child: Image.asset('assets/main_page_logo.png'),
              ),
              Container(
                alignment: Alignment(0.0, 0.75),
                child: ElevatedButton(
                  style: TextButton.styleFrom(
                      backgroundColor: main_color,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30)),
                      minimumSize: Size(width * 0.8, 45)),
                  onPressed: () {
                    // TODO: make Navigate to Login Page.
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  },
                  child: Text(
                    "시작하기",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      fontSize: 20,
                      color: real_black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
