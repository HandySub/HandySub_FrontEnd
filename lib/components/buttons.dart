import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:handysub/constants/colors.dart';

Widget greenTextButton_4(String text) {
  return Container(
    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
    height: 50,
    width: 130,
    decoration: BoxDecoration(
      border: Border.all(
        width: 2,
        color: emerald,
      ),
      borderRadius: BorderRadius.all(
        Radius.circular(12.0),
      ),
    ),
    child: Center(
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
          color: emerald,
        ),
      ),
    ),
  );
}

Widget greenTextButton(String text, VoidCallback buttonFunc) {
  return CupertinoButton(
    onPressed: () {
      buttonFunc();
    },
    child: Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 2,
          color: emerald,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(12.0),
        ),
      ),
      child: Padding(
        padding: EdgeInsets.fromLTRB(17, 11.5, 17, 11.5),
        child: Text(
          text,
          style: TextStyle(
            fontFamily: 'GmarketSans',
            fontWeight: FontWeight.bold,
            fontSize: 20,
            color: emerald,
          ),
        ),
      ),
    ),
  );
}

Widget greenDropDownButton(DropdownButton dropdownbutton) {
  return Container(
    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
    height: 45,
    width: 120,
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
        padding: EdgeInsets.fromLTRB(5.0, 0, 5.0, 0), child: dropdownbutton),
  );
}

class toggleButton extends StatefulWidget {
  final String text1;
  final String text2;
  bool istext1Parent = false;

  toggleButton(
      {Key? key, required this.text1, required this.text2, istext1Parent})
      : super(key: key);

  @override
  State<toggleButton> createState() => _toggleButtonState();
}

class _toggleButtonState extends State<toggleButton> {
  bool istext1 = false;
  bool istext2 = false;
  late List<bool> isSelected;

  void initState() {
    isSelected = [istext1, istext2];
    super.initState();
  }

  void toggleSelect(value) {
    if (value == 0) {
      istext1 = true;
      istext2 = false;
    } else {
      istext1 = false;
      istext2 = true;
    }
    setState(() {
      isSelected = [istext1, istext2];
      widget.istext1Parent = istext1;
    });
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
      return Row(
        children: [
          ToggleButtons(
            isSelected: isSelected,
            onPressed: toggleSelect,
            color: main_color,
            fillColor: main_color,
            borderRadius: BorderRadius.all(Radius.circular(20.0)),
            borderColor: main_color,
            selectedColor: real_white,
            constraints: BoxConstraints.expand(
                width: constraints.maxWidth / 2 - 3,
                height: constraints.maxHeight / 2 + 10),
            children: <Widget>[
              Text(widget.text1),
              Text(widget.text2),
            ],
          )
        ],
      );
    });
  }
}
