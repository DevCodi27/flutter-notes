import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/style/app_style.dart';

// ignore: must_be_immutable
class NotesReaderScreen extends StatefulWidget {
   NotesReaderScreen(this.doc,{Key? key}):super(key: key);
   QueryDocumentSnapshot doc;

  @override
  State<NotesReaderScreen> createState() => _NotesReaderScreenState();
}

class _NotesReaderScreenState extends State<NotesReaderScreen> {
  
  @override
  Widget build(BuildContext context) {
    int color_id = widget.doc["color_id"];
    return Scaffold(
      backgroundColor: AppStyle.card[color_id],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: AppStyle.card[color_id],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.doc["notes_title"],
              style: AppStyle.mainTitle,
              
            ),
            SizedBox(
              height: 4.0,
            ),
            Text(
              widget.doc["create_data"],
              style: AppStyle.dateTitle,
             
            ),
            SizedBox(
              height: 18.0,
            ),
            Text(
              widget.doc["note_content"],
              style: AppStyle.mainContent,
             
              
        
            ),
           
          ],
        ),
      ),
    );
  }
}