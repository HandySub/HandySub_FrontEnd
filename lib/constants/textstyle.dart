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

TextStyle defaultLightTextStyle(double size_) {
  return TextStyle(
      color: real_black,
      fontFamily: 'GmarketSans',
      fontWeight: FontWeight.w300,
      fontSize: size_);
}

TextStyle default65BoldTextStyle(double size_) {
  return TextStyle(
      color: real_black_65,
      fontFamily: 'GmarketSans',
      fontWeight: FontWeight.bold,
      fontSize: size_);
}