import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class NotesDatabase {
  static Database? _db;

  static Future<Database> get database async {
    if (_db != null) return _db!;
    _db = await initDB();
    return _db!;
  }

  static Future<Database> initDB() async {
    final path = join(await getDatabasesPath(), 'notes.db');
    return openDatabase(path, version: 1, onCreate: (db, version) {
      return db.execute(
        'CREATE TABLE notes(id INTEGER PRIMARY KEY AUTOINCREMENT, title TEXT, content TEXT)',
      );
    });
  }

  static Future<void> insertNote(String title, String content) async {
    final db = await database;
    await db.insert('notes', {'title': title, 'content': content});
  }

  static Future<List<Map<String, dynamic>>> fetchNotes() async {
    final db = await database;
    return db.query('notes');
  }

  static Future<void> deleteNote(int id) async {
    final db = await database;
    await db.delete('notes', where: 'id = ?', whereArgs: [id]);
  }
}
