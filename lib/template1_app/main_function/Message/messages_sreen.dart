
import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:template1/template1_app/app_theme.dart';
import '../../template1_creen.dart';

class MessagesSreen extends StatefulWidget {
  const MessagesSreen({Key? key}) : super(key: key);

  @override
  _MessagesSreenState createState() => _MessagesSreenState();
}

class _MessagesSreenState extends State<MessagesSreen> {

  late TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController =  ScrollController();
  final List<Widget> _messages = <Widget>[];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          Column(
            children: [
              Container(
                height: 80,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(30),
                      bottomRight: Radius.circular(30),
                    ),
                    color: AppTheme.greenPrimary,
                ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 10,
                    ),
                    IconButton(
                      onPressed: (){
                        Navigator.of(context).pushAndRemoveUntil(
                            MaterialPageRoute(builder: gotoHome), (route) => false);
                      },
                      icon: Image.asset('assets/images/comeback.png'),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                   const CircleAvatar(
                      radius: 25,
                      backgroundImage: AssetImage("assets/images/avatar.png"),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Text("Thu Thao", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.white),),
                        Text("online", style: TextStyle(fontSize: 12, color: Colors.white))
                      ],
                    ),
                    const SizedBox(
                      width: 170,
                    ),
                  ],
                ),
              ),
              Flexible(
                child:  ListView(
                    controller: _scrollController,
                    reverse: true,
                    shrinkWrap: true,
                    children:  UnmodifiableListView(_messages),
                ),
                /*ListView.builder( //de hien thi tin nhan trong kho luu tru
                  itemCount: messages.length + _messages.length,
                  controller: _scrollController,
                  padding: const EdgeInsets.only(top: 10,bottom: 10),
                  reverse: true,
                  shrinkWrap: true,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index){
                    return Container(
                      padding: EdgeInsets.only(left: 14,right: 14,top: 10,bottom: 10),
                      child: Align(
                        alignment: (messages[index].messageType == "receiver"?Alignment.topLeft:Alignment.topRight),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: (messages[index].messageType  == "receiver"?Colors.grey.shade200:Colors.blue[200]),
                          ),
                          padding: EdgeInsets.all(16),
                          child: Text(messages[index].messageContent, style: TextStyle(fontSize: 15),),
                        ),
                      ),
                    );
                  },
                  //children:  UnmodifiableListView(_messages),
                ),*/
              ),
              const SizedBox(
                height: 59,
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding:const EdgeInsets.only(left: 10,bottom: 10,top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    onTap: (){
                    },
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        color: AppTheme.greenPrimary,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: const Icon(Icons.add, color: Colors.white, size: 20, ),
                    ),
                  ),
                 const SizedBox(width: 12,),
                   Expanded(
                    child: Container(
                      padding : const EdgeInsets.fromLTRB(10, 0, 10, 0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          border: Border.all(
                            width: 1,
                            color: Colors.grey,
                          ),
                          color: AppTheme.grey1,
                        ),
                        child: TextField(
                          cursorColor: Colors.black38,
                          controller: _messageController,
                          decoration: const InputDecoration(
                              hintText: "Message here...",
                              hintStyle: TextStyle(color: Colors.black54),
                              border: InputBorder.none
                          ),
                      ),
                    )
                  ),
                  const SizedBox(width: 12,),
                  FloatingActionButton(
                    onPressed: (){
                      setState(() {
                        if(_messageController.text != '') {
                          _messages.insert(0,
                              Container(
                                padding: const EdgeInsets.only(
                                    left: 14, right: 14, top: 10, bottom: 10),
                                child: Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                      decoration: const BoxDecoration(
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(30),
                                          topRight: Radius.circular(30),
                                          bottomLeft: Radius.circular(30),
                                        ),
                                        color: AppTheme.greenPrimary,
                                      ),
                                      padding: const EdgeInsets.all(16),
                                      child: Text(_messageController.text,
                                        style: const TextStyle(
                                            color: Colors.white),)
                                  ),
                                ),
                              )
                          );
                          _messageController = TextEditingController(text: '');
                        }
                        else{//do nothing
                           }
                      });
                      _scrollController.animateTo(
                        0.0,
                        curve: Curves.easeOut,
                        duration: const Duration(milliseconds: 300),
                      );

                    },
                    child: const Icon(Icons.send,color: Colors.white,size: 15,),
                    backgroundColor: AppTheme.greenPrimary,
                    elevation: 0,
                  ),
                ],

              ),
            ),
          ),
        ],
      ),
    );
  }
  /*List<ChatMessage> messages = [ // list message demo
    ChatMessage(messageContent: "Hello, Will", messageType: "receiver"),
    ChatMessage(messageContent: "How have you been?", messageType: "receiver"),
    ChatMessage(messageContent: "Hey Kriss, I am doing fine dude. wbu?", messageType: "sender"),
    ChatMessage(messageContent: "ehhhh, doing OK.", messageType: "receiver"),
    ChatMessage(messageContent: "Is there any thing wrong?", messageType: "sender"),
  ];*/
  Widget gotoHome(BuildContext context) {
    return Template1Screen();
  }
}
/*class ChatMessage{ //component dor chat message demo
  String messageContent;
  String messageType;
  ChatMessage({@required this.messageContent, @required this.messageType});
}*/
