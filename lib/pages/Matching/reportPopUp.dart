import 'package:flutter/material.dart';
import 'package:handysub/constants/textstyle.dart';

import '../../components/buttons.dart';
import '../../constants/colors.dart';

Widget reportPopUp(BuildContext context) {
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return Container(
    width: width *0.48,
    height: height *0.055,
    child: IconButton(
      icon: Icon(
        Icons.warning,
        color: main_color,),
      onPressed: (){
        showDialog(
            context: context,
            builder: (BuildContext ctx){
              return AlertDialog(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0)
                ),
                title: Text("신고하기",
                  style: defaultBoldTextStyle(20),),
                content: Container(
                  height: height*0.2,
                  width: width*0.5,
                  padding: const EdgeInsets.fromLTRB(15, 5, 15, 5),
                  decoration:BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      width: 2,
                      color: emerald,
                    ),
                  ),
                  child: TextField(
                    keyboardType: TextInputType.multiline,
                    maxLines: null,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "신고 사유를 작성해주세요.",
                      hintStyle: TextStyle(
                        fontSize: 14,
                      )
                    ),
                  ),
                ),
                actions: [
                  greenTextButton("신고취소", (){Navigator.of(context, rootNavigator: true).pop();}),
                  greenTextButton("신고하기", (){Navigator.of(context, rootNavigator: true).pop();}),

               ],
              );
            }
        );
      },
    ),
    );
      }