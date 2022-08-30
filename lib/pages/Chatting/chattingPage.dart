import 'package:flutter/material.dart';
import 'package:handysub/components/appBar.dart';
import 'package:handysub/constants/colors.dart';
import 'package:handysub/constants/textstyle.dart';
import 'package:handysub/pages/Chatting/chatMessage.dart';

class ChattingPage extends StatefulWidget {
  const ChattingPage({Key? key}) : super(key: key);

  @override
  State<ChattingPage> createState() => _ChattingPageState();
}

class _ChattingPageState extends State<ChattingPage> {
  TextEditingController _textEditingController = TextEditingController();
  List<ChatMessage> messageList = <ChatMessage>[];


  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'GmarketSans',
      ),
      home: Scaffold(
        appBar: defaultAppBar(context, "채팅", real_white),
        body: Container(
          margin: EdgeInsets.fromLTRB(width * 0.05, height * 0.03,
              width * 0.05, height * 0.03),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(child: chattingBuilder()),
              Stack(
                // fit: StackFit.expand,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(15,0,30,0),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                        width: 1,
                        color: main_color,
                      ),
                    ),
                    child: TextField(
                      keyboardType: TextInputType.multiline,
                      maxLines: null,
                      controller: _textEditingController,
                      decoration: InputDecoration(hintText: "메세지를 입력해주세요",
                        border: InputBorder.none,
                      ),
                      onSubmitted: textSubmit,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                        onPressed: (){textSubmit(_textEditingController.text);},
                        icon: Icon(Icons.send, color: main_color,)),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget chattingBuilder(){
    return ListView.builder(
        shrinkWrap: true,
        reverse: true,

        padding: const EdgeInsets.all(8),
        itemCount: messageList.length,
        itemBuilder: (BuildContext context, int index){
          return messageList[index];
        });
  }

  void textSubmit(String text){
    _textEditingController.clear();
    ChatMessage newMessage = ChatMessage(text, 0);
    setState(() {
      messageList.insert(0, newMessage);

    });

  }


}



