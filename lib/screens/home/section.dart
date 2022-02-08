import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

/// TODO
enum HomeSection { today, upcoming, taskDone }

/// TODO
class Section extends ChangeNotifier {
  static const Map<HomeSection, String> sections = {
    HomeSection.today: 'Today',
    HomeSection.upcoming: 'Upcoming',
    HomeSection.taskDone: 'Task Done',
  };
  HomeSection _currentSection = HomeSection.today;

  HomeSection get currentSection => _currentSection;

  void selectSection(HomeSection newSection) {
    _currentSection = newSection;
    notifyListeners();
  }
}

/// TODO
class PillButton extends StatelessWidget {
  const PillButton({
    Key? key,
    required this.text,
    required this.isSelected,
    required this.onTap,
  }) : super(key: key);

  final String text;
  final VoidCallback onTap;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    final backgroundColor = MaterialStateProperty.all<Color?>(
      isSelected ? Colors.black : Colors.white,
    );
    final textColor = isSelected ? Colors.white : Colors.black;

    return TextButton(
      onPressed: onTap,
      style: ButtonStyle(
        overlayColor: MaterialStateProperty.all(Colors.grey[800]),
        backgroundColor: backgroundColor,
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18.0),
          ),
        ),
      ),
      child: Text(
        text,
        style: Theme.of(context).textTheme.button?.copyWith(color: textColor),
      ),
    );
  }
}

/// TODO
class PillsSection extends StatelessWidget {
  const PillsSection({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Section sectionState = Provider.of<Section>(context);

    return Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: Section.sections.keys.map((section) {
          return Expanded(
            child: PillButton(
              onTap: () {
                sectionState.selectSection(section);
              },
              text: Section.sections[section]!,
              isSelected: section == sectionState._currentSection,
            ),
          );
        }).toList());
  }
}
