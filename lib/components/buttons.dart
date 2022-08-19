import 'package:flutter/material.dart';
import 'package:handysub/constants/colors.dart';

Widget greenTextButton_4(String text) {
  return Container(
    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
    height: 50,
    width: 130,
    decoration: BoxDecoration(
      border: Border.all(
        width: 2,
        color: emerald,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(12.0),
      ),
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: emerald,
        ),
      ),
    ),
  );
}

Widget greenTextButton(String text) {
  return Container(
    decoration: BoxDecoration(
      border: Border.all(
        width: 2,
        color: emerald,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(12.0),
      ),
    ),
    child: Padding(
      padding: EdgeInsets.fromLTRB(17, 11.5, 17, 11.5),
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: emerald,
        ),
      ),
    ),
  );
}

Widget greenDropDownButton(DropdownButton dropdownbutton) {
  return Container(
    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
    height: 45,
    width: 120,
    decoration: BoxDecoration(
      border: Border.all(
        width: 2,
        color: emerald,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(12.0),
      ),
    ),
    child: Container(
        padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0), child: dropdownbutton),
  );
}
