import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter_app/data/Dessert.dart';
import 'package:food_flutter_app/data/database_provider.dart';

import 'HomePage.dart';

class AddDessert extends StatefulWidget {

  @override
  State<StatefulWidget> createState() => AddDessertState();
}

class AddDessertState extends State<AddDessert> {
  final _formKey = GlobalKey<FormState>();
  String _title;
  int _calories;

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

      body: _buildContext(context),
    );
  }

  Widget _buildContext(BuildContext context) {
    return SingleChildScrollView(
      child: Stack(
        children: <Widget>[
      Container(
      color: Colors.pink[50],
        padding: EdgeInsets.all(45.0),
        child: Column(
          //mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Text(
              "Enter new dessert",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.brown,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 30.0,
            ),
            new Form(
                key: _formKey,
                child: new Column(
                  children: <Widget>[
                    new Text(
                      'Input title of your dessert:',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.brown,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    new TextFormField(
                      validator: (String value) {
                        String title;
                        if ( title == '') {
                          return 'Please, enter a title of your dessert';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        _title = value;
                      },
                    ),
                    new SizedBox(
                      height: 15.0,
                    ),
                    new Text(
                      'Input calories of 100g of your dessert:',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.brown,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    new TextFormField(
                      validator: (String value) {
                        int calories = int.tryParse(value);
                        if ( calories == null || calories<0) {
                          return 'Please, enter a correct number';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        _calories = int.tryParse(value);
                      },
                    ),
                    new SizedBox(height: 20.0),
                    new RaisedButton(
                      onPressed: () async {
                        if(!_formKey.currentState.validate()) {
                          print("что то неправильно ввели...");
                          return;
                        }
                        else {
                          _formKey.currentState.save();
                          DatabaseProvider().saveDessert(new Dessert(id: _dessertItems.length, title: _title, calories: _calories));
                          Navigator.push(context, MaterialPageRoute(builder: (context) => HomePage(),),);
                          //Navigator.push(context, MaterialPageRoute(
                          //    builder: (context) => YourActivity( dessertCalories: calculateCalories(_weight, widget.kkal),)));
                        }
                      },
                      child: Text('Save'),
                      color: Colors.brown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      textColor: Colors.pink[50],
                    ),
                    SizedBox(
                      height: 250,
                    )
                  ],
                )),
          ],
        ),
      ),
        ],
      ),
    );
  }
}
