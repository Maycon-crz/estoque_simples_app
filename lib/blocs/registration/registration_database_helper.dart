import 'dart:io';

import 'package:sqlite3/sqlite3.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';

class RegistrationDatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _iniDatabase();
    return _database!;
  }

  Future<Database> _iniDatabase() async {
    final Directory directory = await getApplicationDocumentsDirectory();
    //Une as partes do caminho fornecidas em um único caminho.
    final String path = join(directory.path, 'registration_database.db');
    //---
    final Database db = sqlite3.open(path);
    await _createTables(db);
    return db;
  }

  Future<void> _createTables(Database db) async {
    db.execute('''
      CREATE TABLE IF NOT EXISTS users (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        first_name TEXT NOT NULL,
        last_name TEXT NOT NULL,
        user_name TEXT NOT NULL,
        email TEXT NOT NULL,
        password TEXT NOT NULL
      )
    ''');
  }

  Future<int> insertUser(Map<String, dynamic> user) async {
    final db = await database;
    final stmt = db.prepare('''
      INSERT INTO users (first_name, last_name, user_name, email, password)
      VALUES (?, ?, ?, ?, ?)
    ''');
    stmt.execute([
      user['first_name'],
      user['last_name'],
      user['user_name'],
      user['email'],
      user['password']
    ]);
    final int id = db.lastInsertRowId;
    stmt.dispose();
    return id;
  }

  Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    final Database db = await database;
    final result = db.select('SELECT * FROM users WHERE email = ?', [email]);

    if (result.isEmpty) return null;
    return result.first;
  }

  void close() {
    _database?.dispose();
  }
}
