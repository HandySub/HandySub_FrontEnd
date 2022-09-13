import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handysub/Models/UserModel.dart';
import 'package:handysub/Providers/UserProvider.dart';
import 'package:handysub/VIewModels/signUpViewModel.dart';
import 'package:handysub/components/buttons.dart';
import 'package:handysub/components/sidebar.dart';
import 'package:handysub/constants/colors.dart';
import 'package:provider/provider.dart';
import '../../components/appBar.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

final GlobalKey<ScaffoldState> signupPageKey_ = GlobalKey();

class _SignupPageState extends State<SignupPage> {
  final formKey = GlobalKey<FormState>();
  String userEmail = "abc@naver.com";
  String userPwd = "awe";
  String userPwd2 = "af";
  String userNickname = "asdf";
  String userDisabledInfo = "asdf";

  /* Todo : connect parameters to toggle buttons
          ->  show SignupInfoText & Container
              only when 장애인 is selected */
  bool handicapped = true;
  bool sex = true;

  late UserProvider _userProvider;
  late SignUpViewModel _signUpViewModel;

  toggleButton toggleButtonSex = toggleButton(text1: "남성", text2: "여성");
  toggleButton toggleButtonDisabled = toggleButton(text1: "장애인", text2: "비장애인");

  Function(String?)? emailValidator() {
    return (value) {
      if (value!.isEmpty || !value.contains("@")) {
        return "유효한 이메일을 입력해주세요.";
      }
      return null;
    };
  }

  Function(String?)? pwdValidator() {
    return (value) {
      if (value!.length < 8) {
        return "비밀번호는 8자 이상 입력해주세요.";
      }
      if (value.isEmpty) {
        return "비밀번호를 입력해주세요.";
      }
      return null;
    };
  }

  Function(String?)? pwd2Validator() {
    return (value) {
      if (value != userPwd) {
        return "입력한 비밀번호와 다릅니다.";
      }
      if (value!.isEmpty) {
        return "비밀번호를 한 번 더 입력해주세요.";
      }
      return null;
    };
  }

  Function(String?)? nickNameValidator() {
    return (value) {
      if (value!.isEmpty) {
        return "닉네임을 입력해주세요.";
      }
      return null;
    };
  }

