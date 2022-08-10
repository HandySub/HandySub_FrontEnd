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
      theme: ThemeData(
        fontFamily: 'GmarketSans',
      ),
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
        body: SingleChildScrollView(
          child: Container(
            width: 360,
            height: 640,
            color: real_white,
            padding: const EdgeInsets.only(
              left: 22,
              right: 22,
              top: 15,
              bottom: 15,
            ),
            child: Column(
              children: [
                SizedBox(
                  height: 24,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      "이메일",
                      style: TextStyle(
                        color: real_black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: 314,
                  height: 50,
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 0,
                    bottom: 0,
                  ),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: "jw101902@naver.com",
                      hintStyle: TextStyle(
                        color: real_black_19,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 1,
                      color: real_black,
                    ),
                  ),
                ),
                SizedBox(height: 10,),
                SizedBox(
                  height: 24,
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("비밀번호",
                      style: TextStyle(
                        color: real_black,
                        fontSize: 15,
                      ),),
                  ),
                ),
                Container(
                  width: 314,
                  height: 50,
                  padding: const EdgeInsets.only(
                    left: 15,
                    right: 15,
                    top: 0,
                    bottom: 0,
                  ),
                  child: TextField(
                    obscureText: true,
                    decoration: InputDecoration(
                      hintText: "passwordExample123@!",
                      hintStyle: TextStyle(
                        color: real_black_19,
                        fontSize: 15,
                      ),
                    ),
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      width: 1,
                      color: real_black,
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
                    color: emerald,
                  ),
                  child: Center(
                    child: Text(
                      "로그인",
                      textDirection: TextDirection.ltr,
                      style: TextStyle(
                        color: real_white,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 70,
                      height: 30,
                      child: TextButton(
                        onPressed: () {},
                        child: Text("회원가입",
                        style: TextStyle(color: real_black_65), ),
                      ),
                    ),
                    Container(
                      width: 5,
                      height: 30,
                      child: Center(child: Text("|",
                        style: TextStyle(color: real_black_65),)),
                    ),
                    Container(
                      width: 90,
                      height: 30,
                      child: TextButton(
                        onPressed: () {},
                        child: Text("아이디 찾기",
                          style: TextStyle(color: real_black_65),),
                      ),
                    ),
                    Container(
                      width: 5,
                      height: 30,
                      child: Center(child: Text("|",
                        style: TextStyle(color: real_black_65),)),
                    ),
                    Container(
                      width: 110,
                      height: 30,
                      child: TextButton(
                        onPressed: () {},
                        child: Text("비밀번호 찾기",
                          style: TextStyle(color: real_black_65),),
                      ),
                    ),
                  ],



                ),
                SizedBox(height: 40,),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 125,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Divider(color: real_black_65, thickness: 1.0,),
                      ),
                    ),
                    Container(
                      height: 30,
                      child: Center(child: Text(" 또는 ",
                      style: TextStyle(color: real_black_65),)),
                    ),
                    Container(
                      width: 125,
                      child: Align(
                        alignment: Alignment.topCenter,
                        child: Divider(color: real_black_65, thickness: 1.0,),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 40,),
                Container(
                  width: 314,
                  height: 64,
                  child: TextButton(onPressed: () {  },
                  child: Image.asset('assets/kakao_login.png'),),
                ),
                Container(
                  width: 314,
                  height: 64,
                  child: TextButton(onPressed: () {  },
                    child: Container(
                      width: 295,
                      height: 45,
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
                              width: 45,
                              height: 45,
                              child: Image.asset('assets/google_login_2x.png', fit: BoxFit.fill,),
                            ),
                          ),
                          SizedBox(width: 50,),
                          Text("Sign in with Google",
                          style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.54), fontSize: 14, fontFamily: "Roboto", )),
                        ],
                      ),
                    )
                ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
