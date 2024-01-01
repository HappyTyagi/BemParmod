import 'package:bem/src/components/buttons/common_buttons.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/components/text/common_text.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/models/dataModels/correspondence_model.dart';
import 'package:bem/src/features/row/view/correspondences/edit_correspondence.dart';
import 'package:bem/src/features/row/view/correspondences/edit_notes_correspondence.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CorrespondenceNoteView extends StatefulWidget {
  const CorrespondenceNoteView({super.key});

  @override
  State<CorrespondenceNoteView> createState() => _CorrespondenceNoteViewState();
}

class _CorrespondenceNoteViewState extends State<CorrespondenceNoteView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      decoration: greyBorderWithShadow(radius: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text("File Name", style: Theme.of(context).textTheme.bodySmall),
              addHorizontalSpace(24),
              addFileTypeText(context, note, color00A86B),
              const Spacer(),
              editButton(() {
                Get.to(() => const EditNotesCorrespondence());
              }),
            ],
          ),
          addVerticalSpace(16),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 48, 0),
            child: Text(
              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque sit voluptatem accusantiumlaudantium, totam rem architecto beatae vitae dicta sunt explicabo.',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: color6C6C6C,
                  ),
              textAlign: TextAlign.justify,
            ),
          ),
          addVerticalSpace(20),
          Text("10.10.2023 (10:40 AM)", style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    );
  }
}
