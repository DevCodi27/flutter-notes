import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_notes/style/app_style.dart';

Widget noteCard(Function()? onTap,QueryDocumentSnapshot doc)
{
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: EdgeInsets.all(8.0),
      margin: EdgeInsets.all(8.0),
      decoration: BoxDecoration(
        color: AppStyle.card[doc["color_id"]],
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc["notes_title"],
            style: AppStyle.mainTitle,
            
          ),
          SizedBox(
            height: 4.0,
          ),
          Text(
            doc["create_data"],
            style: AppStyle.dateTitle,
          ),
          SizedBox(
            height: 8.0,
          ),
          Text(
            doc["note_content"],
            style: AppStyle.mainContent,
            overflow: TextOverflow.ellipsis,

          ),
         
        ],
      ),
    ),
  );
}