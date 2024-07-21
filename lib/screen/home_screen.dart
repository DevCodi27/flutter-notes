import 'package:cloud_firestore/cloud_firestore.dart';
//  import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_notes/screen/notes_editor.dart';
import 'package:flutter_notes/screen/notes_reader.dart';
import 'package:flutter_notes/style/app_style.dart';
import 'package:flutter_notes/widgets/noted_card.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.mainColor,
      appBar: AppBar(
        elevation: 0.0,
        title: Text("Flutter Noes",style: TextStyle(color: Colors.white),),
        backgroundColor: AppStyle.mainColor,
        centerTitle: true,
      ),

      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Your recent Notes",style: GoogleFonts.roboto(
              color:Colors.white,
              fontWeight:FontWeight.bold,
              fontSize:22,
              ),),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance.collection("notes").snapshots(),
                  builder: (context, AsyncSnapshot<QuerySnapshot> snapshot){
                     if(snapshot.connectionState == ConnectionState.waiting){
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                     }
                     if(snapshot.hasData)
                     {
                     return GridView(gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
                     children: snapshot.data!.docs.map((note) =>noteCard(() {
                      Navigator.push(context, MaterialPageRoute(builder: ((context) => NotesReaderScreen(note))));
                     },note) ).toList(),
                     );
                     }
                     return Text("There is no Notes",style: GoogleFonts.nunito(color:Colors.white),);
                  },
                  
                ),
              )
          ],
        
        )
      ),

      floatingActionButton: FloatingActionButton.extended(onPressed: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>NotesEditorScreen()));
      },
      backgroundColor: Colors.lightBlue,
      label: Text("Add Notes"),
      icon: Icon(Icons.add,color: Colors.white,),
    )
    );
  }
}