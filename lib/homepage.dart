import 'package:flutter/material.dart';
import 'package:sqflite_project/sqldb.dart';

class Home extends StatelessWidget {
  SqlDb sqldb = SqlDb();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(
          'Sqflite',
          style: TextStyle(fontSize: 26),
        ),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
             SizedBox(
              height: 250,
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor:  Color.fromARGB(255, 99, 232, 209),
              ),
              onPressed: () async {
                int response = await sqldb.insertData('''
INSERT INTO 'notes' ('note') VALUES ('second note')
''');
                print(response);
              },
              child:  Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Insert Data',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
             SizedBox(height: 40),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                  backgroundColor:  Color.fromARGB(255, 168, 253, 137)),
              onPressed: () async {
                List<Map> response =
                    await sqldb.readData('''SELECT * FROM 'notes' ''');
                print(response);
              },
              child:  Padding(
                padding: EdgeInsets.all(8.0),
                child: Text(
                  'Read Data',
                  style: TextStyle(fontSize: 24),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
