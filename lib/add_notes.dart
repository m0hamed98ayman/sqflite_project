import 'package:flutter/material.dart';

class AddNotes extends StatefulWidget {
  const AddNotes({super.key});

  @override
  State<AddNotes> createState() => _AddNotesState();
}

class _AddNotesState extends State<AddNotes> {
  GlobalKey<FormState> formkey = GlobalKey();
  TextEditingController note = TextEditingController();
  TextEditingController title = TextEditingController();
  TextEditingController color = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blue,
          title: const Text(
            'adding notes',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Container(
            child: ListView(
          children: [
            Form(
                key: formkey,
                child: Column(
                  children: [
                    TextFormField(
                      controller: note,
                      decoration:const InputDecoration(hintText: "note"),
                    ), TextFormField(
                      controller: title,
                      decoration:const InputDecoration(hintText: "title"),
                    ), TextFormField(
                      controller: color,
                      decoration:const InputDecoration(hintText: "color"),
                    ),
                  ],
                )),
          ],
        )));
  }
}
