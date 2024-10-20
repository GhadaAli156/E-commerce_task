import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  factory DatabaseHelper() => _instance;
  static Database? _database;
  DatabaseHelper._internal();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB();
    return _database!;
  }
  Future<Database> _initDB() async {
    String path = join(await getDatabasesPath(), 'user.db');
    return await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('CREATE TABLE user(name TEXT)');
        await db.execute('''
          CREATE TABLE combo(
            name TEXT,
            price TEXT,
            image TEXT
          )
        ''');
      },
    );
  }
    Future<void> insertUser(String name) async {
    final db = await database;
    await db.insert('user', {'name': name});
  }
  Future<String?> getUserName() async {
    final db = await database;
    final List<Map<String, dynamic>> maps = await db.query('user');
    if (maps.isNotEmpty) {
      return maps[0]['name'];
    }
    return null;
  }
  Future<void> insertCombo(String name, String price , String image ) async{
    await _database!.insert(
        'combo',
        {'name': name, 'price': price, "image":image}
    );
  }
  Future<List<Map>> getCombo() async{
    List<Map> list = await _database!.rawQuery('SELECT * FROM combo');
    return list;
  }
  Future<void> deleteCombo(int id) async {
    final db = await database;
    await db.delete('combo', where: 'id = ?', whereArgs: [id]);
  }
}
