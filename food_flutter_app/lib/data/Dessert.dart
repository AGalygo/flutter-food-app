
final String tableDesserts = 'Desserts';
final String columnId = '_id';
final String columnTitle = 'title';
final String columnCalories = 'calories';

class Dessert {
  int id;
  String title;
  int calories;

  Dessert({this.id, this.title, this.calories});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      columnId: id,
      columnTitle: title,
      columnCalories: calories
    };
  }

  Dessert.fromMap(Map<String, dynamic> map) {
    id = map[columnId];
    title = map[columnTitle];
    calories = map[columnCalories];
  }
}