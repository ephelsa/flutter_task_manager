import 'package:flutter/material.dart';
import 'package:task_manager/data/repository/task_repository.dart';
import 'package:task_manager/models/task_preview.dart';
import 'package:task_manager/widgets/task_resume_card.dart';

/// TODO
class TodaySection extends StatelessWidget {
  const TodaySection({
    Key? key,
    // Helpfully for testing
    this.taskRepository = const TaskRepositoryFake(),
  }) : super(key: key);

  final TaskRepository taskRepository;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<TaskPreview>>(
      future: taskRepository.fetchTaskPreviewForToday(),
      builder: (context, snapshot) {
        return snapshot.hasData
            ? Column(
                children: _buildCards(snapshot.requireData),
              )
            : Container();
      },
    );
  }

  List<Widget> _buildCards(List<TaskPreview> tasks) {
    return tasks.map((task) {
      return TaskResumeCard(
        task,
        onComplete: () {
          // TODO: Define actions.
        },
        onEdit: () {
          // TODO: Define actions.
        },
      );
    }).toList();
  }
}
