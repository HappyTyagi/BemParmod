import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SaveCancelView extends StatefulWidget {
  final VoidCallback onClick;
  final String title;

  /// Creates and returns the SaveCancelView. Must be called from the UI thread. Note that it is up to the caller to ensure that this method is called from the UI thread.
  ///
  ///
  /// @return The SaveCancelView for this View's key and onClick method. Never null but may be called from the UI thread
  const SaveCancelView({super.key, required this.onClick, this.title = saveChanges});

  @override
  State<SaveCancelView> createState() => _SaveCancelViewState();
}

class _SaveCancelViewState extends State<SaveCancelView> {
  /// Builds the widget. This is called by the framework and should not be called directly by user.dart code.
  ///
  /// @param context - the context in which the widget is built.
  ///
  /// @return the widget to be displayed in the context's UI or null if there is no widget to be
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.centerRight,
      padding: const EdgeInsets.all(16),
      child: Wrap(
        children: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text(
              cancel,
              style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: color3B3C45, fontSize: fontSize16),
            ),
          ),
          addHorizontalSpace(32),
          ElevatedButton(
            onPressed: widget.onClick,
            child: Text(
              widget.title,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: colorWhite, fontSize: fontSize16),
            ),
          ),
        ],
      ),
    );
  }
}
