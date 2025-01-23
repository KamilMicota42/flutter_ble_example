import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/user/user.dart';

class SqfliteService {
  static final SqfliteService _instance = SqfliteService._internal();
  static Database? _database;

  factory SqfliteService() {
    return _instance;
  }

  SqfliteService._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    String path = join(await getDatabasesPath(), 'database.db');
    return await openDatabase(path,
        version: 2, // Zwiększ wersję przy każdej migracji,
        onCreate: _onCreate,
        onUpgrade: _onUpgrade,
        onDowngrade: _onDowngrade);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute(
      '''
      CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        surname TEXT,
        age INTEGER
      )
      ''',
    );
    await db.execute(
      '''
      CREATE TABLE products(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        name TEXT,
        price INTEGER
      )
      ''',
    );
  }

  // migracji dokonujmey tylko wtedy gdy apka jest na sklepie i isnieje prawdopodobienstwo ze ktoś po prostu ją zaktualziuje, a nie zainstaluje ponownie,
  // dane z onCreate wykonują sie tylko wtedy gdy apka jest instalowana poraz pierwszy, lub ma wyczyszczone dane z cache telefonu
  Future<void> _onUpgrade(Database db, int oldVersion, int newVersion) async {
    if (oldVersion < 2) {
      // Migracja do wersji 2: Dodanie nowej kolumny 'priority'
      // trzeba pamietac ze jak modyfikujemy kolumne to i model trzeba tez zaktualizować
      await db.execute('ALTER TABLE users ADD COLUMN gender TEXT');
      // tu moze byc wiecej teges śmeges
    }
    if (oldVersion < 3) {
      // kolejna migraca
    }

    // Można dodawać kolejne migracje w przypadku dalszych aktualizacji
  }

  Future<void> _onDowngrade(Database db, int oldVersion, int newVersion) async {}

// User CRUD
  Future<int> insertUser(User user) async {
    Database db = await database;
    return await db.insert('users', user.toJson(), conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<User>> readUsers() async {
    Database db = await database;
    final List<Map<String, dynamic>> maps = await db.query('users');
    return List.generate(maps.length, (i) {
      return User.fromJson(maps[i]);
    });
  }

  Future<int> updateUser(User user) async {
    Database db = await database;
    return await db.update(
      'users',
      user.toJson(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
  }

  Future<int> deleteUser(int id) async {
    Database db = await database;
    return await db.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
