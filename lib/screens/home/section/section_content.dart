import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:task_manager/screens/home/section/section.dart';
import 'package:task_manager/screens/home/section/today.dart';

/// TODO
class SectionContent extends StatelessWidget {
  const SectionContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Section sectionState = Provider.of<Section>(context);

    return Container(
      child: sectionState.currentSection == HomeSection.today
          ? const TodaySection()
          : null,
    );
  }
}
