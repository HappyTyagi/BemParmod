import 'package:bem/src/components/decorations/decorations.dart';
import 'package:flutter/material.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/text_strings.dart';

TabBar parcelDetailsTabBar(TabController tabController, int selectedIndex) {
  return TabBar(
    isScrollable: true,
    controller: tabController,
    indicator: lightBlueBorder(),
    labelColor: color3A71FF,
    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
    tabs: [
      Tab(
        child: Container(
            padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
            child: Row(
              children: [
                Image(
                  image: const AssetImage('assets/images/project_menu.png'),
                  height: 20,
                  width: 20,
                  color: selectedIndex == 0 ? color3A71FF : colorE2E2E2,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Text(overall),
                ),
              ],
            )),
      ),
      Tab(
        child: Container(
            padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
            child: Row(
              children: [
                Image(
                  image: const AssetImage('assets/images/notification_document.png'),
                  height: 20,
                  width: 20,
                  color: selectedIndex == 1 ? color3A71FF : colorE2E2E2,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Text(documents),
                ),
              ],
            )),
      ),
      Tab(
        child: Container(
            padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
            child: Row(
              children: [
                Image(
                  image: const AssetImage('assets/images/contacts.png'),
                  height: 20,
                  width: 20,
                  color: selectedIndex == 2 ? color3A71FF : colorE2E2E2,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Text(contacts),
                ),
              ],
            )),
      ),
      Tab(
        child: Container(
            padding: const EdgeInsets.fromLTRB(4, 0, 4, 0),
            child: Row(
              children: [
                Image(
                  image: const AssetImage('assets/images/correspondence.png'),
                  height: 20,
                  width: 20,
                  color: selectedIndex == 3 ? color3A71FF : colorE2E2E2,
                ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Text(correspondences),
                ),
              ],
            )),
      ),
    ],
  );
}
