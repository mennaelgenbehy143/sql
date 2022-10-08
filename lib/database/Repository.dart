import 'package:sqflite/sqflite.dart';
import 'package:sql/database/daConnection.dart';

class Repository{
  late DataBaseConnection _dataBaseConnection;
  Repository(){
    _dataBaseConnection = DataBaseConnection();
  }
  static Database ?  _database;
  Future<Database?> get database async{
    if(_database != null) return _database;
    _database = await _dataBaseConnection.setDatabase();
    return _database;
  }
  insertData(table,data) async {
    var connection = await database;
    return await connection?.insert(table, data);
  }

  readData(table) async {
    var connection = await database;
    return await connection?.query(table);
  }
  // readDataById(table,itemId) async{
  //   var connection = await database;
  //   return await connection?.query(table,where: 'id=?',whereArgs: [itemId]);
  // }
}