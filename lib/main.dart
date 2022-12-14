import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handysub/Providers/UserProvider.dart';
import 'package:handysub/components/frame.dart';
import 'package:handysub/components/sidebar.dart';
import 'package:handysub/constants/colors.dart';
import 'package:handysub/constants/textstyle.dart';
import 'package:handysub/pages/Login/loginPage.dart';
import 'package:handysub/pages/Login/signupPage.dart';
import 'package:handysub/pages/Matching/matching_apply_disabled.dart';
import 'package:handysub/pages/Matching/matching_list_disabled.dart';
import 'package:handysub/pages/Matching/matching_pick_abled.dart';
import 'package:handysub/pages/Matching/matching_review_disabled.dart';
import 'package:handysub/pages/Matching/matching_waiting_disabled.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:handysub/Providers/UserProvider.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

import 'pages/Chatting/chattingPage.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: main_color));
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserProvider(),
        )
      ],
      child: MyApp(),
    ),
  );
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

final GlobalKey<ScaffoldState> mainKey_ = GlobalKey();

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
          key: mainKey_,
          endDrawer: SidebarDrawer(),
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
                    // Navigator.pop(context);
                    // TODO: make Navigate to Login Page.
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => LoginPage(),
                      ),
                    );
                  },
                  child: Text(
                    "????????????",
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
