import 'package:sqflite/sqflite.dart';
import 'package:sqflite/sql.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
class DataBaseConnection{
  setDatabase() async{
    var directory = await getApplicationDocumentsDirectory();
    var path = join(directory.path , 'db_sql_sqflite');
    var database = await openDatabase(path,version: 1,onCreate: _onCreatingDatabase);
    return database;
  }
  _onCreatingDatabase (Database database , int version) async{
    await database.execute("CREATE TABLE home ( countries TEXT , keys TEXT )");
  }
}