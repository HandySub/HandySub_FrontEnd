import 'package:flutter/material.dart';
import 'package:handysub/components/appBar.dart';
import 'package:handysub/constants/textstyle.dart';

import '../../constants/colors.dart';

class MyPage extends StatelessWidget {
  final String userNickName = "이용자A";
  final String disability = "장애인";
  final int cookiesCnt = 3;
  final List<String> startStation = <String>["충무로", "성수", "동대문역사문화공원"];

  final List<String> finishStation = <String>["성수", "신당", "서울역"];

  final List<String> matchingDate = <String>[
    "2022.08.10 오후 6:30",
    "2022.08.06 오후 6:30",
    "2022.08.08 오후 6:30",
  ];

  final List<String> chatNickName = <String>["도우미A", "도우미B", "도우미C"];
  List<String> textMessage = <String>["어디계세요?", "저 찾은거 같아요..!", "안녕하세요!"];

  MyPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return MaterialApp(
      theme: ThemeData(
        fontFamily: "GmarketSans",
      ),
      home: Scaffold(
        backgroundColor: real_white,
        appBar: defaultAppBar(context, "마이페이지", real_white),
        body: Container(
          margin: EdgeInsets.fromLTRB(
              width * 0.05, height * 0.03, width * 0.05, height * 0.03),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    width: 80,
                    height: 80,
                    margin: const EdgeInsets.only(right: 10.0),
                    child: Image.asset(
                      'assets/user_image/userM_mainColor.png',
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "$userNickName 님",
                        style: defaultBoldTextStyle(17.0),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "장애여부: $disability",
                        style: defaultTextStyle(15.0),
                      )
                    ],
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  disability=="비장애인"? CookieBox(): SizedBox()
                ],
              ),
              SizedBox(
                height: height * 0.04,
              ),
              ListTextButton("매칭 히스토리 >"),
              MatchingListBuilder(),
              ListTextButton("채팅 리스트 >"),
              ChattingListBuilder()
            ],
          ),
        ),
      ),
    );
  }

  Row CookieBox() {
    return Row(
      children: [
        Container(
            height: 60,
            width: 60,
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Image.asset(
              'assets/cookie_color.png',
            )),
        Text(
          "$cookiesCnt개",
          style: defaultBoldTextStyle(15),
        ),
      ],
    );
  }

  TextButton ListTextButton(String text) {
    return TextButton(
      //Todo : Navigate to MatchingHistory/Chatting List Page
      onPressed: () {},
      child: Text(
        text,
        style: defaultTextStyle(16.0),
      ),
    );
  }

  Widget MatchingListBuilder() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.all(8),
        itemCount: startStation.length,
        itemBuilder: (BuildContext context, int index) {
          return MatchingListItem(context, startStation[index],
              finishStation[index], emerald, matchingDate[index]);
        });
  }

  Widget MatchingListItem(BuildContext context, String station1,
      String station2, Color state, String date) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.fromLTRB(width * 0.03, 9, width * 0.03, 9),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(20)),
        color: real_white,
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: main_color_light,
        ),
        height: 70,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              width: 22,
            ),
            Container(
              height: 22,
              width: 22,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: state,
              ),
              child: Icon(
                Icons.check,
                color: real_white,
                size: 15,
              ),
            ),
            SizedBox(
              width: 10,
              height: 10,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      station1,
                      style: default65BoldTextStyle(15.0),
                    ),
                    Icon(
                      Icons.east,
                      color: real_black_65,
                      size: 15,
                    ),
                    Text(station2, style: default65BoldTextStyle(15.0)),
                  ],
                ),
                Text(
                  date,
                  style: TextStyle(
                    color: real_black_65,
                    fontSize: 13,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget ChattingListBuilder() {
    return ListView.builder(
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.only(
          left: 8,
          right: 8,
          bottom: 8,
        ),
        itemCount: chatNickName.length,
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
              chatNickName[index],
              textMessage[index]);
        });
  }

  Widget ChattingBox(Widget ImageBox, String userNickName, String textMessage) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
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
