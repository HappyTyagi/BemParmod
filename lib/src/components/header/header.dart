import 'package:bem/src/components/divider/divider.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:flutter/material.dart';

Container headerView(BuildContext context, String title, String description) {
  return Container(
    alignment: Alignment.topLeft,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
          child: Text(
            title,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: color2E2E2E,
                ),
          ),
        ),
        addVerticalSpace(8),

        // Padding(
        //   padding: const EdgeInsets.all(16),
        //   child: SizedBox(
        //     width: MediaQuery.of(context).size.width / 2 + 100,
        //     child: Text(
        //       description,
        //       style: Theme.of(context).textTheme.headlineMedium?.copyWith(
        //             color: color282828,
        //           ),
        //     ),
        //   ),
        // ),
      ],
    ),
  );
}
