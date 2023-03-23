import 'dart:convert';

import 'package:flutter_quill/flutter_quill.dart';

class Note {
  final String id;
  final List<dynamic> data;
  Document? document;
  Note({
    required this.id,
    this.data = const [
      {"insert": "\n"}
    ],
    this.document,
  }) {
    document ??= Document.fromJson(data);
  }

  Note copyWith({
    String? id,
    List<dynamic>? data,
    Document? document,
  }) {
    return Note(
      id: id ?? this.id,
      data: data ?? this.data,
      document: document ?? this.document,
    );
  }

  Map<String, dynamic> toMap() {
    final result = <String, dynamic>{};

    result.addAll({'id': id});
    result.addAll({'data': data});

    return result;
  }

  factory Note.fromMap(Map<String, dynamic> map) {
    return Note(
      id: map['id'],
      data: List<dynamic>.from(map['data']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Note.fromJson(String source) => Note.fromMap(json.decode(source));
}
