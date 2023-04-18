import 'dart:convert';

class ToDo {
  final String whenCreated;
  final String text;
  final String id;
  late bool isCompleted;
  ToDo({
    required this.whenCreated,
    required this.text,
    required this.id,
    required this.isCompleted,
  });

  ToDo copyWith({
    String? whenCreated,
    String? text,
    String? id,
    bool? isCompleted,
  }) {
    return ToDo(
      whenCreated: whenCreated ?? this.whenCreated,
      text: text ?? this.text,
      id: id ?? this.id,
      isCompleted: isCompleted ?? this.isCompleted,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};
    result.addAll({'id': id});
    result.addAll({'whenCreated': whenCreated});
    result.addAll({'text': text});
    result.addAll({'isCompleted': isCompleted});

    return result;
  }

  String toJson() => json.encode(toMap());

  static ToDo fromJson(String jsonStr) {
    final myMap = jsonDecode(jsonStr);
    return ToDo(
      id: myMap["id"],
      whenCreated: myMap["whenCreated"],
      text: myMap["text"],
      isCompleted: myMap["isCompleted"],
    );
  }

  factory ToDo.fromMap(Map<String, dynamic> map) {
    return ToDo(
      id: map['id'] ?? '',
      whenCreated: map['whenCreated'] ?? '',
      text: map['text'] ?? '',
      isCompleted: map['isCompleted'] ?? false,
    );
  }
}
