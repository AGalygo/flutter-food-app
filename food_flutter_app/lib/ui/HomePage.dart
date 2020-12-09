import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter_app/data/Dessert.dart';
import 'package:food_flutter_app/ui/DessertButton.dart';
import 'package:food_flutter_app/ui/MyForm.dart';
import 'package:food_flutter_app/ui/YourActivities.dart';
import 'package:flutter/services.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "How much does dessert cost?",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 20.0,
            color: Colors.pink[50],
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      //body: _buildContent(),
      body: ListView(
        children: myDesserts(context),
      ),
      //backgroundColor: Colors.amber[600],
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }

  void _getMoreInformation() {
    print("pressed on the button");
  }

  List<DessertButton> myDesserts(BuildContext buildContext) {
    return desserts.map((Dessert d) => DessertButton(
      text : d.title,
      onPressed: () async {
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => MyForm(kkal: d.calories, title: d.title,)));
      },
    ),).toList();
  }

  // Widget _buildContent() {
  //   return Container(
  //     color: Colors.grey[300],
  //     padding: EdgeInsets.all(16.0),
  //     child: Column(
  //       mainAxisAlignment: MainAxisAlignment.center,
  //       crossAxisAlignment: CrossAxisAlignment.stretch,
  //       children: <Widget>[
  //         //это кучка виджетов
  //         //_Dessert(),
  //       ],
  //     ),
  //   );
  // }

  List<Dessert> desserts = [
    Dessert(title: "Tea (with sugar)", calories: 28),
    Dessert(title: "Coffee (with sugar)", calories: 62),
    Dessert(title: "Cake 'Napoleon'", calories: 413),
    Dessert(title: "Cake 'Medovic'", calories: 478),
    Dessert(title: "Apple pie", calories: 370),
    Dessert(title: "Cheesecake", calories: 240),
    Dessert(title: "Macarons", calories: 500),
    Dessert(title: "Eclair (with cream)", calories: 439),
    Dessert(title: "Chokopie", calories: 430),
    Dessert(title: "cake 'patato'", calories: 392),
    Dessert(title: "Cherry pie McDonald's", calories: 230),
    Dessert(title: "Pancakes with cheese", calories: 382),
    Dessert(title: "Pancakes with sour cream", calories: 311),
    Dessert(title: "Pancakes with condensed milk", calories: 28),
  ];
}


