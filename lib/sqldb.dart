import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await initialDB();
      return _db;
    } else {
      return _db;
    }
  }

  initialDB() async {
    String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'mydatabaseSQL.db');
    Database mydb = await openDatabase(path,
        onCreate: _onCreate, onUpgrade: _onUpgrade, version: 3);
    return mydb;
  }

  _onUpgrade(
    Database db,
    int oldVersion,
    int newVersion,
  ) async {
    await db.execute("ALTER TABLE notes ADD COLUMN color TEXT");
    print('onUpgrade table database =========================');
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE "notes" (
'id' INTEGER PRIMARY KEY NOT NULL ,
'note' TEXT NOT NULL 
)
''');
    print('onCreate table database =========================');
  }

  readData(String sql) async {
    Database? mydb = await db;
    List<Map> response = await mydb!.rawQuery(sql);
    return response;
  }

  insertData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawInsert(sql);
    return response;
  }

  deleteData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawDelete(sql);
    return response;
  }
 deleteDatbasea() async {
     String dataBasePath = await getDatabasesPath();
    String path = join(dataBasePath, 'mydatabaseSQL.db');
    await deleteDatabase(path);
  }
  updateData(String sql) async {
    Database? mydb = await db;
    int response = await mydb!.rawUpdate(sql);
    return response;
  }
}
