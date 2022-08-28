import 'package:flutter/material.dart';
import 'package:handysub/components/appBar.dart';
import 'package:handysub/constants/colors.dart';
import 'package:handysub/constants/textstyle.dart';

class ChattingPage extends StatefulWidget {
  const ChattingPage({Key? key}) : super(key: key);

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {

  List<String> messageList = <String>[
    "안녕하세요",
    "안녕하세요 상대방입니다.",
    "예시 메세지 길게 쓰는중",
    "상대방 예시 메세지 길게 쓰는중",
    "예시 메세지 아주 길게 길게 쓰는중 어떤 말을 더 써야 할까....",
    "상대방 예시 메세지 아주 길게 길게 쓰는중 어떤 말을 더 써야 할까....",
  ];


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'GmarketSans',
      ),
      home: Scaffold(
        appBar: defaultAppBar(context, "채팅", real_white),
        body: Container(
          margin: EdgeInsets.fromLTRB(width * 0.05, height * 0.03,
              width * 0.05, height * 0.33),
          child: Column(
            children: [
              Expanded(child: chattingBuilder())
            ],
          ),
        ),
      ),
    );
  }
  Widget chattingBuilder(){
    return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: messageList.length,
        itemBuilder: (BuildContext context, int index){
          //Todo : Change condition to userId
          return index%2==0? myMessage(context, messageList[index]):  opponentMessage(context, messageList[index]);
        });
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