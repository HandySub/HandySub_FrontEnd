import 'package:flutter/material.dart';
import 'package:handysub/constants/colors.dart';
import 'package:handysub/constants/textstyle.dart';

class SidebarDrawer extends StatelessWidget {
  const SidebarDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(color: main_color),
            child: Text(
              "µµ¿ì¹ÌA",
              style: defaultTextStyle(14),
            ),
          ),
          ListTile(
            title: Text("Menu"),
          ),
        ],
      ),
    );
  }
}
