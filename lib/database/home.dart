class Home{
  //late int id;
  late String countries;
  late String keys;
  //late String gender;

  homeMap(){
    var mapping = Map<String , dynamic>();
    //mapping['id']=id;
    mapping['countries']=countries;
    mapping['keys']=keys;
    //mapping['gender']=gender;

    return mapping;
  }
}