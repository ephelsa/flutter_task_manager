import 'package:task_manager/models/tag.dart';

/// TODO
class TaskPreview {
  const TaskPreview({
    required this.tags,
    required this.title,
    required this.calendar,
    required this.schedule,
    required this.color,
  });

  final List<Tag> tags;
  final String title;
  final String calendar;
  final String schedule;
  final int color;
}
