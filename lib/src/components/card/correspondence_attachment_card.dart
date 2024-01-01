import 'package:bem/src/components/buttons/common_buttons.dart';
import 'package:bem/src/components/card/correspondence_document.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/components/divider/divider.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/components/text/common_text.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/models/dataModels/correspondence_model.dart';
import 'package:bem/src/features/row/view/correspondences/edit_correspondence.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CorrespondenceAttachmentView extends StatefulWidget {
  const CorrespondenceAttachmentView({super.key});

  @override
  State<CorrespondenceAttachmentView> createState() => _CorrespondenceAttachmentViewState();
}

class _CorrespondenceAttachmentViewState extends State<CorrespondenceAttachmentView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.fromLTRB(16, 24, 16, 24),
      decoration: greyBorderWithShadow(radius: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: Row(
              children: [
                addFileTypeText(context, attachment, colorFF7D00),
                const Spacer(),
                editButton(() {
                  Get.to(() => const EditCorrespondence(correspondenceType: CorrespondeceType.Attachment));
                }),
              ],
            ),
          ),
          addHorizontalDivider(),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 48, 16),
            child: Text(
              'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque sit voluptatem accusantiumlaudantium, totam rem architecto beatae vitae dicta sunt explicabo.',
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: color6C6C6C,
                  ),
              textAlign: TextAlign.justify,
            ),
          ),
          Row(
            children: [
              correspondenceDocument(context, "Document Name", "2 MB", "10.10.2023", () {}),
              addHorizontalSpace(20),
              correspondenceDocument(context, "Document Name", "2 MB", "10.10.2023", () {}),
            ],
          ),
          addVerticalSpace(20),
          Text("10.10.2023 (10:40 AM)", style: Theme.of(context).textTheme.titleLarge),
        ],
      ),
    );
  }
}
