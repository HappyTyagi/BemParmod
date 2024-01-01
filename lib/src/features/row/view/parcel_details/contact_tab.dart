import 'package:bem/src/components/card/contact_card.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/models/dataModels/document_model.dart';
import 'package:bem/src/features/row/view/contacts/add_contacts.dart';
import 'package:bem/src/utils/device_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ContactTab extends StatefulWidget {
  const ContactTab({super.key});

  @override
  State<ContactTab> createState() => _ContactTabState();
}

class _ContactTabState extends State<ContactTab> {
  final _isTablet = isTablet();
  var contactCount = 7;
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        addVerticalSpace(16),
        Padding(
          padding: const EdgeInsets.all(24),
          child: Flex(
            direction: _isTablet ? Axis.horizontal : Axis.vertical,
            children: [
              // All Contacts Text on Left hand side
              Text(
                "All Contacts: $contactCount",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: fontSize24,
                    ),
              ),
              if (_isTablet) const Spacer(),

              // Add Contact Button on right hand side
              Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.to(const AddContact());
                  },
                  icon: const Icon(Icons.add, color: colorWhite),
                  label: Text(
                    addContact,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
            ],
          ),
        ),
        addVerticalSpace(30),

        ///Expanded Contact Time
        Expanded(
          child: ListView.builder(
              itemCount: docs.length,
              itemBuilder: (BuildContext context, int index) => Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ContactCard(document: docs[index], isTablet: _isTablet),
                  )),
        ),
      ],
    );
  }
}

void contactTile(BuildContext context) {}
