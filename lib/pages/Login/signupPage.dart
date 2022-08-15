import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handysub/constants/colors.dart';

import '../../components/appBar.dart';

class togglebutton extends StatefulWidget {
  final String text1;
  final String text2;

  const togglebutton({Key? key, required this.text1, required this.text2})
      : super(key: key);

  @override
  State<togglebutton> createState() => _togglebuttonState();
}

class _togglebuttonState extends State<togglebutton> {
  String result = '';
  bool istext1 = false;
  bool istext2 = false;

  late List<bool> isSelected;

  void initState() {
    isSelected = [istext1, istext2];
    super.initState();
  }

  void toggleSelect(value) {
    if (value == 0) {
      istext1 = true;
      istext2 = false;
    } else {
      istext1 = false;
      istext2 = true;
    }
    setState(() {
      isSelected = [istext1, istext2];
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      // final width = constraints.maxWidth;
      // final height = constraints.maxHeight;
      return Row(
        children: [
          ToggleButtons(
            children: <Widget>[
              Text(widget.text1),
              Text(widget.text2),
            ],
            isSelected: isSelected,
            onPressed: toggleSelect,
            // renderBorder: false,
            color: main_color,
            fillColor: main_color,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderColor: main_color,
            selectedColor: real_white,
            constraints: BoxConstraints.expand(
                width: constraints.maxWidth / 2 - 3,
                height: constraints.maxHeight / 2 + 10),
          )
        ],
      );
    });
  }
}

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();
  String userEmail = "";
  String userPwd = "";
  String userPwd2 = "";
  String userNickname = "";

  //Todo : connect parameters to toggle buttons
  bool isHandicapped = false;
  bool isNonHandicapped = false;
  bool isMale = false;
  bool isFemale = false;
  String handicappedInfo = "";

  String reportText = "";

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'GmarketSans',
      ),
      home: Scaffold(
        backgroundColor: real_white,
        appBar: defaultAppBar(context, "회원가입"),
          // systemOverlayStyle: SystemUiOverlayStyle.dark,

        body: Form(
          key: formKey,
          child: SingleChildScrollView(
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
                  Row(
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
                            "이메일",
                            style: TextStyle(
                              color: real_black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        width: width * 0.85,
                        //314
                        height: height * 0.066,
                        //50
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          top: 0,
                          bottom: 0,
                        ),
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          validator: (value) {
                            if (value!.isEmpty || !value.contains('@')) {
                              return "유효한 이메일을 입력해주세요.";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            userEmail = value!;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
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
                      Positioned(
                        top: height * 0.009,
                        right: width * 0.019,
                        child: Container(
                          width: width * 0.24,
                          height: height * 0.041,
                          child: ElevatedButton(
                            style: TextButton.styleFrom(
                              backgroundColor: main_color,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                            ),
                            onPressed: () {
                              //Todo : Make 중복확인 func
                            },
                            child: Text(
                              "중복확인",
                              style: TextStyle(
                                color: real_white,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01, //10
                  ),
                  Row(
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
                            "비밀번호",
                            style: TextStyle(
                              color: real_black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: width * 0.85,
                    //314
                    height: height * 0.066,
                    //50
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
                    child: TextFormField(
                      obscureText: true,
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "passwordExample123@!",
                        hintStyle: TextStyle(
                          color: real_black_19,
                          fontSize: 15,
                        ),
                      ),
                      validator: (value) {
                        if (value!.length < 8) {
                          return "비밀번호는 8자 이상 입력해주세요.";
                        }
                        if (value.isEmpty) {
                          return "비밀번호를 입력해주세요.";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        userPwd = value!;
                      },
                    ),
                  ),
                  SizedBox(
                    height: height * 0.01, //10
                  ),
                  Row(
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
                            "비밀번호 확인",
                            style: TextStyle(
                              color: real_black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: width * 0.85,
                    //314
                    height: height * 0.066,
                    //50
                    padding: const EdgeInsets.only(
                      left: 15,
                      right: 15,
                      top: 0,
                      bottom: 0,
                    ),
                    child: TextFormField(
                      obscureText: true,
                      textAlignVertical: TextAlignVertical.center,
                      validator: (value) {
                        if (value != userPwd) {
                          return "입력한 비밀번호와 다릅니다.";
                        }
                        if (value!.isEmpty) {
                          return "비밀번호를 한 번 더 입력해주세요.";
                        }
                        return null;
                      },
                      onSaved: (value) {
                        userPwd2 = value!;
                      },
                      decoration: InputDecoration(
                        border: InputBorder.none,
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
                    height: height * 0.01, //10
                  ),
                  Row(
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
                            "닉네임",
                            style: TextStyle(
                              color: real_black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        width: width * 0.85,
                        //314
                        height: height * 0.066,
                        //50
                        padding: const EdgeInsets.only(
                          left: 15,
                          right: 15,
                          top: 0,
                          bottom: 0,
                        ),
                        child: TextFormField(
                          textAlignVertical: TextAlignVertical.center,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return "닉네임을 입력해주세요.";
                            }
                            return null;
                          },
                          onSaved: (value) {
                            userNickname = value!;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "닉네임 예시",
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
                      Positioned(
                        top: height * 0.009,
                        right: width * 0.019,
                        child: Container(
                          width: width * 0.24,
                          height: height * 0.041,
                          child: ElevatedButton(
                            style: TextButton.styleFrom(
                              backgroundColor: main_color,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18)),
                            ),
                            onPressed: () {
                              //Todo : Make 중복확인 func
                            },
                            child: Text(
                              "중복확인",
                              style: TextStyle(
                                color: real_white,
                                fontSize: 13,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01, //10
                  ),
                  Row(
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
                            "성별",
                            style: TextStyle(
                              color: real_black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: height * 0.01,
                        width: width * 0.35,
                      ),
                      SizedBox(
                        height: height * 0.03,
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            "장애여부",
                            style: TextStyle(
                              color: real_black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          Container(
                            width: width * 0.4,
                            height: height * 0.066,
                            //50
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
                            child: togglebutton(
                              text1: "남성",
                              text2: "여성",
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            width: width * 0.4,
                            height: height * 0.066,
                            //50
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
                            child: togglebutton(
                              text1: "장애인",
                              text2: "비장애인",
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01, //10
                  ),
                  //장애인이면 입력하는 박스 나오게
                  //Todo : show Row & Container only when 장애인 is selected
                  Row(
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
                            "도움이 필요한 부분",
                            style: TextStyle(
                              color: real_black,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    width: width * 0.85,
                    //314
                    height: height * 0.15,
                    //50
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
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "휠체어를 타고 있어요",
                        hintStyle: TextStyle(
                          color: real_black_19,
                          fontSize: 15,
                        ),
                      ),
                      //Todo : make validator
                      onSaved: (value) {
                        handicappedInfo = value!;
                      },
                    ),
                  ),

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
                      onPressed: () {
                        if (formKey.currentState!.validate() == false) {
                          return;
                        } else {
                          formKey.currentState!.save();
                          Navigator.of(context).pop(); // 회원가입 후 이전화면으로 돌아가기
                        }
                      },
                      child: Text(
                        "회원가입",
                        style: TextStyle(
                          color: real_white,
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                  ),

                  // TODO : For ReportPopup Test
                  // TODO : remove & make Navigate to popup page
                  SizedBox(
                    height: 100,
                  ),
                  Container(
                      width: width * 0.48, //205
                      height: height * 0.055, //45
                      child: ElevatedButton(
                          child: Text("신고하기"),
                          style: TextButton.styleFrom(
                            backgroundColor: emerald,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(25)),
                          ),
                          onPressed: () {
                            showDialog(
                                context: context,
                                barrierDismissible: false,
                                builder: (BuildContext ctx) {
                                  return AlertDialog(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(8.0)),
                                    title: Text("신고하기"),
                                    content: Container(
                                      height: height * 0.2,
                                      width: width * 0.5,
                                      padding: const EdgeInsets.only(
                                        left: 15,
                                        right: 15,
                                        top: 5,
                                        bottom: 5,
                                      ),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: main_color_light),
                                      child: TextField(
                                        keyboardType: TextInputType.multiline,
                                        maxLines: null,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "신고할 내용을 입력해주세요.",
                                            hintStyle: TextStyle(
                                              fontSize: 13,
                                            )),
                                      ),
                                    ),
                                    actions: [
                                      //Todo : change onPressed func
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("신고취소")),
                                      TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text("신고하기")),
                                    ],
                                  );
                                });
                          })),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
