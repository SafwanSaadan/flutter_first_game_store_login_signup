// ignore_for_file: avoid_print

import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class SqlDb {
  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialDb();
      return _db;
    } else {
      return _db;
    }
  }

  intialDb() async {
    // Get a location using getDatabasesPath
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    // Delete the database
    await deleteDatabase(path);

    Database mydb = await openDatabase(path,
        version: 1, onCreate: _onCreate, onUpgrade: _onUpgrade);
    return mydb;
  }

  _onUpgrade(Database db, int oldversion, int newversion) {
    print("onUpgrade =====================================");
  }

  _onCreate(Database db, int version) async {
    await db.execute(
        'CREATE TABLE users (id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT, password TEXT)');
    print(" onCreate =====================================");
  }

  Future<List<Map<String, dynamic>>> readData() async {
    Database? mydb = await db;
    String sql = 'SELECT * FROM users';
    List<Map<String, dynamic>> response = await mydb!.rawQuery(sql);
    return response;
  }

  Future<int> insertData(String email, String password) async {
    Database? mydb = await db;
    String sql = 'INSERT INTO users (email, password) VALUES (?, ?)';
    List<dynamic> arguments = [email, password];
    int response = await mydb!.rawInsert(sql, arguments);
    return response;
  }

  Future<int> updateData(int id, String email, String password) async {
    Database? mydb = await db;
    String sql = 'UPDATE users SET email = ?, password = ? WHERE id = ?';
    List<dynamic> arguments = [email, password, id];
    int response = await mydb!.rawUpdate(sql, arguments);
    return response;
  }

  Future<int> deleteData(int id) async {
    Database? mydb = await db;
    String sql = 'DELETE FROM users WHERE id = ?';
    List<dynamic> arguments = [id];
    int response = await mydb!.rawDelete(sql, arguments);
    return response;
  }

  Future<List<Map<String, dynamic>>> searchUser1(
      String email, String password) async {
    Database? mydb = await db;
    String sql = 'SELECT * FROM users WHERE email = ? AND password = ?';
    List<dynamic> arguments = [email, password];
    List<Map<String, dynamic>> response = await mydb!.rawQuery(sql, arguments);
    return response;
  }

  Future<bool> searchUser(String email, String password) async {
    Database? mydb = await db;
    String sql = 'SELECT COUNT(*) FROM users WHERE email = ? AND password = ?';
    List<dynamic> arguments = [email, password];
    int count =
        Sqflite.firstIntValue(await mydb!.rawQuery(sql, arguments)) ?? 0;
    bool userExists = count > 0;
    return userExists;
  }

  bool isPasswordValid(String password) {
    RegExp passwordRegex = RegExp(
        r"^(?=.*[a-zA-Z])(?=.*\d)(?=.*[!@#\$%^&*()_+\-=[\]{};:\'\\|,.<>\/?]).{8,}$");
    return passwordRegex.hasMatch(password);
  }
// SELECT
// DELETE
// UPDATE
// INSERT
}
