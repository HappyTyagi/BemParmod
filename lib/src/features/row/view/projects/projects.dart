import 'package:bem/src/components/appbar/appbar.dart';
import 'package:bem/src/components/divider/divider.dart';
import 'package:bem/src/components/header/header.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/view/all_projects/all_projects.dart';
import 'package:bem/src/features/row/view/downloaded_projects/downloaded_projects.dart';
import 'package:bem/src/features/row/view/drawer/drawer_menu.dart';
import 'package:bem/src/features/row/view/projects/projects_tabBar.dart';
import 'package:flutter/material.dart';

class Projects extends StatefulWidget {
  const Projects({super.key});

  @override
  State<Projects> createState() => _ProjectsState();
}

class _ProjectsState extends State<Projects> with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController _controller;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _controller = TabController(length: 2, vsync: this);
    _controller.addListener(() {
      // Updates the selected index when the tab changes
      setState(() {
        _selectedIndex = _controller.index;
      });
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      // Applies a background image decoration
      decoration: backgroundImageDecoration(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: transparent,
        // Custom app bar setup
        appBar: getAppBar(context, scaffoldKey, title: ""),
        // Drawer menu widget
        drawer: const DrawerMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Adds vertical space
            addVerticalSpace(40),
            // Header view creation
            headerView(context, projects, dashboardDescription),
            // Tab bar for projects
            projectTabBar(context, _controller, _selectedIndex),
            // Adds vertical space
            addVerticalSpace(16),
            // Adds a horizontal divider
            addHorizontalDivider(),
            Expanded(
              child: TabBarView(
                controller: _controller,
                // Tab views for projects
                children: const [
                  //All projects tab
                  AllProjects(),
                  //Downloaded projects tab
                  DownloadedProjects()
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
