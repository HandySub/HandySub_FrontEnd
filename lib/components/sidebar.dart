import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handysub/constants/colors.dart';
import 'package:handysub/constants/textstyle.dart';

class SidebarDrawer extends StatelessWidget {
  const SidebarDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        color: main_color_light,
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: main_color),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 70,
                    child: Image.asset(
                        "assets/user_image/chattingUserM_mainColor.png"),
                  ),
                  SizedBox(width: 30),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "userName",
                        style: defaultBoldTextStyle(15),
                      ),
                      SizedBox(height: 20),
                      Text(
                        "장애여부 : 비장애인",
                        style: defaultTextStyle(14),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            drawerListTile("매칭 리스트", () {}),
            Divider(thickness: 1, height: 1, color: real_black_65),
            drawerListTile("매칭 히스토리", () {}),
            Divider(thickness: 1, height: 1, color: real_black_65),
            drawerListTile("채팅 리스트", () {}),
            Divider(thickness: 1, height: 1, color: real_black_65),
            drawerListTile("마이페이지", () {}),
            Divider(thickness: 1, height: 1, color: real_black_65),
            drawerListTile("문의하기", () {}),
            Divider(thickness: 1, height: 1, color: real_black_65),
            drawerListTile("앱 정보", () {}),
          ],
        ),
      ),
    );
  }

  ListTile drawerListTile(String text, VoidCallback callbackFunc) {
    return ListTile(
      title: CupertinoButton(
        padding: EdgeInsets.zero,
        onPressed: callbackFunc,
        child: Align(
          alignment: Alignment.centerLeft,
          child: Column(
            children: [
              Text(
                text,
                style: defaultBoldTextStyle(15),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
