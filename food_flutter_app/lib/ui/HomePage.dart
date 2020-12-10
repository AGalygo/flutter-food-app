import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter_app/data/Dessert.dart';
import 'package:food_flutter_app/data/database_provider.dart';
import 'package:food_flutter_app/ui/AddDessert.dart';
import 'package:food_flutter_app/ui/DessertButton.dart';
import 'package:food_flutter_app/ui/MyForm.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;


  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  List<Dessert> _dessertItems;

  @override
  void initState() {
    super.initState();

    _dessertItems =[];
    DatabaseProvider().openDessertsDatabase().then((_) => {
      DatabaseProvider().getDesserts().then((dessertItems) {
        setState(() {
          _dessertItems = dessertItems;
        });
      })
    });
  }

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

      body: ListView(
        children: myDesserts(context),
      ),
      backgroundColor: Colors.pink[50],
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          print("перехожу на форму добавления");
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddDessert(),),);
        },
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }


  List<DessertButton> myDesserts(BuildContext buildContext) {
    return _dessertItems.map((Dessert d) => DessertButton(
      text : d.title,
      onPressed: () async {
        print("открываю дессерт");
        Navigator.push(context, MaterialPageRoute(
            builder: (context) => MyForm(kkal: d.calories, title: d.title,)));
      },
    ),).toList();
  }

}


