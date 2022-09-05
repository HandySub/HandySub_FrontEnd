import 'package:flutter/material.dart';
import 'package:handysub/components/appBar.dart';
import 'package:handysub/constants/colors.dart';
import 'package:handysub/constants/textstyle.dart';

class ChattingList extends StatefulWidget {
  const ChattingList({Key? key}) : super(key: key);

  @override
  State<ChattingList> createState() => _ChattingListState();
}

class _ChattingListState extends State<ChattingList> {
  List<String> userNickName = <String>[
    "도우미A",
    "도우미B",
    "도우미C",
    "도우미D",
    "도우미E",
    "도우미F",
    "도우미G",
    "도우미H",
    "도우미I",
    "도우미J",
    "도우미K"
  ];
  List<String> textMessage = <String>[
    "어디계세요?",
    "저 찾은거 같아요..!",
    "안녕하세요!",
    "반갑습니다...",
    "저 역 앞에 있어용!!",
    "어디계세요...?",
    "저 찾은거 같아요..!",
    "안녕하세요!",
    "반갑습니다...",
    "저 역 앞에 있어용!!",
    "안녕"
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
        backgroundColor: real_white,
        appBar: defaultAppBar(context, "채팅 리스트", real_white),
        body: Column(
          children: [
            SizedBox(
              height: height * 0.025,
            ),
            Expanded(child: ChattingListBuilder()),
          ],
        ),
      ),
    );
  }

  Widget ChattingListBuilder() {
    return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          bottom: 8,
        ),
        itemCount: userNickName.length,
        itemBuilder: (BuildContext context, int index) {
          return ChattingBox(
              index % 2 == 0
                  ? Image.asset(
                      'assets/user_image/chattingUserM_mainColor.png',
                      height: 53,
                      width: 53,
                    )
                  : Image.asset(
                      'assets/user_image/chattingUserM_emerald.png',
                      height: 53,
                      width: 53,
                    ),
              userNickName[index],
              textMessage[index]);
        });
  }

  Widget ChattingBox(Widget ImageBox, String userNickName, String textMessage) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
      child: Row(
        children: [
          ImageBox,
          SizedBox(
            width: 10,
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                userNickName,
                style: TextStyle(
                  color: real_black_65,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                textMessage,
                style: TextStyle(
                  color: real_black_65,
                  fontSize: 14,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
