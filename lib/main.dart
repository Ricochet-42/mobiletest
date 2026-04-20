import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:proyect1/pages/Home.dart';
import 'package:proyect1/pages/option_ab.dart';
import 'package:proyect1/pages/terminos.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      //debugShowCheckedModeBanner: false, 
      theme: ThemeData(
        fontFamily: GoogleFonts.gideonRoman().fontFamily,
        
      ),

      initialRoute: 'mainmenu',
      routes: {
        'mainmenu':(BuildContext context) => Home(),
        'terminos':(BuildContext context) => Terminos(),
        
        
      },
      
      
    );
    
  }
}