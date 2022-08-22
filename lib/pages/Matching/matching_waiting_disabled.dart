import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handysub/components/buttons.dart';
import 'package:handysub/components/components.dart';
import 'package:handysub/components/frame.dart';
import 'package:handysub/constants/colors.dart';
import 'package:handysub/components/appBar.dart';
import 'package:handysub/constants/textstyle.dart';

class MatchingWaitingDisabled extends StatefulWidget {
  const MatchingWaitingDisabled({Key? key}) : super(key: key);

  @override
  State<MatchingWaitingDisabled> createState() =>
      _MatchingWaitingDisabledState();
}

class _MatchingWaitingDisabledState extends State<MatchingWaitingDisabled> {
  String ableUserName = "도우미A";
  bool isChattingArrive = false;
  String messageOfAbled =
      '''깔끔한 흰색 셔츠에 검은 슬랙스 입고, 분홍색 모자를 썼으며 노란 스냅백 들고 있고 파란 운동화 신었습니다. 
      그리고 이제 뒷 내용은 스크롤뷰를 테스트해야 되는데 쓸 말이 생각이 안 나서 
      아무 말이나 대충 쓰는 중이라는 점을 알아 주셨으면 좋겠는 점을 알아 주셨으면 좋을 것 같습니다.''';

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);

    return matchingFrame(
      context,
      EdgeInsets.fromLTRB(
        width * 0.07,
        height * 0.05,
        width * 0.07,
        height * 0.33,
      ),
      "매칭 리스트",
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          userNick_chatIcon(),
          expectArrivalTime(),
          greenTextBox(messageOfAbled, height * 0.15, width * 0.7),
          isMatchingSuccessedButtons(),
        ],
      ),
    );
  }

  Widget userNick_chatIcon() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "$ableUserName님",
            style: defaultBoldTextStyle(25.0),
          ),
          chatIcon()
        ],
      ),
    );
  }

  Widget chatIcon() {
    return isChattingArrive == true
        ? Stack(
            children: [
              IconButton(
                onPressed: () {
                  setState(() {
                    isChattingArrive = !isChattingArrive;
                  });
                },
                icon: Icon(
                  Icons.chat_bubble,
                  color: main_color,
                  size: 35,
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(33, 8, 0, 0),
                child: Container(
                  height: 10,
                  width: 10,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: real_red,
                  ),
                ),
              )
            ],
          )
        // * else (isChattingArrive = false)
        : IconButton(
            onPressed: () {
              setState(() {
                isChattingArrive = !isChattingArrive;
              });
            },
            icon: Icon(
              Icons.chat_bubble_outline_rounded,
              color: main_color,
              size: 35,
            ),
          );
  }

  Widget expectArrivalTime() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Text(
          "예상 도착시간 :",
          style: defaultTextStyle(23.0),
        ),
        lightgreenBackgroundText("오후 6 : 30")
      ],
    );
  }

  Widget isMatchingSuccessedButtons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        greenTextButton("매칭 실패", () {}),
        greenTextButton("매칭 완료", () {}),
      ],
    );
  }
}
