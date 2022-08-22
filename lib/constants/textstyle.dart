import 'package:flutter/material.dart';
import 'package:handysub/constants/colors.dart';

TextStyle defaultTextStyle(double size_) {
  return TextStyle(
      color: real_black,
      fontFamily: 'GmarketSans',
      fontWeight: FontWeight.normal,
      fontSize: size_);
}

TextStyle defaultBoldTextStyle(double size_) {
  return TextStyle(
    color: real_black,
    fontFamily: 'GmarketSans',
    fontWeight: FontWeight.bold,
    fontSize: size_,
  );
}
