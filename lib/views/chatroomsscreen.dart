import 'package:andromeda_chat/helper/authenticate.dart';
import 'package:andromeda_chat/services/auth.dart';
import 'package:andromeda_chat/views/search.dart';
import 'package:flutter/material.dart';

class ChatRoom extends StatefulWidget {
  const ChatRoom({ Key? key }) : super(key: key);

  @override
  State<ChatRoom> createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {

  AuthMethods authMethods = new  AuthMethods();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Image.asset("images/andromedachatlwtpng.png", height: 180,),
      actions: [
        GestureDetector(
          onTap: () {
            authMethods.singOut();
            Navigator.pushReplacement(context, MaterialPageRoute(
              builder: (context) => Authenticate()
            ));
          },
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
              child: Icon(Icons.exit_to_app)),
       ),
      ],
     ),
     floatingActionButton: FloatingActionButton(
      child: Icon(Icons.search),
      onPressed: () {
        Navigator.push(context, MaterialPageRoute(
          builder: (context) => SearchScreen()
        ));
      }
     ),
    );
  }
}