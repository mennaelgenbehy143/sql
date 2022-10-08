import 'package:sql/database/Repository.dart';
import 'package:sql/database/home.dart';

class HomeService{
  Repository ? _repository;

  HomeService(){
    _repository = Repository();
  }
  saveHome(Home home ) async {
    return await _repository?.insertData('home', home.homeMap());
  }
  readHome() async{
    return await _repository?.readData('home');
  }
}