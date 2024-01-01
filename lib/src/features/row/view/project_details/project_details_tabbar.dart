import 'package:flutter/material.dart';

import '../../../../constants/app_color.dart';
import '../../../../constants/text_strings.dart';

TabBar projectDetailsTabBar(BuildContext context, TabController tabController, int _selectedIndex) {
  return TabBar(
    isScrollable: true,
    controller: tabController,
    padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
    tabs: [
      Tab(
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: const AssetImage('assets/images/all_parcels.png'),
                  height: 20,
                  width: 20,
                  color: _selectedIndex == 0 ? colorWhite : colorE2E2E2,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                  child: Text(
                    allParcels,
                    style: _selectedIndex == 0
                        ? Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorWhite,
                            )
                        : Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: color494A54,
                            ),
                  ),
                ),
              ],
            )),
      ),
      Tab(
        child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image(
                  image: _selectedIndex == 1 ? const AssetImage('assets/images/import_selected.png') : const AssetImage('assets/images/import_unselected.png'),
                  height: 20,
                  width: 20,
                  color: _selectedIndex == 1 ? colorWhite : Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                  child: Text(
                    downloaded,
                    style: _selectedIndex == 1
                        ? Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: colorWhite,
                            )
                        : Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.w600,
                              color: color494A54,
                            ),
                  ),
                ),
              ],
            )),
      )
    ],
  );
}
