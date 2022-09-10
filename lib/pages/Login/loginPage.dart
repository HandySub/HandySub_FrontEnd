import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handysub/components/sidebar.dart';
import 'package:handysub/constants/colors.dart';
import 'package:handysub/pages/Login/signupPage.dart';

import '../../components/appBar.dart';

final GlobalKey<ScaffoldState> loginPageKey_ = GlobalKey();

//Todo : change TextField to TextFieldForm
//Todo : Make sign in with kakao func
//Todo : Make sign in with google func
class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'GmarketSans',
      ),
      home: Scaffold(
        key: loginPageKey_,
        endDrawer: SidebarDrawer(),
        appBar: defaultAppBar(context, "로그인", real_white, loginPageKey_),
        body: SingleChildScrollView(
          child: Container(
            color: real_white,
            padding: const EdgeInsets.only(
              left: 22,
              right: 22,
              top: 15,
              bottom: 15,
            ),
            child: Column(
              children: [
                LoginInfoText(height, width, "이메일"),
                InputBox(width, height, "jw101902@naver.com"),
                SizedBox(
                  height: height * 0.01, //10
                ),
                LoginInfoText(height, width, "비밀번호"),
                InputBox(width, height, "passwordExample123@!"),
                SizedBox(
                  height: height * 0.025, //24
                ),
                Container(
                  width: width * 0.48, //205
                  height: height * 0.055, //45
                  child: ElevatedButton(
                    style: TextButton.styleFrom(
                      backgroundColor: emerald,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25)),
                    ),
                    onPressed: () {},
                    child: Text(
                      "로그인",
                      style: TextStyle(
                        color: real_white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: height * 0.025, //15
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width * 0.23,
                      height: height * 0.05,
                      child: TextButton(
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => SignupPage()),
                          );
                        },
                        child: Text(
                          "회원가입",
                          style: TextStyle(color: real_black_65),
                        ),
                      ),
                    ),
                    Container(
                      width: width * 0.01,
                      height: height * 0.05,
                      child: Center(
                          child: Text(
                        "|",
                        style: TextStyle(color: real_black_65),
                      )),
                    ),
                    Container(
                      width: width * 0.26,
                      height: height * 0.05,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "아이디 찾기",
                          style: TextStyle(color: real_black_65),
                        ),
                      ),
                    ),
                    Container(
                      width: width * 0.01,
                      height: height * 0.05,
                      child: Center(
                          child: Text(
                        "|",
                        style: TextStyle(color: real_black_65),
                      )),
                    ),
                    Container(
                      width: width * 0.29,
                      height: height * 0.05,
                      child: TextButton(
                        onPressed: () {},
                        child: Text(
                          "비밀번호 찾기",
                          style: TextStyle(color: real_black_65),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: width * 0.3,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Divider(
                          color: real_black_65,
                          thickness: 1.0,
                        ),
                      ),
                    ),
                    Container(
                      height: height * 0.03,
                      child: Center(
                          child: Text(
                        "  또는  ",
                        style: TextStyle(color: real_black_65),
                      )),
                    ),
                    Container(
                      width: width * 0.3,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Divider(
                          color: real_black_65,
                          thickness: 1.0,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: height * 0.05,
                ),
                Container(
                  width: width * 0.8, //314
                  height: height * 0.08, //64
                  child: TextButton(
                    onPressed: () {},
                    child: Image.asset('assets/kakao_login.png'),
                  ),
                ),
                Container(
                  width: width * 0.8, //314
                  height: height * 0.08, //64
                  child: TextButton(
                      onPressed: () {},
                      child: Container(
                        width: width * 0.73,
                        height: height * 0.051,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Color(0xff4285F4),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Align(
                              alignment: Alignment.centerLeft,
                              child: SizedBox(
                                width: width * 0.11,
                                child: Image.asset(
                                  'assets/google_login_2x.png',
                                  fit: BoxFit.fill,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: width * 0.12,
                            ),
                            Text("Sign in with Google",
                                style: TextStyle(
                                  color: Color.fromRGBO(0, 0, 0, 0.54),
                                  fontSize: 14,
                                  fontFamily: "Roboto",
                                )),
                          ],
                        ),
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget InputBox(double width, double height, String hintText) {
    return Container(
      width: width * 0.85,
      height: height * 0.066,
      padding: const EdgeInsets.only(
        left: 15,
        right: 15,
        top: 0,
        bottom: 0,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 1,
          color: real_black,
        ),
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center,
        decoration: InputDecoration(
          border: InputBorder.none,
          hintText: hintText,
          hintStyle: TextStyle(
            color: real_black_19,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  Widget LoginInfoText(double height, double width, String logininfo) {
    return Row(
      children: [
        SizedBox(
          height: height * 0.01,
          width: width * 0.05,
        ),
        SizedBox(
          height: height * 0.03,
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              logininfo,
              style: TextStyle(
                color: real_black,
                fontSize: 15,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
