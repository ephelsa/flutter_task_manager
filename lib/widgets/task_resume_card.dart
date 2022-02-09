import 'package:flutter/material.dart';
import 'package:task_manager/models/task_preview.dart';
import 'package:task_manager/widgets/outlined_pill_button.dart';

/// TODO
class TaskResumeCard extends StatelessWidget {
  const TaskResumeCard(
    this.taskPreview, {
    Key? key,
    required this.onEdit,
    required this.onComplete,
  }) : super(key: key);

  final TaskPreview taskPreview;
  final VoidCallback onEdit;
  final VoidCallback onComplete;

  Color get backgroundColor => Colors.black;

  Color get foregroundColor => Color(taskPreview.color);

  @override
  Widget build(BuildContext context) {
    final Widget title = Container(
      alignment: Alignment.topLeft,
      child: Text(
        taskPreview.title,
        style: Theme.of(context)
            .textTheme
            .headline6
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );

    return SizedBox(
      height: 180,
      child: Card(
        color: foregroundColor,
        elevation: 0.0,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16.0),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(
            vertical: 16.0,
            horizontal: 20.0,
          ),
          child: Column(
            children: [
              Flexible(child: _buildHeader(context)),
              Flexible(child: title),
              Flexible(child: _buildFooter(context)),
            ],
          ),
        ),
      ),
    );
  }

  /// TODO
  Widget _buildHeader(BuildContext context) {
    final Widget tags = Row(
      children: taskPreview.tags.take(2).map((tag) {
        return Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(right: 8.0),
          child: OutlinedPillButton(
            borderColor: backgroundColor,
            text: tag.title,
          ),
        );
      }).toList(),
    );

    return Stack(
      children: [
        Positioned(
          left: 0,
          top: 0,
          child: tags,
        ),

        /// Edit Button
        Positioned(
          right: 0,
          top: 0,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(4.0),
            child: Material(
              color: backgroundColor,
              child: InkWell(
                onTap: onEdit,
                child: Padding(
                  child: Icon(
                    Icons.edit,
                    color: foregroundColor,
                    size: 14,
                  ),
                  padding: const EdgeInsets.all(4.0),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }

  /// TODO
  Widget _buildFooter(BuildContext context) {
    final TextStyle? textStyle = Theme.of(context)
        .textTheme
        .caption
        ?.copyWith(fontWeight: FontWeight.w600);

    const double iconSize = 15;

    final Widget date = Row(
      children: [
        const Icon(
          Icons.date_range,
          size: iconSize,
        ),
        Text(
          taskPreview.calendar,
          style: textStyle,
        ),
      ],
    );

    final Widget schedule = Row(
      children: [
        const Icon(
          Icons.schedule,
          size: iconSize,
        ),
        Text(
          taskPreview.schedule,
          style: textStyle,
        ),
      ],
    );

    return Stack(
      children: [
        /// Left content
        Positioned(
          left: 0,
          bottom: 0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              date,
              schedule,
            ],
          ),
        ),

        /// Right content
        Positioned(
          right: 0,
          bottom: 0,
          child: InkWell(
            borderRadius: BorderRadius.circular(360),
            onTap: onComplete,
            child: const Icon(
              Icons.circle_outlined,
              size: 35,
            ),
          ),
        )
      ],
    );
  }
}
