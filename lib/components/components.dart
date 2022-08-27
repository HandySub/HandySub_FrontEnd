import 'package:flutter/material.dart';
import 'package:handysub/constants/colors.dart';
import 'package:handysub/constants/textstyle.dart';

Widget lightgreenBackgroundText(String text) {
  return Container(
    decoration: BoxDecoration(
      color: light_emerald,
      borderRadius: BorderRadius.all(
        Radius.circular(12.0),
      ),
    ),
    child: Padding(
      padding: EdgeInsets.fromLTRB(17, 11.5, 17, 11.5),
      child: Text(text, style: defaultTextStyle(20.0)),
    ),
  );
}

/// [text] is input text in this Box.
/// [height] and [width] is height, width of this Box.
Widget greenTextBox(String text, double height, double width) {
  return Container(
      height: height,
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: emerald,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(
            text,
            style: defaultTextStyle(18),
          ),
        ),
      ));
}

/// [height] and [width] - context's height and width. It's not box's height/width.
///
/// [text] is input Text.
Widget greenTextFieldBox(String text, double height, double width) {
  return Container(
    height: height * 0.15,
    width: width * 0.7,
    padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
    decoration: BoxDecoration(
      border: Border.all(
        width: 2,
        color: emerald,
      ),
      borderRadius: BorderRadius.circular(10),
      // color: main_color_light
    ),
    child: TextField(
      keyboardType: TextInputType.multiline,
      maxLines: null,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: "메시지를 작성해주세요.",
        hintStyle: TextStyle(
          color: real_black_19,
          fontSize: 14,
        ),
      ),
    ),
  );
}
