import 'package:flutter/material.dart';
import 'package:sqflite_project/sqldb.dart';

class Home extends StatelessWidget {
  SqlDb sqldb = SqlDb();

  Home({super.key});

  Future<List<Map>> readData() async {
    List<Map> response = await sqldb.readData("SELECT * FROM 'notes'");
    return response;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text(
          'HomePage',
          style: TextStyle(fontSize: 26, color: Colors.white),
        ),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.of(context).pushNamed("AddNotes");
          
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        children: [
        
          FutureBuilder(
            future: readData(),
            builder: (BuildContext context, AsyncSnapshot<List<Map>> snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                    itemCount: snapshot.data!.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return Card(
                          child: ListTile(
                        title: Text('${snapshot.data![index]}'),
                      ));
                    });
              }
              return const Center(
                  child: CircularProgressIndicator(
                color: Colors.grey,
              ));
            },
          ),
        ],
      ),
    );
  }
}
