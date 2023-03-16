import 'package:flutter_quill/flutter_quill.dart';

class Note {
  final int id;
  final List<dynamic> data;
  final Document document;
  Note({
    required this.id,
    this.data = const [
      {"insert": "\n"}
    ],
  }) : document = Document.fromJson(data);

  Note copyWith({
    int? id,
    List<dynamic>? data,
    Document? document,
  }) {
    return Note(
      id: id ?? this.id,
      data: data ?? this.data,
    );
  }
}
