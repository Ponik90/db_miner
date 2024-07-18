import 'dart:io';
import 'package:db_miner_app/screen/detail/model/detail_model.dart';
import 'package:db_miner_app/screen/quotes/model/quotes_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  static DbHelper dbHelper = DbHelper._();

  DbHelper._();

  Database? db;

  Future<Database?> checkDb() async {
    if (db != null) {
      return db;
    } else {
      return await initDb();
    }
  }

  Future<Future<Database>> initDb() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, "quotes.db");

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) {
        String query1 =
            "CREATE TABLE category (id INTEGER PRIMARY KEY AUTOINCREMENT,name TEXT)";
        String query2 =
            "CREATE TABLE quotes (id INTEGER PRIMARY KEY AUTOINCREMENT,quote TEXT,author TEXT,category TEXT)";
        db.execute(query1);
        db.execute(query2);
      },
    );
  }

  Future<void> insertCategory(String name) async {
    db = await checkDb();
    String query = "INSERT INTO category (name) VALUES ('$name')";
    db!.rawInsert(query);
  }

  Future<List<QuotesModel>> readCategory() async {
    db = await checkDb();

    String query = "SELECT * FROM category";
    List data = await db!.rawQuery(query);
    List<QuotesModel> model =
        data.map((e) => QuotesModel.mapToModel(e)).toList();
    return model;
  }

  Future<void> deleteCategory(int id) async {
    db = await checkDb();
    String query = "DELETE FROM category WHERE id = $id";
    db!.rawDelete(query);
  }

  Future<void> insertQuotes(
      String quotes, String author, String category) async {
    db = await checkDb();

    String query =
        "INSERT INTO quotes (quote,author,category) VALUES ('$quotes','$author','$category') ";
    db!.rawInsert(query);
  }

  Future<List<DetailModel>> readQuotes() async {
    db = await checkDb();
    String query = " SELECT * FROM quotes";
    List data = await db!.rawQuery(query);
    List<DetailModel> dataList =
        data.map((e) => DetailModel.mapToModel(e)).toList();
    return dataList;
  }

  Future<void> deleteQuotes(int id) async {
    db = await checkDb();
    String query = "DELETE FROM quotes WHERE id = $id ";
  }
}
