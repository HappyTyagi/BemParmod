import 'package:bem/src/components/card/document_card.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/view/document/add_document.dart';
import 'package:bem/src/utils/device_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

import '../../models/dataModels/document_model.dart';

class DocumentTab extends StatefulWidget {
  const DocumentTab({super.key});

  @override
  State<DocumentTab> createState() => _DocumentTabState();
}

class _DocumentTabState extends State<DocumentTab> {
  List<DocumentDM> docs = [];

  @override
  void initState() {
    docs.add(DocumentDM('', 'Parcel Creation Document', '1 MB', '09.22.2023'));
    docs.add(DocumentDM('', 'Parcel Offer Document', '3 MB', '10.11.2023'));
    docs.add(DocumentDM('', 'Parcel Relocation Document', '2 MB', '10.25.2023'));
    docs.add(DocumentDM('', 'Parcel Negotiation Document', '5 MB', '11.07.2023'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var _isTablet = isTablet();
    var documentCount = 3;

    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        addVerticalSpace(16),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Flex(
            direction: _isTablet ? Axis.horizontal : Axis.vertical,
            children: [
              Text(
                "All Documents: $documentCount",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: fontSize24,
                    ),
              ),
              if (_isTablet) const Spacer(),
              Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.to(const AddDocument());
                  },
                  icon: const Icon(Icons.add, color: colorWhite),
                  label: Text(
                    addDocument,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
              itemCount: docs.length,
              itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: DocumentCard(document: docs[index]),
                  )),
        ),
      ],
    );
  }
}
