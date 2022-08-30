import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handysub/components/frame.dart';
import 'package:handysub/constants/colors.dart';
import 'package:handysub/pages/Login/loginPage.dart';
import 'package:handysub/pages/Login/signupPage.dart';
import 'package:handysub/pages/Matching/matching_apply_disabled.dart';
import 'package:handysub/pages/Matching/matching_list_disabled.dart';
import 'package:handysub/pages/Matching/matching_pick_abled.dart';
import 'package:handysub/pages/Matching/matching_review_disabled.dart';
import 'package:handysub/pages/Matching/matching_waiting_disabled.dart';

import 'pages/Chatting/chattingPage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: main_color));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: []);
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
              SizedBox(
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
                      MaterialPageRoute(
                        builder: (context) => ChattingPage(),
                      ),
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
