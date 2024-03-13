class NoteMode {
  int? id;
  String? title;
  String? content;
  String? createAt;
  NoteMode({this.id, this.title, this.content, this.createAt});
  factory NoteMode.fromLocalDatabaseMap(Map<String, dynamic> json) {
    return NoteMode(
      id: json['id'],
      title: json['title'],
      content: json['content'],
      createAt: json['createAt'],
    );
  }
  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'content': content,
        'createAt': createAt,
      };
  static NoteMode fromJsonModel(Map<String, dynamic> json) =>
      NoteMode.fromLocalDatabaseMap(json);
}
