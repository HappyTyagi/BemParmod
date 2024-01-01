import 'package:bem/src/components/divider/divider.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/utils/device_helper.dart';
import 'package:flutter/material.dart';

/// Display dashboard header with device type.
Column getDashboardHeader(BuildContext context, DeviceType deviceType) {
  return Column(
    mainAxisAlignment: MainAxisAlignment.start,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // Padding for Dashboard title.
      Padding(
        padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
        child: RichText(
          text: TextSpan(
            text: your,
            style: Theme.of(context).textTheme.displayMedium?.copyWith(
                  color: color2E2E2E,
                ),
            children: [
              TextSpan(
                text: dashboard,
                style: Theme.of(context).textTheme.displayMedium?.copyWith(
                      color: color3A71FF,
                    ),
              ),
            ],
          ),
        ),
      ),

      // Add a divider line
      addHorizontalDivider(),
    ],
  );
}
