import 'package:flutter/material.dart';
import 'package:sqflite_project/sqldb.dart';

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
  SqlDb sqlDb = SqlDb();

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
        body: ListView(
          children: [
            Form(
                key: formkey,
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      TextFormField(
                        controller: note,
                        decoration: const InputDecoration(hintText: "  note"),
                      ),
                      TextFormField(
                        controller: title,
                        decoration: const InputDecoration(hintText: "  title"),
                      ),
                      TextFormField(
                        controller: color,
                        decoration: const InputDecoration(hintText: "  color"),
                      ),
                      const SizedBox(height: 50),
                      GestureDetector(
                        onTap: () async {
                          int response = await sqlDb.insertData('''
                                           INSERT INTO notes (`note`, `title`,`color`)
                                           VALUES ("${note.text}","${title.text}","${color.text}")                                     
                                                      ''');
                                                      if (response>0) {
                                                      
                                                       Navigator.of(context).pop();
                                                      }
                                                      setState(() {
                                                        
                                                      });
                        },
                        child: Container(
                          decoration: const BoxDecoration(
                              color: Colors.blue,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8))),
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Text(
                              "Enter Note",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 24),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                )),
          ],
        ));
  }
}
