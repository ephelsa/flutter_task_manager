import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/screens/home/section/section.dart';
import 'package:task_manager/widgets/pill_button.dart';

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
            isSelected: section == sectionState.currentSection,
          ),
        );
      }).toList(),
    );
  }
}
