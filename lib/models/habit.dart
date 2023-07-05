import 'dart:convert';

class Habit {
  int timeSpent;
  int timeGoal;
  bool habitStarted;
  final String habitTile;
  String id;

  Habit(
    this.timeSpent,
    this.timeGoal,
    this.habitStarted,
    this.habitTile,
    this.id,
  );

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'timeSpent': timeSpent});
    result.addAll({'timeGoal': timeGoal});
    result.addAll({'habitStarted': habitStarted});
    result.addAll({'habitTile': habitTile});
    result.addAll({'id': id});

    return result;
  }

  factory Habit.fromMap(Map<String, dynamic> map) {
    return Habit(
      map['timeSpent']?.toInt() ?? 0,
      map['timeGoal']?.toInt() ?? 0,
      map['habitStarted'] ?? false,
      map['habitTile'] ?? '',
      map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Habit.fromJson(String source) => Habit.fromMap(json.decode(source));
}
