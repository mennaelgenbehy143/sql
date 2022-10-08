import 'package:flutter/material.dart';
import 'package:sql/database/home.dart';
import 'package:sql/database/homeService.dart';
import 'package:sql/secondScreen.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  String dropCountriesdownvalue = 'Egypt';
  String dropKeysdownvalue = '+20';
  String dropGenderdownvalue = 'Male';


  var Countries = [
    'Egypt',
    'Turkey',
    'India',
    'Lebanon',
    'Jordan',
  ];
  var Keys = [
    '+20',
    '+90',
    '+91',
    '+961',
    '+962',
  ];
  var Gender = [
    'Male',
    'Female',
  ];
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();
  _showSuccessSnackBar(message){
    var snackBar = SnackBar(content: message);
    _globalKey.currentState?.showSnackBar(snackBar);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _globalKey,
      appBar: AppBar(
        title: const Center(child: Text("SQL")),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              DropdownButtonFormField(

                value: dropCountriesdownvalue,

                icon:Row(
                  children: const [
                    SizedBox(width: 25,),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),

                items: Countries.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Center(child: Text(items)),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropCountriesdownvalue = newValue!;
                  });
                },
              ),
              const SizedBox(height: 15,),
              DropdownButtonFormField(
                value: dropKeysdownvalue,
                icon:Row(
                  children: const [
                    SizedBox(width: 25,),
                    Icon(Icons.keyboard_arrow_down)
                  ],
                ),

                items: Keys.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Center(child: Text(items)),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropKeysdownvalue = newValue!;
                  });
                },
              ),
              const SizedBox(height: 15,),
              DropdownButtonFormField(

                // Initial Value
                value: dropGenderdownvalue,

                // Down Arrow Icon
                icon:Row(
                  children: [
                    SizedBox(width: 25,),
                    const Icon(Icons.keyboard_arrow_down)
                  ],
                ),

                // Array list of items
                items: Gender.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Center(child: Text(items)),
                  );
                }).toList(),
                // After selecting the desired option,it will
                // change button value to selected value
                onChanged: (String? newValue) {
                  setState(() {
                    dropGenderdownvalue = newValue!;
                  });
                },
              ),
              const SizedBox(height: 50,),
              RaisedButton(
                onPressed: () async {
                  Navigator.of(context).push( MaterialPageRoute(
                      builder: (context)=>SecondScreen()));
                  var homeObject = Home();
                  homeObject.countries=dropCountriesdownvalue.toString();
                  homeObject.keys=dropKeysdownvalue.toString();
                  //homeObject.gender=dropGenderdownvalue.toString();
                  var homeService = HomeService();
                  var result = await homeService.saveHome(homeObject);
                  if(result>0){
                    _showSuccessSnackBar(const Text('CREATED'));
                  }
                  print(result);
                },
                color: Colors.blue,
                child: const Text('Save',style: TextStyle(color: Colors.white),),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
