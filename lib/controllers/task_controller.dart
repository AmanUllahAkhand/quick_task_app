import 'package:get/get.dart';
import '../data/models/task_model.dart';
import '../data/repositories/task_repository.dart';

class TaskController extends GetxController {
  final TaskRepository repo = TaskRepository();
  RxList<TaskModel> tasks = <TaskModel>[].obs;

  @override
  void onInit() {
    loadTasks();
    super.onInit();
  }

  Future<void> loadTasks() async {
    final data = await repo.fetchTasks();
    tasks.assignAll(data);
  }

  Future<void> addTask(TaskModel task) async {
    await repo.addTask(task);
    await loadTasks();
  }

  Future<void> updateTask(TaskModel task) async {
    await repo.updateTask(task);
    await loadTasks();
  }

  Future<void> deleteTask(int id) async {
    await repo.deleteTask(id);
    await loadTasks();
  }

  void toggleComplete(TaskModel task) {
    task.isCompleted = task.isCompleted == 1 ? 0 : 1;
    updateTask(task);
  }
}
