import 'package:bem/src/components/buttons/common_buttons.dart';
import 'package:bem/src/components/divider/divider.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/view/contacts/edit_contact.dart';
import 'package:bem/src/features/row/view/map/map_parcel_details.dart';
import 'package:bem/src/utils/device_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:styled_text/styled_text.dart';

/// Statefull Class to show main Project Information.
/// This is a tab to be shown under the Parcel Details Screen.

class ParcelMainInformation extends StatefulWidget {
  const ParcelMainInformation({super.key});

  @override
  State<ParcelMainInformation> createState() => _ParcelMainInformationState();
}

class _ParcelMainInformationState extends State<ParcelMainInformation> {
  DeviceType deviceType = getDeviceType();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.fromLTRB(16, 24, 8, 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Main Information Text
            Text(mainInformation, style: Theme.of(context).textTheme.bodyMedium),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
              child: Text(mainTabDescription, style: Theme.of(context).textTheme.displaySmall),
            ),

            ///Show Current Project Information about acquisition, area, offer
            StaggeredGrid.count(
              crossAxisCount: deviceType == DeviceType.Phone ? 1 : 4,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                ///Acquisition Information
                createInformationBox(context, acquisitionType, 'Partial', railroad),

                ///Area Information
                createInformationBox(context, areaToBeAcq, '10 000 km', utilityCorridor),

                ///Appraised Amount
                createInformationBox(context, appraisedAmount, '\$1 000 000', railroad),

                ///Current Offer
                createInformationBox(context, amountSigned, '\$1 000 000', railroad, showPin: " \u2022"),
              ],
            ),

            /// Notes Information
            Container(
              margin: const EdgeInsets.fromLTRB(0, 16, 16, 0),
              decoration: backgroundShadow(),
              padding: const EdgeInsets.all(16),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Note",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: fontSize16,
                        ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                    child: Text(
                      "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.",
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: fontSize16, fontWeight: FontWeight.w400),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
                    child: Text(
                      "Priority Parcel",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(color: colorABABAB),
                    ),
                  ),
                ],
              ),
            ),

            /// Contact Details about the Parcel
            Container(
              margin: const EdgeInsets.fromLTRB(0, 16, 16, 0),
              decoration: backgroundShadow(),
              width: MediaQuery.of(context).size.width,
              child: Padding(
                padding: const EdgeInsets.all(24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(16, 8, 0, 8),
                                child: Text(
                                  "John Green",
                                  style: Theme.of(context).textTheme.titleLarge,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  launchEmail('emailname@mail.com');
                                },
                                child: Padding(
                                  padding: const EdgeInsets.fromLTRB(16, 8, 0, 16),
                                  child: Text(
                                    "emailname@mail.com",
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: colorABABAB),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        editButton(() {
                          Get.to(() => const EditContact());
                        })
                      ],
                    ),
                    addHorizontalDivider(),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on_outlined, size: 20, color: color6C6C6C),
                          StyledText(
                              text: "  25B Petra Sagaidachnoho Street, <bold>California, USA</bold>",
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: color374151,
                                    fontSize: fontSize18,
                                  ),
                              tags: {
                                'bold': StyledTextTag(style: const TextStyle(fontWeight: FontWeight.bold)),
                              })
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.topLeft,
                      padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
                      child: Row(
                        children: [
                          const Icon(Icons.location_on_outlined, size: 20, color: color6C6C6C),
                          StyledText(
                              text: "  Lat\\Long <bold>(Auto)</bold>",
                              style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                    color: color374151,
                                    fontSize: fontSize18,
                                  ),
                              tags: {
                                'bold': StyledTextTag(style: const TextStyle(color: Colors.grey)),
                              })
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 500,
                      child: MapParcelDetails(),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Container createInformationBox(BuildContext context, String title, String description, String type, {String showPin = ''}) {
  return Container(
    height: 180,
    decoration: backgroundShadow(),
    padding: const EdgeInsets.all(16),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: RichText(
            text: TextSpan(
              text: title,
              style: Theme.of(context).textTheme.bodyLarge,
              children: [
                TextSpan(
                    text: showPin,
                    style: Theme.of(context).textTheme.displaySmall?.copyWith(
                          color: colorFF7D00,
                          fontWeight: FontWeight.w900,
                        )),
              ],
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
          child: Text(
            description,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: fontSize18),
          ),
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 24, 0, 0),
          child: Text(
            type,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: colorABABAB),
          ),
        ),
      ],
    ),
  );
}
