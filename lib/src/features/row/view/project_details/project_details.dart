import 'package:bem/src/components/appbar/appbar.dart';
import 'package:bem/src/components/divider/divider.dart';
import 'package:bem/src/components/header/header.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/view/all_parcels/all_parcels_tab.dart';
import 'package:bem/src/features/row/view/downloaded_parcels/downloaded_parcels.dart';
import 'package:bem/src/features/row/view/drawer/drawer_menu.dart';
import 'package:bem/src/features/row/view/project_details/project_details_tabbar.dart';
import 'package:flutter/material.dart';

class ProjectDetails extends StatefulWidget {
  const ProjectDetails({super.key});

  @override
  State<ProjectDetails> createState() => _ProjectDetailsState();
}

class _ProjectDetailsState extends State<ProjectDetails> with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  late TabController _tabController;
  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(() {
      setState(() {
        _selectedIndex = _tabController.index;
      });
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: backgroundImageDecoration(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: transparent,
        appBar: getAppBar(context, scaffoldKey, title: ""),
        drawer: const DrawerMenu(),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addVerticalSpace(40),
            headerView(context, "Project # 218039", parcelDescription),
            projectDetailsTabBar(context, _tabController, _selectedIndex),
            addHorizontalDivider(),
            Expanded(
              child: TabBarView(controller: _tabController, children: const [AllParcelsTab(), DownloadedParcel()]),
            ),
          ],
        ),
      ),
    );
  }
}
