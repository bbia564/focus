
import 'package:focus_mode/db_focus/focus_entity.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';


class DBFocus extends GetxService {
  late Database dbBase;

  Future<DBFocus> init() async {
    await createFocusDB();
    return this;
  }

  createFocusDB() async {
    var dbPath = await getDatabasesPath();
    String path = join(dbPath, 'focus.db');

    dbBase = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await createFocusTable(db);
          await createRecordsTable(db);
        });
  }

  createFocusTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS focus (id INTEGER PRIMARY KEY, createdTime TEXT, name TEXT, minutes INTEGER)');
  }

  createRecordsTable(Database db) async {
    await db.execute(
        'CREATE TABLE IF NOT EXISTS records (id INTEGER PRIMARY KEY, createdTime TEXT, name TEXT, minutes INTEGER)');
  }

  insertFocus(FocusEntity entity) async {
    final id = await dbBase.insert('focus', {
      'createdTime': entity.createdTime.toIso8601String(),
      'name': entity.name,
      'minutes': entity.minutes,
    });
    return id;
  }

  insertRecord(FocusEntity entity) async {
    final id = await dbBase.insert('records', {
      'createdTime': entity.createdTime.toIso8601String(),
      'name': entity.name,
      'minutes': entity.minutes,
    });
    return id;
  }

  deleteFocus(FocusEntity entity) async {
    await dbBase.delete('focus', where: 'id = ?', whereArgs: [entity.id]);
  }

  cleanRecordsData() async {
    await dbBase.delete('records');
  }

  Future<List<FocusEntity>> getFocusAllData() async {
    var result = await dbBase.query('focus', orderBy: 'createdTime DESC');
    return result.map((e) => FocusEntity.fromJson(e)).toList();
  }

  Future<List<FocusEntity>> getRecordsAllData() async {
    var result = await dbBase.query('records', orderBy: 'createdTime DESC');
    return result.map((e) => FocusEntity.fromJson(e)).toList();
  }
}
