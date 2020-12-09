import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Activity {
  Activity({this.title, this.calories, this.icon}); // kkal/min

  final String title;
  final double calories;
  final Icon icon;
}

class YourActivity extends StatefulWidget {

  final double dessertCalories;
  const YourActivity({Key key, @required this.dessertCalories}) : super(key: key);

  @override
  _YourActivityState createState() => _YourActivityState();
}

class _YourActivityState extends State<YourActivity> {

  static const platform = MethodChannel("main_act");

  void _startAbout() async {
    try {
      await platform.invokeMethod("startAbout");
    } on PlatformException catch(e) {
      print(e.message);
    }
  }

  @override
  void initState() {
    super.initState();
    print("${widget.dessertCalories}");
  }

  String _calculateDuration(double activityCalories ) {
    double sum = (widget.dessertCalories/activityCalories).roundToDouble();
    return "duration is "+ sum.toString() +" min";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "To spend calories, you can choose:",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 15.0,
            color: Colors.pink[50],
            fontWeight: FontWeight.w800,
          ),
        ),
      ),

      //body: _buildContent(),
      body: Container(
        color: Colors.pink[50],
        child: ListView(
          children: myActivities(context),
        ),
      ),
      floatingActionButton: FloatingActionButton(
      onPressed: _startAbout,
      tooltip: 'Increment',
      child: Icon(Icons.star_border),
    ),
    );
  }

  List<ListTile> myActivities(BuildContext buildContext) {
    return activities.map((Activity d) => ListTile(
      tileColor: Colors.pink[50],
      contentPadding: EdgeInsets.only(top: 10, left: 45, bottom: 0, right: 0),
      leading: d.icon,
      title: Text(d.title),
      subtitle: Text(_calculateDuration(d.calories)),
    ),).toList();
  }


  List<Activity> activities = [
    Activity(title: "Morning exercise", calories: 1.53, icon: Icon(Icons.accessibility_new)),
    Activity(title: "Fitness", calories: 4.95, icon: Icon(Icons.fitness_center)),
    Activity(title: "Yoga", calories: 3.8, icon: Icon(Icons.self_improvement)),
    Activity(title: "Run", calories: 5.7, icon: Icon(Icons.directions_run)),
    Activity(title: "Walk", calories: 2.6, icon: Icon(Icons.directions_walk)),
    Activity(title: "Yoga", calories: 3.8, icon: Icon(Icons.self_improvement)),
    Activity(title: "Flying", calories: 0.9, icon: Icon(Icons.airplanemode_active)),
    Activity(title: "Sleeping", calories: 0.4, icon: Icon(Icons.hotel)),
    Activity(title: "Passionate kiss", calories: 0.8, icon: Icon(Icons.wc)),
    Activity(title: "Work at the computer", calories: 0.97, icon: Icon(Icons.pest_control_rodent_outlined)),
    Activity(title: "Shopping", calories: 2.0, icon: Icon(Icons.shopping_cart)),
    Activity(title: "Dancing", calories: 3.8, icon: Icon(Icons.campaign)),
  ];
}