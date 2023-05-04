import 'dart:html';

class Diary {
  final String month;
  final int day;
  final int year;
  final String id;
  final List<dynamic> data;
  Document? document;
  Diary({
    required this.month,
    required this.day,
    required this.year,
    required this.id,
    required this.data,
    this.document,
  });
}
