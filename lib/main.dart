import 'package:flutter/material.dart';
import 'package:sqflite_project/add_notes.dart';
import 'package:sqflite_project/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
   const MyApp({ super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      routes: {
        "AddNotes":(context)=>const AddNotes(),
      },
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}
