import 'package:flutter/material.dart';

import '../../constants/colors.dart';
import '../../constants/textstyle.dart';

class ChatMessage extends StatelessWidget {
  final String text;
  final int userId;
  const ChatMessage(this.text, this.userId, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return userId==0? myMessage(context, text) : opponentMessage(context, text);
  }
}

Widget myMessage(BuildContext context, String text){
  final width = MediaQuery.of(context).size.width;
  return Row(
    mainAxisAlignment: MainAxisAlignment.end,
    children: [
      Container(
        padding: const EdgeInsets.fromLTRB(20,8, 20, 8),
        margin: const EdgeInsets.fromLTRB(5, 6, 5, 6),
        width: width*0.52,
        decoration: BoxDecoration(
            color: main_color_light,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(15),
              topRight:  Radius.circular(15),
              bottomLeft:  Radius.circular(15),
              bottomRight:  Radius.circular(0),
            )
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: real_black_65,
            ),
          ),
        ),
      ),
    ],
  );
}

Widget opponentMessage(BuildContext context, String text){
  final width = MediaQuery.of(context).size.width;
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      Container(
        padding: const EdgeInsets.fromLTRB(20,8, 20, 8),
        margin: const EdgeInsets.fromLTRB(5, 6, 5, 6),
        width: width*0.52,
        decoration: BoxDecoration(
            color: emerald,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(0),
              topRight:  Radius.circular(15),
              bottomLeft:  Radius.circular(15),
              bottomRight:  Radius.circular(15),
            )
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(
              color: real_white,
            ),
          ),
        ),
      ),
    ],
  );
}


Widget messageDate(String date){
  return Container(
    margin: const EdgeInsets.fromLTRB(5, 6, 5, 6),
    child: Center(
      child: Text(
        date,
        style: defaultLightTextStyle(15),
      ),
    ),
  );
}