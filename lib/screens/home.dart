import 'package:flutter/material.dart';

/// [HomeScreen] contains these bunch of widgets:
/// - [ ] Greetings, updates and search
/// - [ ] Pill buttons for sections: Today, Upcoming and Task Done.
/// - [ ] Today section
/// - [ ] Upcoming section
/// - [ ] Task done section
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  static const routePath = '/';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 14.0),
        child: CustomScrollView(
          slivers: [_buildAppBar(context), _buildContent(context)],
        ),
      ),
    );
  }

  /// Adds a toolbar with a menu, title and notifications.
  /// TODO: Add a context/handle the state for notifications.
  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      leading: ClipOval(
        child: Material(
          color: Colors.transparent,
          child: IconButton(
            onPressed: () {
              // TODO: Add action for menu button
            },
            icon: const CircleAvatar(
              child: Icon(Icons.grid_view_rounded),
            ),
          ),
        ),
      ),
      title: Text(
        'Task Manager',
        style: Theme.of(context)
            .textTheme
            .subtitle1
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [
        Stack(
          alignment: Alignment.center,
          children: [
            ClipOval(
              child: Material(
                color: Colors.transparent,
                child: IconButton(
                  onPressed: () {
                    // TODO: Add action for notifications button
                  },
                  icon: const Icon(
                    Icons.notifications_rounded,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(left: 10.0, bottom: 8.0),
              child: CircleAvatar(
                radius: 4.0,
                backgroundColor: Colors.red,
              ),
            )
          ],
        )
      ],
    );
  }

  /// Adds the content of the page - the greetings and search button, pill buttons
  /// per section and content of each section.
  Widget _buildContent(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back!',
                  style: Theme.of(context).textTheme.subtitle1,
                ),
                Text(
                  'Here\'s Update Today.',
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
            ElevatedButton(
              onPressed: () {
                // TODO
              },
              child: const Icon(Icons.search),
              style: ElevatedButton.styleFrom(
                fixedSize: const Size(50, 50),
                shape: const CircleBorder(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
