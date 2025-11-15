import 'package:sqflite/sqflite.dart';
import '../database/task_db.dart';
import '../models/task_model.dart';

class TaskRepository {
  Future<int> addTask(TaskModel task) async {
    final db = await TaskDB.database;
    return await db.insert("tasks", task.toMap());
  }

  Future<List<TaskModel>> fetchTasks() async {
    final db = await TaskDB.database;
    final data = await db.query("tasks", orderBy: "id DESC");
    return data.map((e) => TaskModel.fromMap(e)).toList();
  }

  Future<int> updateTask(TaskModel task) async {
    final db = await TaskDB.database;
    return await db.update(
      "tasks",
      task.toMap(),
      where: "id = ?",
      whereArgs: [task.id],
    );
  }

  Future<int> deleteTask(int id) async {
    final db = await TaskDB.database;
    return await db.delete("tasks", where: "id = ?", whereArgs: [id]);
  }
}
