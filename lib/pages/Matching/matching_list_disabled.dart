import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handysub/components/appBar.dart';

import '../../constants/colors.dart';

enum MatchingStateList { gray, green, orange }

class MatchingListDisabled extends StatefulWidget {
  const MatchingListDisabled({Key? key}) : super(key: key);

  @override
  State<MatchingListDisabled> createState() => _MatchingListDisabledState();
}


class _MatchingListDisabledState extends State<MatchingListDisabled> {
  List<String> startStation = <String>["충무로", "충무로", "충무로", "성수", "동대문역사문화공원"];

  List<String> finishStation = <String>["성수", "신당", "성수", "충무로", "서울역"];

  List<String> matchingDate = <String>[
    "2022.08.10 오후 6:30",
    "2022.08.06 오후 6:30",
    "2022.08.08 오후 6:30",
    "2022.08.08 오후 7:30",
    "2022.08.09 오후 12:30",
  ];

  List<Color> matchingState = <Color>[
    gray,
    green,
    green,
    green,
    orange,
  ];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'GmarketSans',
      ),
      home: Scaffold(
        backgroundColor: real_white,
        appBar: defaultAppBar(context, "매칭 리스트", real_white),
        body: Column(
          children: [
            SizedBox(
              height: height * 0.025,
            ),
            Expanded(child: MatchingListBuilder()),
          ],
        ),
      ),
    );
  }

  Widget MatchingListBuilder() {
    return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: startStation.length,
        itemBuilder: (BuildContext context, int index) {
          return MatchingListItem(startStation[index], finishStation[index],
              matchingState[index], matchingDate[index]);
        });
  }

  Widget MatchingListItem(
      String station1, String station2, Color state, String date) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.fromLTRB(width * 0.1, 9, width * 0.1, 9),
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
                    children:[
                      Text(
                        station1,
                        // textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 15,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                      Icon(
                        Icons.east,
                        color: real_black_65,
                        size: 15,
                      ),
                      Text(
                        station2,
                        // textAlign: TextAlign.start,
                        style: TextStyle(
                          fontSize: 15,
                          // fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      color: real_black_65,
                      fontSize: 13,
                    ),
                  )
                ],
              ),
              ],
            ),
      ),
    );
  }

}
