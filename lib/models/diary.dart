import 'dart:convert';

class Diary {
  final String text;
  final String whenCreated;
  final String id;
  Diary({
    required this.text,
    required this.whenCreated,
    required this.id,
  });

  Diary copyWith({
    String? text,
    String? whenCreated,
    String? id,
  }) {
    return Diary(
      text: text ?? this.text,
      whenCreated: whenCreated ?? this.whenCreated,
      id: id ?? this.id,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'text': text});
    result.addAll({'whenCreated': whenCreated});
    result.addAll({'id': id});

    return result;
  }

  factory Diary.fromMap(Map<String, dynamic> map) {
    return Diary(
      text: map['text'] ?? '',
      whenCreated: map['whenCreated'] ?? '',
      id: map['id'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Diary.fromJson(String source) => Diary.fromMap(json.decode(source));
}
