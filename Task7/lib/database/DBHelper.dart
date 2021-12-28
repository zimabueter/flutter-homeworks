import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task7/data/models/student.dart';

class DBHelper {
  DBHelper._privateContructor();
  static final DBHelper instance = DBHelper._privateContructor();

  static Database? _database;
  Future<Database> get database async => _database ??= await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, 'student_database.db');

    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute(
      'CREATE TABLE students(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
    );
  }

  Future<List<Student>> getStudents() async {
    Database db = await instance.database;

    final List<Map<String, dynamic>> maps = await db.query('students');

    return List.generate(maps.length, (i) {
      return Student(
        id: maps[i]['id'],
        name: maps[i]['name'],
        age: maps[i]['age'],
      );
    });
  }

  Future<int> addStudent(Student student) async {
    Database db = await instance.database;
    return await db.insert('students', student.toMap());
  }

  Future<int> removeStudent(int id) async {
    Database db = await instance.database;
    return await db.delete('students', where: 'id = ?', whereArgs: [id]);
  }
}
