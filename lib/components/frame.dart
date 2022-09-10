import 'package:flutter/material.dart';
import 'package:handysub/components/appBar.dart';
import 'package:handysub/components/sidebar.dart';
import 'package:handysub/constants/colors.dart';

Widget matchingFrame(
  BuildContext context,
  EdgeInsetsGeometry margin_,
  String title_,
  Widget child_,
  GlobalKey<ScaffoldState> drawerKey_,
) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;

  return Container(
    color: main_color,
    child: SafeArea(
      child: Scaffold(
        endDrawer: SidebarDrawer(),
        appBar: defaultAppBar(context, title_, lightgray, drawerKey_),
        body: Container(
          color: lightgray,
          child: Center(
            child: SizedBox(
              height: height,
              width: width,
              child: Container(
                margin: margin_,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: real_white,
                ),
                child: child_,
              ),
            ),
          ),
        ),
      ),
    ),
  );
}
