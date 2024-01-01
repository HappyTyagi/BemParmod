//Import packages and classes
import 'package:bem/src/components/card/project_card.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/view/search/search_bar.dart';
import 'package:bem/src/utils/device_helper.dart';
import 'package:flutter/material.dart';

// StatefulWidget representing the AllProjects screen or page
class AllProjects extends StatefulWidget {
  const AllProjects({super.key});

  @override
  State<AllProjects> createState() => _AllProjectsState();
}

class _AllProjectsState extends State<AllProjects> {
  // Getting the device type (Phone or Tablet)
  DeviceType deviceType = getDeviceType();

  // List of items to be displayed in the grid view
  List<String> items = ["ABC", "DEF", "GHI", "JKH", "KKK", "HAGS", "HSF", "JSHS", "USGR", "JJSHS", "LL", "IGS"];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: gradiantBackground(), // Applying a gradient background to the container
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Title for all projects
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: Text(allProjects, style: Theme.of(context).textTheme.bodyMedium),
          ),

          // Description for the last project
          Text(
            lastProjectDescription,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: color6F6E81,
                ),
          ),

          // Widget for search functionality (assumed to be defined elsewhere)
          searchWidget(context),

          // Flexible container holding the GridView with projects
          Flexible(
            child: GridView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
              itemCount: items.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: deviceType == DeviceType.Phone ? 1 : 2, // Adjusting grid based on device type
                mainAxisSpacing: 12,
                crossAxisSpacing: 12,
                mainAxisExtent: 240, // Height of each grid item
              ),
              itemBuilder: (context, index) {
                return ProjectCard(name: items[index]); // Displaying each item using a ProjectCard widget
              },
            ),
          ),
        ],
      ),
    );
  }
}
