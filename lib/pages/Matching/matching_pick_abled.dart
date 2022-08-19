import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handysub/constants/colors.dart';
import 'package:handysub/components/appBar.dart';

class MatchingPickAbled extends StatefulWidget {
  const MatchingPickAbled({Key? key}) : super(key: key);

  @override
  State<MatchingPickAbled> createState() => _MatchingPickAbledState();
}

class _MatchingPickAbledState extends State<MatchingPickAbled> {
  // TODO : DropDownList 하드 코딩 제거
  String? dropDownValue1;
  String? dropDownValue2;
  final dropDownList = [
    '1호선',
    '2호선',
    '3호선',
    '4호선',
    '5호선',
    '6호선',
    '7호선',
    '8호선',
    '9호선',
  ];

  List<String> startStation = <String>[
    "충무로",
    "동대문역사문화공원",
    "테스트정류장1",
    "123",
    "123",
    "123",
    "123",
    "123",
    "123",
    "123",
    "123",
    "123",
    "33",
    "ghi",
    "hifd",
    "dfasdf"
  ];
  List<String> finishStation = <String>["이수역", "강남역", "종로3가"];

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    // TODO : remove code under
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: SystemUiOverlay.values);
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'GmarketSans',
      ),
      home: Container(
        color: main_color,
        child: SafeArea(
          child: Scaffold(
            backgroundColor: real_white,
            // * AppBar
            appBar: defaultAppBar(context, "매칭 선택", real_white),
            // * Body of MaterialApp
            body: Column(
              children: [
                // Just for Alignment
                SizedBox(
                  height: height * 0.025,
                  width: width,
                ),
                // * Select DropDownButton Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    // * Select Container 1
                    Container(
                      height: 30,
                      width: 125,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: emerald,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
                        child: DropdownButton(
                          underline: SizedBox(),
                          hint: Center(
                            child: Text(
                              "출발 호선",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          isExpanded: true,
                          value: dropDownValue1,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: dropDownList.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Center(
                                child: Text(
                                  items,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownValue1 = newValue ?? "";
                            });
                          },
                        ),
                      ),
                    ),
                    // * Select Container 2
                    Container(
                      height: 30,
                      width: 125,
                      decoration: BoxDecoration(
                        border: Border.all(
                          width: 2,
                          color: emerald,
                        ),
                        borderRadius: BorderRadius.all(
                          Radius.circular(12.0),
                        ),
                      ),
                      child: Container(
                        padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0),
                        child: DropdownButton(
                          underline: SizedBox(),
                          hint: Center(
                            child: Text(
                              "도착 호선",
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                              ),
                            ),
                          ),
                          isExpanded: true,
                          value: dropDownValue2,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          items: dropDownList.map((String items) {
                            return DropdownMenuItem(
                              value: items,
                              child: Center(
                                child: Text(
                                  items,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                  ),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              dropDownValue2 = newValue ?? "";
                            });
                          },
                        ),
                      ),
                    ),
                  ],
                ),
                // * ListView
                Expanded(child: applyListBuilder())
              ],
            ),
          ),
        ),
      ),
    );
  }

  // TODO : change Dynamical
  Widget applyListBuilder() {
    return ListView.builder(
        shrinkWrap: true,
        padding: const EdgeInsets.all(8),
        itemCount: startStation.length,
        itemBuilder: (BuildContext context, int index) {
          return applyListItem(startStation[index], startStation[index]);
        });
  }

  Widget applyListItem(String station1, String station2) {
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
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
      ),
    );
  }

  Widget stationBox(String station) {
    return Row(
      children: [
        SizedBox(
          height: 22,
          width: 22,
          // TODO : Change Dynamic
          child: Image.asset(
            'assets/metro_line/Seoul_Metro_Line_1.png',
            fit: BoxFit.cover,
            color: const Color.fromRGBO(255, 255, 255, 0.8),
            colorBlendMode: BlendMode.modulate,
          ),
        ),
        SizedBox(
          width: 10,
        ),
        SizedBox(
          width: 70,
          child: Text(
            station,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
