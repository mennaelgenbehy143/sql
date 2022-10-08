import 'package:flutter/material.dart';
import 'database/home.dart';

import 'database/homeService.dart';

class SecondScreen extends StatefulWidget {


  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  late HomeService _homeService;
    List<Home> _Homelist = <Home>[];

    @override
    initState(){
      super.initState();
      getAllHomes();
    }

   getAllHomes() async{
     _homeService = HomeService();
     _Homelist = <Home>[];

     var homes = await _homeService.readHome();
     homes.forEach((home){
       setState(() {
         var model = Home();
         //model.id=home['id'];
         model.countries=home['countries'];
         model.keys=home['keys'];
         //model.gender=home['gender'];
         _Homelist.add(model);
       });
     });
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Done'),
      ),
      body: ListView.builder(
        itemCount: _Homelist.length,
          itemBuilder: (context , index){
          return Card(
            elevation: 8,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(0),
            ),
            child: ListTile(
              subtitle: Text(_Homelist[index].countries ),
              trailing: Text(_Homelist[index].keys ),
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                  <Widget>[
                    Text(_Homelist[index].countries ),
                  ],
              ),
            ),
          );
          }),
    );
  }
}
