import 'dart:developer';

import 'package:exp_tracker/model/tracker_model.dart';
import 'package:sqflite/sqflite.dart';

class Homescrcontroller {
  static late Database exp_tracker;
  static List<Map<String, Object?>> data = [];
  static List<TrackerModel> trackerlist = [];
  //initialize db

static Future<void> initdb()async{
  //open db
  exp_tracker = await openDatabase("exp_tracker.db", version: 1,
 onCreate: (Database db, int version)
 async{
  //create table
  await db.execute('CREATE TABLE Tracker(id INTEGER PRIMARY KEY, amount INTEGER, category TEXT, date TEXT, note TEXT,type TEXT)');});
}
static Future adddata(
  {
    required String amount,
    required String category,
    required String date,
    required String type,
    required String note,
  }
) async{
  await exp_tracker.rawInsert(
'INSERT INTO Tracker(amount, category, date, type, note) VALUES(?,?,?,?,?)',
[amount,category,date,type,note]
  );
}
static Future getallData()async{
  data = await exp_tracker.rawQuery('SELECT * FROM Tracker');
  trackerlist = data.map((e)=>TrackerModel(id: int.parse(e["id"].toString()),amount:  int.parse(e["amount"].toString()) , category: e["category"].toString() , date: e["date"].toString(), type: e["type"].toString(), note: e["note"].toString()) ).toList();
  log(data.toString());
}
static Future deletedata(var id)async{
 await exp_tracker.rawDelete('DELETE FROM Tracker WHERE id = ? ',[id]);
 await getallData();
}
 
}