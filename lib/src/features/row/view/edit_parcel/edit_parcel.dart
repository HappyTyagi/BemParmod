import 'package:bem/src/components/appbar/back_button.dart';
import 'package:bem/src/components/bottombar/save_cancel_bottom_bar.dart';
import 'package:bem/src/components/buttons/common_buttons.dart';
import 'package:bem/src/components/divider/divider.dart';
import 'package:bem/src/components/dropdown/dropdown.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/components/text/common_text.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/view/contacts/add_contacts.dart';
import 'package:bem/src/features/row/view/contacts/edit_contact.dart';
import 'package:bem/src/features/row/view/map/map_parcel_details.dart';
import 'package:bem/src/utils/device_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:styled_text/styled_text.dart';

class EditParcel extends StatefulWidget {
  const EditParcel({super.key});

  @override
  State<EditParcel> createState() => _EditParcelState();
}

class _EditParcelState extends State<EditParcel> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final List<String> list = <String>['10000 km', '15000 km', '20000 km'];
  final List<String> listAmount = <String>['10000', '15000', '20000'];
  final List<String> acqTypeList = <String>['Partial', 'Full'];
  var isTabletDevice = isTablet();
  var isPriority = true;

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        decoration: backgroundImageDecoration(),
        child: Scaffold(
            key: scaffoldKey,
            backgroundColor: transparent,
            appBar: getBackButton(context),
            body: SingleChildScrollView(
              child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                addVerticalSpace(40),
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                  child: RichText(
                    text: TextSpan(
                      text: "\u2022",
                      style: Theme.of(context).textTheme.displaySmall?.copyWith(
                            color: colorFF7D00,
                            fontWeight: FontWeight.w900,
                          ),
                      children: [
                        const TextSpan(
                          text: "   ",
                        ),
                        TextSpan(
                          text: "Project  #218039",
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                fontSize: fontSize18,
                              ),
                        ),
                      ],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Text(
                        "Parcel #218039",
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                      addHorizontalSpace(12),
                      statusContainer(context, status),
                    ],
                  ),
                ),
                addHorizontalDivider(),
                addVerticalSpace(16),
                Container(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        edit,
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      addVerticalSpace(16),
                      Text(
                        "Clear and simple description of this section",
                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: color6F6E81),
                      ),
                      addVerticalSpace(20),

                      ///Show Current Project Information about acquisition, area, offer
                      StaggeredGrid.count(
                        crossAxisCount: isTabletDevice ? 2 : 1,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        children: [
                          ///Area Information
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DropDownList.selected(
                                hint: acquisitionType,
                                onChanged: (p0) {},
                                selectedValue: '15000 km',
                                title: areaToBeAcq,
                                mList: list,
                                enabledDropdown: false,
                              ),
                              addVerticalSpace(8),
                              Row(children: [
                                Transform.translate(
                                  offset: const Offset(-8, 0),
                                  child: Checkbox(
                                    value: true,
                                    onChanged: (bool? value) {},
                                    activeColor: colorABABAB,
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                ),
                                Text(
                                  utilityCorridor,
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                        color: colorABABAB,
                                      ),
                                ),
                              ])
                            ],
                          ),

                          ///Appraised Amount
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DropDownList.selected(
                                mList: listAmount,
                                hint: appraisedAmountHint,
                                selectedValue: '15000',
                                title: appraisedAmount,
                                onChanged: (p0) {},
                                enabledDropdown: false,
                              ),
                              addVerticalSpace(8),
                              Row(children: [
                                Transform.translate(
                                  offset: const Offset(-8, 0),
                                  child: Checkbox(
                                    value: true,
                                    onChanged: (bool? value) {},
                                    activeColor: colorABABAB,
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                ),
                                Text(
                                  railroad,
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                        color: colorABABAB,
                                      ),
                                ),
                              ])
                            ],
                          ),

                          /// Acquisition type
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DropDownList(
                                mList: acqTypeList,
                                hint: acquisitionTypeHint,
                                title: acquisitionType,
                                onChanged: (p0) {},
                              ),
                              addVerticalSpace(8),
                              Row(children: [
                                Transform.translate(
                                  offset: const Offset(-8, 0),
                                  child: Checkbox(
                                    value: true,
                                    onChanged: (bool? value) {},
                                    activeColor: color3A71FF,
                                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                  ),
                                ),
                                Text(
                                  railroad,
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                        color: color2E2E2E,
                                      ),
                                ),
                              ])
                            ],
                          ),

                          ///Current Offer
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              DropDownList(
                                mList: listAmount,
                                hint: amountSignedHint,
                                title: amountSigned,
                                onChanged: (p0) {},
                              ),
                              addVerticalSpace(8),
                              Row(
                                children: [
                                  Transform.translate(
                                    offset: const Offset(-8, 0),
                                    child: Checkbox(
                                      value: true,
                                      onChanged: (bool? value) {},
                                      activeColor: color3A71FF,
                                      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                                    ),
                                  ),
                                  Text(
                                    railroad,
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                          color: color2E2E2E,
                                        ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ],
                      ),

                      addVerticalSpace(16),
                      Text(
                        note,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: color262D33,
                              fontSize: fontSize14,
                            ),
                      ),
                      Container(
                        decoration: textBorder(radius: 8),
                        padding: const EdgeInsets.all(16),
                        child: Text(
                          'Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.',
                          style: Theme.of(context).textTheme.bodyLarge,
                          textAlign: TextAlign.justify,
                        ),
                      ),
                      Row(children: [
                        Transform.translate(
                          offset: const Offset(-8, 0),
                          child: Checkbox(
                            value: isPriority,
                            onChanged: (bool? value) {
                              setState(() {
                                isPriority = value!;
                              });
                            },
                            activeColor: color3A71FF,
                            materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                          ),
                        ),
                        Text(
                          priorityParcel,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                color: color2E2E2E,
                              ),
                        ),
                      ]),
                      // addVerticalSpace(16),
                      addHorizontalDivider(),
                      //---- Profile Image ----//
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 24, 24, 24),
                        child: Row(
                          children: [
                            // const Image(
                            //   image: AssetImage('assets/images/profile.png'),
                            //   height: 70,
                            //   width: 70,
                            // ),
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
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(16, 8, 0, 16),
                                    child: Text(
                                      "emailname@mail.com",
                                      style: Theme.of(context).textTheme.titleLarge?.copyWith(color: colorABABAB),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            editButton(() {
                              Get.to(() => const EditContact());
                            }),
                            addHorizontalSpace(16),
                            ElevatedButton.icon(
                              style: ButtonStyle(
                                padding: MaterialStateProperty.all(const EdgeInsets.fromLTRB(20, 12, 20, 12)),
                              ),
                              onPressed: () {
                                Get.to(() => const AddContact());
                              },
                              icon: const Icon(Icons.add, color: colorWhite),
                              label: Text(
                                addContact,
                                style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                      fontWeight: FontWeight.w600,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      addHorizontalDivider(),

                      /// Location details
                      Row(
                        children: [
                          Expanded(
                              flex: 2,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(16),
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
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(16, 4, 0, 0),
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
                                  )
                                ],
                              )),
                          Padding(
                            padding: EdgeInsets.only(right: 24),
                            child: OutlinedButton.icon(
                              style: OutlinedButton.styleFrom(
                                  padding: const EdgeInsets.all(14), side: const BorderSide(width: 1.0, color: colorDCDCDC), shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8))),
                              onPressed: () {},
                              icon: const Icon(Icons.add, color: color3A71FF),
                              label: Text(
                                addLocation,
                                style: Theme.of(context).textTheme.labelLarge?.copyWith(fontWeight: FontWeight.w600, color: color3A71FF),
                              ),
                            ),
                          )
                        ],
                      ),
                      // addVerticalSpace(16),
                      const SizedBox(
                        height: 500,
                        child: MapParcelDetails(),
                      ),
                      addHorizontalDivider(),
                      SaveCancelView(onClick: () {}),
                    ],
                  ),
                ),
              ]),
            )));
  }
}
