class TaskModel {
  int? id;
  String title;
  String description;
  String date;
  int isCompleted;

  TaskModel({
    this.id,
    required this.title,
    required this.description,
    required this.date,
    this.isCompleted = 0,
  });

  factory TaskModel.fromMap(Map<String, dynamic> map) {
    return TaskModel(
      id: map['id'],
      title: map['title'],
      description: map['description'],
      date: map['date'],
      isCompleted: map['isCompleted'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      "id": id,
      "title": title,
      "description": description,
      "date": date,
      "isCompleted": isCompleted,
    };
  }
}
