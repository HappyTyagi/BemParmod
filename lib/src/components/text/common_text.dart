import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:flutter/material.dart';

Container statusContainer(BuildContext context, String text) {
  return Container(
    decoration: BoxDecoration(
      color: colorFF7D00,
      borderRadius: BorderRadius.circular(20),
    ),
    padding: const EdgeInsets.fromLTRB(16, 4, 16, 4),
    child: Text(
      text,
      style: Theme.of(context).textTheme.titleLarge?.copyWith(
            color: colorWhite,
            fontWeight: FontWeight.w600,
          ),
    ),
  );
}

//----- Correspondence file type Note, Email, Attachment
Container addFileTypeText(BuildContext context, String text, Color color) {
  return Container(
    decoration: BoxDecoration(
      color: color.withOpacity(0.15),
      borderRadius: BorderRadius.circular(20),
    ),
    padding: const EdgeInsets.all(10),
    child: Text(
      text,
      style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: color,
            fontSize: fontSize14,
          ),
    ),
  );
}

Container locationText(BuildContext context, String location) {
  return Container(
    alignment: Alignment.topLeft,
    padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
    child: RichText(
      text: TextSpan(
        children: [
          const WidgetSpan(
            child: Icon(Icons.location_on_outlined, size: 20, color: color6C6C6C),
          ),
          const TextSpan(text: '  '),
          TextSpan(
            text: location,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: color6C6C6C,
                ),
          ),
        ],
      ),
    ),
  );
}
