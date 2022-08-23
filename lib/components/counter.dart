import 'package:flutter/material.dart';

import '../constants/colors.dart';

class Counter extends StatefulWidget {
  const Counter({Key? key}) : super(key: key);

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  final _initNum = 1;
  final _maxNum = 10;
  final _minNum = 1;
  late int currentNum;

  void initState() {
    currentNum = _initNum;
    super.initState();
  }

  void increase() {
    setState(() {
      if (currentNum < _maxNum) {
        currentNum++;
      }
    });
  }

  void decrease() {
    setState(() {
      if (currentNum > _minNum) {
        currentNum--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        ElevatedButton(
            onPressed: () {
              decrease();
            },
            style: TextButton.styleFrom(
              backgroundColor: main_color_light,
              shape: CircleBorder(),
              padding: EdgeInsets.all(3),
              elevation: 0,
            ),
            child: Icon(
              Icons.remove,
              color: emerald,
              size: 17,
            )),
        Text(currentNum.toString()),
        ElevatedButton(
          onPressed: () {
            increase();
          },
          style: TextButton.styleFrom(
            backgroundColor: main_color_light,
            shape: CircleBorder(),
            padding: EdgeInsets.all(3),
            elevation: 0,
          ),
          child: Icon(
            Icons.add,
            color: emerald,
            size: 17,
          ),
        ),
        Text("분")
      ],
    );
  }
}
