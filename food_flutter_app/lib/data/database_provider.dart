import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'Dessert.dart';

class DatabaseProvider {
  static DatabaseProvider _instance = DatabaseProvider._internal();

  factory DatabaseProvider() => _instance;

  DatabaseProvider._internal();

  Database _db;


  Future<void> openDessertsDatabase() async {
    print("открываю базу");
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'desserts_database');

    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) => _createDatabase(db)
    );
  }

  Future<void> _createDatabase(Database db) async {
    print("создаю базу");
    await db.execute('CREATE TABLE IF NOT EXISTS $tableDesserts ('
        '$columnId INTEGER PRIMARY KEY AUTOINCREMENT, '
        '$columnTitle TEXT, '
        '$columnCalories INTEGER)'
    );
    await insertSomeDesserts(db);
  }

  Future<void> saveDessert(Dessert dessert) async {
    print("сохраняю дессерт");
    await _db.insert(tableDesserts, dessert.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  Future<List<Dessert>> getDesserts() async {
    print("вывожу все дессерты");
    final List<Map<String, dynamic>> dessertMaps = await _db.query(
        tableDesserts);
    return dessertMaps.map((dessert) => Dessert.fromMap(dessert)).toList();
  }

  Future<void> insertSomeDesserts(db) async {
    for(int i=0; i< desserts.length; i++) {
      db.insert(tableDesserts, desserts[i].toMap());
    }
  }
}

List<Dessert> desserts = [
  Dessert(id: 0, title: "Tea (with sugar)", calories: 28),
  Dessert(id: 1, title: "Coffee (with sugar)", calories: 62),
  Dessert(id: 2, title: "Cake 'Napoleon'", calories: 413),
  Dessert(id: 3, title: "Cake 'Medovic'", calories: 478),
  Dessert(id: 4, title: "Apple pie", calories: 370),
  Dessert(id: 5, title: "Cheesecake", calories: 240),
  Dessert(id: 6, title: "Macarons", calories: 500),
  Dessert(id: 7, title: "Eclair (with cream)", calories: 439),
  Dessert(id: 8, title: "Chokopie", calories: 430),
  Dessert(id: 9, title: "cake 'patato'", calories: 392),
  Dessert(id: 10, title: "Cherry pie McDonald's", calories: 230),
  Dessert(id: 11, title: "Pancakes with cheese", calories: 382),
  Dessert(id: 12, title: "Pancakes with sour cream", calories: 311),
  Dessert(id: 13, title: "Pancakes with condensed milk", calories: 28),
];


