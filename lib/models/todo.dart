class ToDo {
  final String whenCreated;
  final String text;
  final String id;
  final bool isCompleted;
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
}
