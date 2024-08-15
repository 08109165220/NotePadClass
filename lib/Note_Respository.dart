 import 'package:notepad_sql/models/notess.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class NoteRespository{
  static const _dbName="notes_database.db";
  static const _tableName="notes";

 static Future<Database> _database ()async{
   final database=openDatabase(
     join(await getDatabasesPath(), _dbName),
     onCreate: (db, version) {
       return db.execute(
         'CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, title TEXT, categories TEXT, createdAt TEXT)',
       );
     },
     version: 1,
   );
   return database;
  }
    static insert({required Notess notess})async{
  final db=await _database();
    await db.insert(
    _tableName
    , notess.toMap(),conflictAlgorithm: ConflictAlgorithm.replace
    );

  }
    static update({required Notess notess})async{
  final db=await _database();
    await db.update(
    _tableName
    , notess.toMap(),where: 'id = ?',whereArgs:[notess.id]
    );

  }
    static delete({required Notess notess})async{
  final db=await _database();
    await db.delete(
    _tableName
    ,where: 'id = ?',whereArgs:[notess.id]
    );

  }
  static Future <List<Notess> >getNotes()async{
    final db=await _database();
    final List<Map<String,dynamic>>maps=await db.query(_tableName);

    return List.generate(maps.length, (i){
      return Notess(
        id: maps[i]["id"] as int,
          title: maps[i]["title"] as String,
          categories: maps[i]["categories"] as String,
          createdAt: DateTime.parse(maps[i]["createdAt"]) ,
      );
    });
  }
}