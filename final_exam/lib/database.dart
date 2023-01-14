import 'package:firebase_auth/firebase_auth.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
var uid = FirebaseAuth.instance.currentUser?.uid;
class DatabaseHelper {
  static const _databaseName = "MyDatabase.db";
  static const _databaseVersion = 1;
  static const table = 'my_table';
  static const columnId = '_id';
  static const columnUid = 'uid';
  static const columnCorrect= 'correct';
  static const columnTotal= 'total';

  static late Database _db;

  // this opens the database (and creates it if it doesn't exist)
  Future<void> mydb() async {
    final documentsDirectory = await getApplicationDocumentsDirectory();
    final path = join(documentsDirectory.path, _databaseName);
    _db = await openDatabase(
      path,
      version: _databaseVersion,
      onCreate: _onCreate,
    );
  }

  // SQL code to create the database table
  Future _onCreate(Database db, int version) async {
    await db.execute('''
          CREATE TABLE $table (
            $columnId INTEGER PRIMARY KEY,
            $columnUid TEXT NOT NULL,
            $columnCorrect TEXT NOT NULL,
            $columnTotal TEXT NOT NULL
           
          )
          ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    return await _db.insert(table, row);
  }

  Future<List<Map<String, dynamic>>> queryAllRows() async {
    return await _db.rawQuery('SELECT * FROM $table where uid="$uid"');
  }

  Future<int> female() async {
    final results = await _db.rawQuery('SELECT COUNT(*) FROM $table where gender="Female"');
    return Sqflite.firstIntValue(results) ?? 0;
  }
  Future<int> male() async {
    final results = await _db.rawQuery('SELECT COUNT(*) FROM $table where gender="Male"');
    return Sqflite.firstIntValue(results) ?? 0;
  }
  Future<int> paid() async {
    final results = await _db.rawQuery('SELECT COUNT(*) FROM $table where status="Paid"');
    return Sqflite.firstIntValue(results) ?? 0;
  }
  Future<int> clear() async {
    final results = await _db.rawQuery('DELETE  FROM $table ');
    return Sqflite.firstIntValue(results) ?? 0;
  }
  Future<int> unpaid() async {
    final results = await _db.rawQuery('SELECT COUNT(*) FROM $table where status="Unpaid"');
    return Sqflite.firstIntValue(results) ?? 0;
  }
  Future<int> total() async {
    final results = await _db.rawQuery('SELECT SUM(fee) FROM $table');
    return Sqflite.firstIntValue(results) ?? 0;
  }
  Future<int> queryRowCount() async {
    final results = await _db.rawQuery('SELECT COUNT(*) FROM $table');
    return Sqflite.firstIntValue(results) ?? 0;
  }

  // We are assuming here that the id column in the map is set. The other
  // column values will be used to update the row.
  Future<int> update(Map<String, dynamic> row) async {
    int id = row[columnId];
    return await _db.update(
      table,
      row,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
  Future<int> Delete(Map<String, dynamic> row) async {
    int id = row[columnId];
    return await _db.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }

  // Deletes the row specified by the id. The number of affected rows is
  // returned. This should be 1 as long as the row exists.
  Future<int> delete(int id) async {
    return await _db.delete(
      table,
      where: '$columnId = ?',
      whereArgs: [id],
    );
  }
}
