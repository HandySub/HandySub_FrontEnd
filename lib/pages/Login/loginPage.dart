import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handysub/components/colors.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: real_white,
          elevation: 0,
          actions: <Widget>[
            IconButton(
              color: real_black,
              icon: const Icon(Icons.navigate_next),
              tooltip: 'Next page',
              onPressed: () {
                SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
                    overlays: []);
                Navigator.pop(context);
              },
            ),
          ],
          systemOverlayStyle: SystemUiOverlayStyle.dark,
        ),
        body: Container(
          width: 360,
          height: 640,
          color: Colors.white,
          padding: const EdgeInsets.only(
            left: 22,
            right: 22,
            top: 70,
            bottom: 100,
          ),
          child: Column(
            children: [
              SizedBox(
                height: 24,
                child: Text(
                  "아이디",
                  textDirection: TextDirection.ltr,
                  // textAlign: TextAlign.left,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: "Gmarket",
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                width: 314,
                height: 63,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                width: 314,
                height: 63,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(
                    width: 1,
                    color: Colors.black,
                  ),
                ),
              ),
              SizedBox(
                height: 24,
              ),
              Container(
                width: 205,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xff3ac0a0),
                ),
                child: Center(
                  child: Text(
                    "로그인",
                    textDirection: TextDirection.ltr,
                    // textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontFamily: "Gmarket",
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
