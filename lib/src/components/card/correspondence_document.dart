import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:flutter/material.dart';

Expanded correspondenceDocument(BuildContext context, String name, String fileSize, String dateString, final void Function()? onPressed) {
  return Expanded(
    child: Container(
      padding: const EdgeInsets.all(24),
      decoration: documentBorder(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: colorF8F8F9,
            ),
            child: const Image(
              image: AssetImage('assets/images/document_dash.png'),
              height: 60,
              width: 60,
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: colorBlack, fontSize: fontSize16, height: 3),
                ),
                Row(
                  children: [
                    Text(
                      fileSize,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: color494A54,
                          ),
                    ),
                    addHorizontalSpace(16),
                    Text(
                      dateString,
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                            color: color494A54,
                          ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
