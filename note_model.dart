class NoteModel {
  final int? id;
  final String title;
  final String content;

  NoteModel({
    this.id,
    required this.title,
    required this.content,
  });

  factory NoteModel.fromMap(Map<String, dynamic> data) {
    return NoteModel(
      id: data['id'],
      title: data['title'],
      content: data['content'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'content': content,
    };
  }
}
