import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handysub/components/buttons.dart';
import 'package:handysub/constants/colors.dart';
import 'package:handysub/components/appBar.dart';

class MatchingApplyPage_Disabled extends StatefulWidget {
  const MatchingApplyPage_Disabled({Key? key}) : super(key: key);

  @override
  State<MatchingApplyPage_Disabled> createState() =>
      _MatchingApplyPage_DisabledState();
}

class _MatchingApplyPage_DisabledState
    extends State<MatchingApplyPage_Disabled> {
  // TODO : Fix Hard Coding
  String? linePick_dropDownValue1 = "1호선";
  String? linePick_dropDownValue2 = "1호선";
  String? stationPick_dropDownValue1 = "인천";
  String? stationPick_dropDownValue2 = "동대문역사문화공원";
  final line_dropDownList = [
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
  final station_dropDownList = [
    "인천",
    "동대문역사문화공원",
    "충무로",
    "신촌",
    "종로3가",
    "을지로4가",
    "강남(어쩌구저쩌구광고광고)",
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
      home: Container(
        color: main_color,
        child: SafeArea(
          child: Scaffold(
            appBar:
                defaultAppBar(context, "매칭 리스트", real_black.withOpacity(0.09)),
            body: Container(
              color: real_black.withOpacity(0.09),
              child: Center(
                child: SizedBox(
                  width: width,
                  height: height,
                  child: Container(
                    margin: EdgeInsets.fromLTRB(width * 0.07, height * 0.05,
                        width * 0.07, height * 0.33),
                    // padding: EdgeInsets.fromLTRB(width * 0.1, 9, width * 0.1, 9),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      color: real_white,
                    ),
                    child: Stack(
                      children: [
                        // * select line / station
                        Column(
                          children: [
                            SizedBox(
                              height: height * 0.05,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                // * DropDownButton 1
                                greenDropDownButton(
                                  DropdownButton(
                                    underline: SizedBox(),
                                    isExpanded: true,
                                    value: linePick_dropDownValue1,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items:
                                        line_dropDownList.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Center(
                                          child: Text(
                                            items,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (dynamic newValue) {
                                      setState(() {
                                        linePick_dropDownValue1 =
                                            newValue ?? "";
                                      });
                                    },
                                  ),
                                ),
                                greenDropDownButton(
                                  DropdownButton(
                                    underline: SizedBox(),
                                    isExpanded: true,
                                    value: linePick_dropDownValue2,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items:
                                        line_dropDownList.map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Center(
                                          child: Text(
                                            items,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (dynamic newValue) {
                                      setState(() {
                                        linePick_dropDownValue2 =
                                            newValue ?? "";
                                      });
                                    },
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                greenDropDownButton(
                                  DropdownButton(
                                    underline: SizedBox(),
                                    isExpanded: true,
                                    value: stationPick_dropDownValue1,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items: station_dropDownList
                                        .map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Center(
                                          child: Text(
                                            items,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (dynamic newValue) {
                                      setState(() {
                                        stationPick_dropDownValue1 =
                                            newValue ?? "";
                                      });
                                    },
                                  ),
                                ),
                                Icon(
                                  Icons.east,
                                  color: real_black_65,
                                  size: 20,
                                ),
                                greenDropDownButton(
                                  DropdownButton(
                                    underline: SizedBox(),
                                    isExpanded: true,
                                    value: stationPick_dropDownValue2,
                                    icon: const Icon(Icons.keyboard_arrow_down),
                                    items: station_dropDownList
                                        .map((String items) {
                                      return DropdownMenuItem(
                                        value: items,
                                        child: Center(
                                          child: Text(
                                            items,
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                      );
                                    }).toList(),
                                    onChanged: (dynamic newValue) {
                                      setState(() {
                                        stationPick_dropDownValue2 =
                                            newValue ?? "";
                                      });
                                    },
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                        // * matching start button
                        Column(
                          children: [
                            SizedBox(
                              height: height * 0.37,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                greenTextButton("매칭 취소"),
                                greenTextButton("매칭 신청"),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
