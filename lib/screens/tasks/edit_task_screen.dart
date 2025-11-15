import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/task_controller.dart';
import '../../../data/models/task_model.dart';

class EditTaskScreen extends StatelessWidget {
  final TaskModel task;
  EditTaskScreen({required this.task});

  final TaskController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    final title = TextEditingController(text: task.title);
    final description = TextEditingController(text: task.description);

    return Scaffold(
      appBar: AppBar(title: const Text("Edit Task")),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextField(
              controller: title,
              decoration: const InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: description,
              decoration: const InputDecoration(labelText: "Description"),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                final updatedTask = TaskModel(
                  id: task.id,
                  title: title.text,
                  description: description.text,
                  date: task.date,
                  isCompleted: task.isCompleted,
                );

                controller.updateTask(updatedTask);
                Get.back();
              },
              child: const Text("Update"),
            )
          ],
        ),
      ),
    );
  }
}
