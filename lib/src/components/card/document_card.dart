import 'package:bem/src/components/buttons/common_buttons.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:bem/src/features/row/models/dataModels/document_model.dart';
import 'package:bem/src/features/row/view/pdf/pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

// ignore: must_be_immutable
class DocumentCard extends StatefulWidget {
  final DocumentDM document;
  late bool isAudioMode = false;
  void Function()? onDeletePressed;
  bool readOnly = true;

  DocumentCard({super.key, required this.document});
  DocumentCard.addDocument({super.key, required this.document, required this.onDeletePressed});
  DocumentCard.addAudio({super.key, required this.document, required this.onDeletePressed, this.isAudioMode = true, this.readOnly = false});

  @override
  State<DocumentCard> createState() => _DocumentCardState();
}

class _DocumentCardState extends State<DocumentCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: documentBorder(),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(8),
              color: colorF8F8F9,
            ),
            child: widget.isAudioMode
                ? const Image(
                    image: AssetImage('assets/images/audio.png'),
                  )
                : const Image(
                    image: AssetImage('assets/images/document_solid.png'),
                  ),
          ),
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      SizedBox(
                        child: Text(
                          widget.document.fileName!,
                          style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                                color: colorBlack,
                                fontSize: fontSize16,
                                overflow: TextOverflow.ellipsis,
                              ),
                        ),
                      ),
                      if (widget.document.isEditMode && widget.document.showUploadProgress) ...[
                        const Spacer(),
                        Text(
                          "35%",
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: color6C6C6C,
                              ),
                        ),
                      ],
                    ],
                  ),

                  addVerticalSpace(12),
                  Row(
                    children: [
                      if (!widget.document.showUploadProgress)
                        Text(
                          widget.document.fileSize!,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: color494A54,
                                overflow: TextOverflow.ellipsis,
                              ),
                        ),
                      if (!widget.document.showUploadProgress) ...[
                        addHorizontalSpace(32),
                        Text(
                          widget.document.createDate!,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: color494A54,
                                overflow: TextOverflow.ellipsis,
                              ),
                        ),
                      ],
                    ],
                  ),

                  //--------- Show Progress Indicator ---------//
                  if (widget.document.showUploadProgress)
                    const LinearProgressIndicator(
                      value: 0.3,
                      backgroundColor: colorF9FBFF,
                      color: color3A71FF,
                      minHeight: 12,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                ],
              ),
            ),
          ),

          // ------- delete button ------
          if (widget.document.isEditMode && widget.document.showDeleteButton) deleteButton(widget.onDeletePressed),

          // -------- Show Arrow for Details -------- //
          if (!widget.document.isEditMode)
            arrowButton(() {
              if (!widget.isAudioMode) {
                Get.to(const PDFViewer());
              }
            })
        ],
      ),
    );
  }
}
