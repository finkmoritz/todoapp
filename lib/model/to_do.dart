class ToDo {
  ToDo({this.title, this.completed = false});

  String title;
  bool completed;

  factory ToDo.fromJson(Map<String, dynamic> json) {
    return ToDo(
      title: json['title'],
      completed: json['completed'],
    );
  }
}
