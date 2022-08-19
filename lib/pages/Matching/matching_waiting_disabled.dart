import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:handysub/components/buttons.dart';
import 'package:handysub/components/frame.dart';
import 'package:handysub/constants/colors.dart';
import 'package:handysub/components/appBar.dart';

class MatchingWaitingDisabled extends StatefulWidget {
  const MatchingWaitingDisabled({Key? key}) : super(key: key);

  @override
  State<MatchingWaitingDisabled> createState() =>
      _MatchingWaitingDisabledState();
}

class _MatchingWaitingDisabledState extends State<MatchingWaitingDisabled> {
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
      Column(),
    );
  }
}
