import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_flutter_app/ui/YourActivities.dart';

class MyForm extends StatefulWidget {
  final int kkal;
  final String title;

  const MyForm({Key key, this.kkal, this.title}) : super(key: key);
  @override
  State<StatefulWidget> createState() => MyFormState();
}

class MyFormState extends State<MyForm> {
  final _formKey = GlobalKey<FormState>();
  int _weight;

  @override
  void initState() {
    super.initState();
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

  double calculateCalories(int massa, int kkal) {
    return (massa/100)*kkal;
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
              "Your dessert is "+ widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                color: Colors.brown,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(
              height: 20.0,
            ),
            Text(
              "Calorie content: 100g - " + widget.kkal.toString() + " kkal",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 12.0,
                color: Colors.brown,
                fontWeight: FontWeight.w300,
              ),
            ),
            SizedBox(height: 60.0),
            new Form(
                key: _formKey,
                child: new Column(
                  children: <Widget>[
                    new Text(
                      'Input weight of your dessert (g)',
                      style: TextStyle(
                        fontSize: 16.0,
                        color: Colors.brown,
                        fontWeight: FontWeight.w300,
                      ),
                    ),
                    new TextFormField(
                      validator: (String value) {
                        int massa = int.tryParse(value);
                        if ( massa == null || massa<0) {
                          print("что то неправильно ввели...");
                          return 'Please, enter a correct number';
                        }
                        return null;
                      },
                      onSaved: (String value) {
                        _weight = int.tryParse(value);
                      },
                    ),
                    new SizedBox(height: 20.0),
                    new RaisedButton(
                      onPressed: () async {
                        if(!_formKey.currentState.validate()) {
                          return;
                        }
                        else {
                          _formKey.currentState.save();
                          print("ура, вывелись активности");
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context) => YourActivity( dessertCalories: calculateCalories(_weight, widget.kkal),)));
                        }
                      },
                      child: Text('See activities!'),
                      color: Colors.brown,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8.0)),
                      ),
                      textColor: Colors.pink[50],
                    ),
                    SizedBox(
                      height: 300,
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
