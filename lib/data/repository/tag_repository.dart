import 'package:task_manager/models/tag.dart';

abstract class TagRepository {
  Future<Tag?> fetchTagById(int id);
}

class TagRepositoryFake extends TagRepository {
  final Map<int, Tag> _tags = const {
    0: Tag(id: 0, title: 'School'),
    1: Tag(id: 1, title: 'Everyday'),
    2: Tag(id: 2, title: 'Works'),
    3: Tag(id: 3, title: 'Activity'),
    4: Tag(id: 4, title: 'Lifestyle'),
    5: Tag(id: 5, title: 'Home'),
  };

  @override
  Future<Tag?> fetchTagById(int id) async {
    return Future.delayed(const Duration(milliseconds: 100), () {
      return _tags[id];
    });
  }
}
