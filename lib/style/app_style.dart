import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class AppStyle{
  static Color bgColor = Colors.white;
  static Color mainColor = Color(0xFF000633);
  static Color accentColor = Colors.lightBlue;

  static List<Color> card = [
    Colors.white,
    Colors.pink.shade100,
    Colors.orange.shade100,
    Colors.yellow.shade100,
    Colors.blue.shade100,
    Colors.green.shade100,
    Colors.blueGrey.shade100
  ];  


  static TextStyle mainTitle = GoogleFonts.roboto(fontSize:18.0,fontWeight:FontWeight.bold);
  static TextStyle mainContent = GoogleFonts.nunito(fontSize:16.0,fontWeight:FontWeight.normal);
  static TextStyle dateTitle = GoogleFonts.roboto(fontSize:13.0,fontWeight:FontWeight.w500);

}