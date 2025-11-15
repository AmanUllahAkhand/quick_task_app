import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/task_controller.dart';
import '../../../data/models/task_model.dart';
import 'add_task_screen.dart';
import 'edit_task_screen.dart';

class TasksScreen extends StatelessWidget {
  final TaskController controller = Get.put(TaskController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Tasks")),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => AddTaskScreen()),
        child: const Icon(Icons.add),
      ),
      body: Obx(() {
        if (controller.tasks.isEmpty) {
          return const Center(child: Text("No tasks added yet"));
        }

        return ListView.builder(
          itemCount: controller.tasks.length,
          itemBuilder: (_, index) {
            final task = controller.tasks[index];

            return ListTile(
              title: Text(task.title),
              subtitle: Text(task.description),
              leading: Checkbox(
                value: task.isCompleted == 1,
                onChanged: (v) => controller.toggleComplete(task),
              ),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    icon: const Icon(Icons.edit),
                    onPressed: () =>
                        Get.to(() => EditTaskScreen(task: task)),
                  ),
                  IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => controller.deleteTask(task.id!),
                  ),
                ],
              ),
            );
          },
        );
      }),
    );
  }
}
