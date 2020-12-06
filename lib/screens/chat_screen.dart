import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_complete_guide/screens/Mapi.dart';
import 'package:flutter_complete_guide/widgets/chat/messages.dart';
import 'package:flutter_complete_guide/widgets/chat/new_message.dart';

class ChatScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('FlutterChat'),
        actions: [
          PopupMenuButton(
            onSelected: (int selectedvalue) {
              print(selectedvalue);
              if (selectedvalue == 0) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (ctx) => Mapi(),
                  ),
                );
              }
              if (selectedvalue == 1) {
                FirebaseAuth.instance.signOut();
              }
            },
            icon: Icon(
              Icons.more_vert,
            ),
            itemBuilder: (_) => [
              PopupMenuItem(child: Text('Location'), value: 0),
              PopupMenuItem(child: Text('Logout'), value: 1)
            ],
          ),
        ],
      ),
      body: Container(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Messages(),
            ),
            NewMessage(),
          ],
        ),
      ),
    );
  }
}
