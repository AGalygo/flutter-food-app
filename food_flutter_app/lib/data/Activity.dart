import 'dart:convert';

class Activity {
  int id;
  String title;
  int calories;

  Activity(this.id, this.title, this.calories);


  Map<String, dynamic> toMap(bool forUpdate) {
    var data = {
//      'id': id,  since id is auto incremented in the database we don't need to send it to the insert query.
      'title': utf8.encode(title),
      'calories': calories,
    };
    if(forUpdate){  data["id"] = this.id;  }
    return data;
  }

// Converting the date time object into int representing seconds passed after midnight 1st Jan, 1970 UTC
  int epochFromDate(DateTime dt) {  return dt.millisecondsSinceEpoch ~/ 1000; }

}