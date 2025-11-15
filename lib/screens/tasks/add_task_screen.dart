import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../controllers/task_controller.dart';
import '../../../data/models/task_model.dart';

class AddTaskScreen extends StatelessWidget {
  final title = TextEditingController();
  final description = TextEditingController();
  final TaskController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Task")),
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
                final task = TaskModel(
                  title: title.text,
                  description: description.text,
                  date: DateTime.now().toString(),
                );
                controller.addTask(task);
                Get.back();
              },
              child: const Text("Save"),
            )
          ],
        ),
      ),
    );
  }
}
