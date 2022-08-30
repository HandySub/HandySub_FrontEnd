import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../components/buttons.dart';
import '../../components/counter.dart';
import '../../constants/colors.dart';

Widget matchingPickPopUp(BuildContext context, Widget child, String station1, String station2, int index){
  final height = MediaQuery.of(context).size.height;
  final width = MediaQuery.of(context).size.width;
  return GestureDetector(
      onTap: (){
        showDialog(
            context: context,
            barrierDismissible: false,
            builder: (BuildContext buildContext){
              return AlertDialog(
                scrollable: true,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0)
                  ),
                  title: Text("이용자B",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),),
                  content: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          stationBox(station1),
                          Icon(
                            Icons.east,
                            color: real_black_65,
                            size: 15,
                          ),
                          stationBox(station2),
                        ],
                      ),
                      SizedBox(height: height*0.05,),
                      Container(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          "예상 소요시간:",
                          style: TextStyle(
                            color: real_black,
                            fontSize: 17,
                          ),
                        ),
                      ),
                      Container(
                          height: height*0.07,
                          child: Counter()),
                      SizedBox(height: height*0.02,),
                      Container(
                        height: height * 0.13,
                        width: width*0.8,
                        padding: const EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
                        decoration: BoxDecoration(
                          border: Border.all(
                            width: 2,
                            color: emerald,
                          ),
                          borderRadius:
                          BorderRadius.circular(10),
                          // color: main_color_light
                        ),
                        child: TextField(
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: "인상착의를 간단히 작성해주세요.",
                              hintStyle: TextStyle(
                                color: real_black_19,
                                fontSize: 14,
                              )
                          ),
                        ),
                      ),

                    ],
                  ),
                  actions: [
                    //Todo : change onPressed func
                    Row(
                      children: [
                        greenTextButtonSmall("매칭 취소", () {Navigator.of(context, rootNavigator: true).pop();}),
                        greenTextButtonSmall("매칭 신청", () {Navigator.of(context, rootNavigator: true).pop();}),
                      ],
                    ),

                  ]
              );
            });
      },
      child: child);
}

Widget stationBox(String station) {
  return Row(
    children: [
      Container(
        height: 22,
        width: 22,
        margin: const EdgeInsets.all(2),
        // TODO : Change Dynamic
        child: Image.asset(
          'assets/metro_line/Seoul_Metro_Line_1.png',
          fit: BoxFit.cover,
          color: const Color.fromRGBO(255, 255, 255, 0.8),
          colorBlendMode: BlendMode.modulate,
        ),
      ),
      Container(
        width: 70,
        margin: const EdgeInsets.all(2),
        child: Text(
          station,
          textAlign: TextAlign.center,
        ),
      ),
    ],
  );
}