  @override
  Widget build(BuildContext context) {
    _userProvider = Provider.of<UserProvider>(context, listen: false);
    _signUpViewModel = SignUpViewModel();

    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'GmarketSans',
      ),
      home: Scaffold(
        key: signupPageKey_,
        endDrawer: SidebarDrawer(),
        backgroundColor: real_white,
        appBar: defaultAppBar(context, "회원가입", real_white, signupPageKey_),
        body: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Container(
              color: real_white,
              padding: const EdgeInsets.fromLTRB(22.0, 15.0, 22.0, 15.0),
              child: Column(
                children: [
                  SignupInfoText(height, width, "이메일"),
                  Stack(
                    children: [
                      SignupInfoContainer(width, height, false,
                          emailValidator(), userEmail, "jw101902@naver.com"),
                      Positioned(
                        top: height * 0.012,
                        right: width * 0.019,
                        child: SizedBox(
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
                  SignupInfoText(height, width, "비밀번호"),
                  SignupInfoContainer(width, height, true, pwdValidator(),
                      userPwd, "passwordExample123@!"),
                  SizedBox(
                    height: height * 0.01, //10
                  ),
                  SignupInfoText(height, width, "비밀번호 확인"),
                  SignupInfoContainer(width, height, true, pwd2Validator(),
                      userPwd2, "passwordExample123@!"),
                  SizedBox(
                    height: height * 0.01, //10
                  ),
                  SignupInfoText(height, width, "닉네임"),
                  Stack(
                    children: [
                      SignupInfoContainer(width, height, false,
                          nickNameValidator(), userNickname, "닉네임을 입력하세요"),
                      Positioned(
                        top: height * 0.012,
                        right: width * 0.019,
                        child: SizedBox(
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
                      smallSignupInfoText(height, "성별"),
                      SizedBox(
                        height: height * 0.01,
                        width: width * 0.35,
                      ),
                      smallSignupInfoText(height, "장애여부"),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      sex_button(width, height),
                      handicapped_button(width, height),
                    ],
                  ),
                  SizedBox(
                    height: height * 0.01, //10
                  ),
                  /* Todo : show SignupInfoText & Container
                           only when 장애인 is selected */
                  SignupInfoText(height, width, "도움이 필요한 부분"),
                  Container(
                    width: width * 0.85,
                    height: height * 0.15,
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
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
                        userDisabledInfo = value!;
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
                          // Navigator.of(context).pop();
                        }
                        // ! SignUp Logic
                        print(userEmail);
                        signUp();
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
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  signUp() {
    User user = User(
      userEmail,
      userPwd,
      userNickname,
      sex,
      handicapped,
      userDisabledInfo,
      3.0,
    );
    print(user.email);
    print(userEmail);
    // context.read<UserProvider>().setUserData(user);
    // print(Provider.of<UserProvider>(context).getUserEmail());
    // _userProvider.setUserData(user);
    _signUpViewModel.signUp(user);
  }

  Widget sex_button(double width, double height) {
    return CupertinoButton(
      onPressed: () {
        setState(() {
          sex = !sex;
        });
      },
      child: Container(
        width: width * 0.3,
        height: height * 0.066,
        decoration: BoxDecoration(
            // TODO : Change Color to lightGreen
            color: sex
                ? Colors.blue.withOpacity(0.6)
                : Colors.pink.withOpacity(0.6),
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              sex ? "남성" : "여성",
              style: TextStyle(
                  fontFamily: 'GmarketSans', fontSize: 14, color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  Widget handicapped_button(double width, double height) {
    return CupertinoButton(
      onPressed: () {
        setState(() {
          handicapped = !handicapped;
        });
      },
      child: Container(
        width: width * 0.3,
        height: height * 0.066,
        decoration: BoxDecoration(
            // TODO : Change Color to lightGreen
            color: handicapped ? main_color : Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20))),
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
            child: Text(
              handicapped ? "장애인" : "비장애인",
              style: TextStyle(
                fontFamily: 'GmarketSans',
                fontSize: 14,
                color: handicapped ? Colors.white : main_color,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Stack toggleButtonContainer(
      double width, double height, toggleButton toggleButton) {
    return Stack(
      children: [
        Container(
          width: width * 0.4,
          height: height * 0.066,
          //50
          padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(
              width: 1,
              color: real_black,
            ),
          ),
          child: toggleButton,
        ),
      ],
    );
  }

  Widget smallSignupInfoText(double height, String infoText) {
    return SizedBox(
      height: height * 0.03,
      child: Align(
        alignment: Alignment.centerLeft,
        child: Text(
          infoText,
          style: TextStyle(
            color: real_black,
            fontSize: 15,
          ),
        ),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget SignupInfoContainer(double width, double height, bool isobscureText,
      Function(String?)? validator, String savedAt, String hintText) {
    return Container(
      width: width * 0.85,
      height: height * 0.066,
      padding: const EdgeInsets.fromLTRB(15.0, 0, 15.0, 0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        border: Border.all(
          width: 1,
          color: real_black,
        ),
      ),
      child: TextField(
        // obscureText: isobscureText,
        // textAlignVertical: TextAlignVertical.center,
        // validator: (value) {
        //   validator;
        // },
        onChanged: (value) {
          setState(() {
            savedAt = value;
          });
          print(savedAt);
        },
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hintText,
            hintStyle: TextStyle(
              color: real_black_19,
              fontSize: 15,
            )),
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget SignupInfoText(double height, double width, String infoText) {
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
              infoText,
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
