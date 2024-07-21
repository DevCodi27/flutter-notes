import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/style/app_style.dart';

class NotesEditorScreen extends StatefulWidget {
  const NotesEditorScreen({super.key});

  @override
  State<NotesEditorScreen> createState() => _NotesEditorScreenState();
}

class _NotesEditorScreenState extends State<NotesEditorScreen> {
  int color_id = Random().nextInt(AppStyle.card.length);
  String date = DateTime.now().toString();
  TextEditingController _titleEditingController = TextEditingController();
  TextEditingController _mainEditionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.card[color_id],
      appBar: AppBar(
        backgroundColor: AppStyle.card[color_id],
        elevation: 0.0,
        iconTheme: 
        IconThemeData(color: Colors.black),
        title: Text("Add a new Notes" ,style: TextStyle(color: Colors.black),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleEditingController,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Notes Title'
              ),
              style: AppStyle.mainTitle,
            ),
            SizedBox(height: 8.0,),
            Text(date,style: AppStyle.dateTitle,),
            SizedBox(height: 28.0,),

            TextField(
              controller: _mainEditionController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Note content',

              ),
            )
          ],), ),
          floatingActionButton: FloatingActionButton(onPressed: ()async{
            FirebaseFirestore.instance.collection("notes").add({
              "notes_title":_titleEditingController.text,
              "create_data":date,
              "note_content":_mainEditionController.text,
              "color_id":color_id,
            }).then((value){
              print(value.id);
              Navigator.pop(context);
            }).catchError((error) => print("Failde to add new Note due to $error"));
          },
          child: Icon(Icons.save),),
    );
  }
}