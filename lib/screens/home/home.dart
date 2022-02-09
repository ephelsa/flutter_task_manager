import 'package:flutter/material.dart';
import 'package:task_manager/screens/home/section/pills_section.dart';
import 'package:task_manager/screens/home/section/section_content.dart';
import 'package:task_manager/widgets/circular_button_icon.dart';

/// [HomeScreen] contains these bunch of widgets:
/// - [x] Today section
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
          slivers: [
            _buildAppBar(context),
            _buildHeader(context),
            _buildSectionContent(context),
          ],
        ),
      ),
    );
  }

  /// TODO
  Widget _buildAppBar(BuildContext context) {
    return SliverAppBar(
      backgroundColor: Colors.white,
      floating: true,
      elevation: 1,

      /// Menu button
      /// [CircularIconButton] needs to be inside a [Container]. For some reason
      /// the icon here is moved to the bottom right corner.
      leading: Container(
        alignment: Alignment.center,
        child: CircularIconButton(
          radius: 20,
          onPressed: () {
            // TODO: Navigation action for the drawer
          },
          child: const Icon(
            Icons.grid_view_rounded,
          ),
        ),
      ),

      /// Title
      title: Text(
        'Task Manager',
        style: Theme.of(context)
            .textTheme
            .subtitle1
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      actions: [
        /// Notification Button
        CircularIconButton(
          backgroundColor: Colors.transparent,
          onPressed: () {
            // TODO: Add action for notifications button
          },
          child: Stack(
            alignment: Alignment.center,
            children: const [
              Icon(
                Icons.notifications_rounded,
                color: Colors.black,
              ),
              Padding(
                padding: EdgeInsets.only(left: 10.0, bottom: 8.0),
                child: CircleAvatar(
                  radius: 4.0,
                  backgroundColor: Colors.red,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  /// TODO
  Widget _buildHeader(BuildContext context) {
    return SliverToBoxAdapter(
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 18.0),
        color: Colors.white,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Greeting messages
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

                /// Search Button
                CircularIconButton(
                  radius: 25,
                  child: const Icon(
                    Icons.search,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    // TODO: Search action
                  },
                ),
              ],
            ),
            const Padding(
              padding: EdgeInsets.only(top: 18.0),
              child: PillsSection(),
            ),
          ],
        ),
      ),
    );
  }

  /// TODO
  Widget _buildSectionContent(BuildContext context) {
    return const SliverToBoxAdapter(
      child: SectionContent(),
    );
  }
}
