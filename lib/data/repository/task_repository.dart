import 'package:task_manager/models/tag.dart';
import 'package:task_manager/models/task_preview.dart';

abstract class TaskRepository {
  const TaskRepository();

  Future<List<TaskPreview>> fetchTaskPreviewForToday();
}

class TaskRepositoryFake extends TaskRepository {
  const TaskRepositoryFake() : super();

  @override
  Future<List<TaskPreview>> fetchTaskPreviewForToday() async {
    return await Future.delayed(
      const Duration(seconds: 1),
      () async {
        return <TaskPreview>[
          const TaskPreview(
            tags: [
              Tag(id: 0, title: 'School'),
              Tag(id: 1, title: 'Everyday'),
            ],
            title: "Taking My Sister To School",
            calendar: "12 October 2021",
            schedule: "7:30 (Remind At 07:15)",
            color: 0xff59edcf,
          ),
          const TaskPreview(
            tags: [
              Tag(id: 2, title: 'Works'),
              Tag(id: 3, title: 'Activity'),
            ],
            title: "Create A Banner In Canvas",
            calendar: "12 October 2021",
            schedule: "10:00",
            color: 0xfff9e031,
          ),
          const TaskPreview(
            tags: [
              Tag(id: 2, title: 'Lifestyle'),
              Tag(id: 3, title: 'Home'),
            ],
            title: "Buying Home Utensils",
            calendar: "12 October 2021",
            schedule: "14:15 (Remind at 14:00)",
            color: 0xff56d0ed,
          ),
        ];
      },
    );
  }
}
