import 'package:flutter/material.dart';

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
