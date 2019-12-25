class TodoModel {
  int id;
  String title;
  bool checked;

  TodoModel({this.id, this.title, this.checked = false});

  factory TodoModel.fromJson(Map json) {
    return TodoModel(
        id: json['id'], title: json['title'], checked: json['checked']);
  }

  toJson() {
    return {"title": title, "checked": checked};
  }
}
