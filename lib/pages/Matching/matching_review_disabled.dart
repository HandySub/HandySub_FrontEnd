import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handysub/components/buttons.dart';
import 'package:handysub/components/components.dart';
import 'package:handysub/components/frame.dart';
import 'package:handysub/constants/colors.dart';
import 'package:handysub/constants/textstyle.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class MatchingReviewPage extends StatefulWidget {
  const MatchingReviewPage({Key? key}) : super(key: key);

  @override
  State<MatchingReviewPage> createState() => _MatchingReviewPageState();
}

class _MatchingReviewPageState extends State<MatchingReviewPage> {
  String ableUserNick = "도우미A";
  int ratingCookies = 3;

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
        height * 0.2,
      ),
      "매칭 리스트",
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          userNick_reportIcon(),
          ratingCookie(),
          thanksMessage(),
          greenTextButton("리뷰 남기기", () {}),
        ],
      ),
    );
  }

  Widget userNick_reportIcon() {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Text(
              "$ableUserNick님",
              style: defaultBoldTextStyle(25.0),
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.warning_amber_rounded,
              color: Colors.black,
              size: 40,
            ),
          )
        ],
      ),
    );
  }

  Widget ratingCookie() {
    final width = MediaQuery.of(context).size.width;

    return SizedBox(
      width: width * 0.7,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "리뷰",
              style: defaultTextStyle(20),
            ),
          ),
          SizedBox(height: 10),
          ratingBox(),
        ],
      ),
    );
  }

  Widget ratingBox() {
    return RatingBar(
      initialRating: 3,
      direction: Axis.horizontal,
      allowHalfRating: false,
      itemCount: 5,
      ratingWidget: RatingWidget(
        full: Image.asset(
          'assets/cookie_color.png',
          height: 20,
          width: 20,
        ),
        half: Container(),
        empty: Image.asset(
          'assets/cookie_line.png',
          height: 20,
          width: 20,
        ),
      ),
      itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
      onRatingUpdate: (rating) {
        ratingCookies = rating.toInt();
      },
    );
  }

  Widget thanksMessage() {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return SizedBox(
      width: width * 0.7,
      child: Column(
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "감사메시지 전하기",
              style: defaultTextStyle(20),
            ),
          ),
          SizedBox(height: 10),
          greenTextFieldBox("하이", height, width),
        ],
      ),
    );
  }
}
