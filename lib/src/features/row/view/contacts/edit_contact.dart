import 'package:bem/src/components/appbar/back_button.dart';
import 'package:bem/src/components/bottombar/save_cancel_bottom_bar.dart';
import 'package:bem/src/components/buttons/common_buttons.dart';
import 'package:bem/src/components/checkbox/checkboxField.dart';
import 'package:bem/src/components/divider/divider.dart';
import 'package:bem/src/components/dropdown/dropdown.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/components/text_field/label_text_field.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/view/address/add_edit_address.dart';
import 'package:bem/src/features/row/view/contacts/add_contacts.dart';
import 'package:bem/src/utils/device_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/route_manager.dart';

class EditContact extends StatefulWidget {
  const EditContact({super.key});

  @override
  State<EditContact> createState() => _EditContactState();
}

class _EditContactState extends State<EditContact> {
  DeviceType deviceType = getDeviceType();
  late bool isCompany;
  late bool isPrimaryContact;
  final List<String> stateList = <String>[];
  final List<String> addressList = <String>["25B Petra Sagaidachnoho Street, California, USA", "7450 CrossRoads At Pen, Minniapollis, USA"];
  // final List<String> addressList = <String>["7450 CrossRoads At Pen, Minniapollis, USA"];
  // final List<String> addressList = <String>[];

  @override
  void initState() {
    isCompany = true;
    isPrimaryContact = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
          height: constraints.maxHeight,
          decoration: backgroundImageDecoration(),
          child: Scaffold(
            backgroundColor: transparent,
            appBar: getBackButton(context),
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(24),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(mainAxisAlignment: MainAxisAlignment.start, crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text('John Green',
                          style: Theme.of(context).textTheme.displayMedium?.copyWith(
                                color: color2E2E2E,
                              )),
                      addVerticalSpace(8),
                      Text(
                        "emailname@mail.com",
                        style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              color: color494A54,
                            ),
                      ),
                    ]),
                  ),
                  addHorizontalDivider(),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      Text(mainInformation, style: Theme.of(context).textTheme.bodyMedium),
                      addVerticalSpace(16),
                      Text(mainTabDescription, style: Theme.of(context).textTheme.displaySmall),
                      addVerticalSpace(16),
                      StaggeredGrid.count(
                        crossAxisCount: deviceType == DeviceType.Phone ? 1 : 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        children: [
                          LabelTextField(
                            title: name,
                            hintText: nameHint,
                            onTap: () {},
                            validator: (value) {},
                          ),
                          LabelTextField(
                            title: phone,
                            hintText: phoneHint,
                            onTap: () {},
                            validator: (value) {},
                          ),
                          LabelTextField(
                            title: emailId,
                            hintText: emailIdHint,
                            onTap: () {},
                            validator: (value) {},
                          ),
                          LabelTextField(
                            title: cell,
                            hintText: cellHint,
                            onTap: () {},
                            validator: (value) {},
                          ),
                        ],
                      ),
                      StaggeredGrid.count(
                        crossAxisCount: deviceType == DeviceType.Phone ? 1 : 3,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        children: [
                          CheckBoxField(
                              title: company,
                              onChanged: (value) {
                                setState(() {
                                  isCompany = value!;
                                });
                              },
                              value: isCompany),
                          CheckBoxField(
                              title: primaryContact,
                              onChanged: (value) {
                                setState(() {
                                  isPrimaryContact = value!;
                                });
                              },
                              value: isPrimaryContact),
                        ],
                      ),
                      addHorizontalDivider(),
                      addVerticalSpace(24),

                      //---------- address ------------//
                      deviceType == DeviceType.Tablet
                          ? Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      address,
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            fontSize: fontSize24,
                                          ),
                                    ),
                                    const Spacer(),
                                    ElevatedButton.icon(
                                      onPressed: () {
                                        Get.to(Address.add());
                                      },
                                      icon: const Icon(Icons.add, color: colorWhite),
                                      label: Text(
                                        addAddress,
                                        style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                              fontWeight: FontWeight.w600,
                                            ),
                                      ),
                                    ),
                                  ],
                                ),
                                addVerticalSpace(4),
                                Text(documentDescription,
                                    style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                          color: color6C6C6C,
                                        )),
                              ],
                            )
                          : Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                              Text(
                                address,
                                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                      fontSize: fontSize24,
                                    ),
                              ),
                              Text(documentDescription,
                                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                        color: color6C6C6C,
                                      )),
                              addVerticalSpace(4),
                              ElevatedButton.icon(
                                onPressed: () {
                                  Get.to(const AddContact());
                                },
                                icon: const Icon(Icons.add, color: colorWhite),
                                label: Text(
                                  addAddress,
                                  style: Theme.of(context).textTheme.labelLarge?.copyWith(
                                        fontWeight: FontWeight.w600,
                                      ),
                                ),
                              ),
                            ]),

                      // -----  Existing Address Container ----- //
                      addressList.isNotEmpty ? addVerticalSpace(24) : Container(),
                      ListView.builder(
                        itemCount: addressList.length,
                        itemBuilder: (context, index) {
                          final item = addressList[index];
                          return Container(
                            padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                const Icon(Icons.location_on_outlined, size: 20, color: color6C6C6C),
                                addHorizontalSpace(8),
                                SizedBox(
                                  width: constraints.maxWidth - 120,
                                  child: Text(
                                    item,
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                          color: color374151,
                                          fontSize: fontSize18,
                                        ),
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                editButton(() {
                                  Get.to(() => Address.edit(
                                        initialAddress: '',
                                      ));
                                })
                              ],
                            ),
                          );
                        },
                        shrinkWrap: true,
                      ),
                      addressList.isNotEmpty ? addHorizontalDivider() : Container(),
                      addVerticalSpace(32),
                      StaggeredGrid.count(
                        crossAxisCount: deviceType == DeviceType.Phone ? 1 : 3,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        children: [
                          DropDownList(
                            mList: stateList,
                            title: state,
                            hint: stateHint,
                            onChanged: (p0) {},
                          ),
                          LabelTextField(
                            title: city,
                            hintText: cityHint,
                            onTap: () {},
                            validator: (value) {},
                          ),
                          LabelTextField(
                            title: zipcode,
                            hintText: zipcodeHint,
                            onTap: () {},
                            validator: (value) {},
                          ),
                        ],
                      ),
                      addVerticalSpace(16),
                      addHorizontalDivider(),
                      addVerticalSpace(32),
                      LabelTextField.min(
                        title: note,
                        hintText: note,
                        onTap: () {},
                        validator: (value) {},
                        minimumLine: 3,
                      ),
                    ]),
                  ),
                  // ),
                  deviceType == DeviceType.Tablet ? addVerticalSpace(50) : Container(),
                  addHorizontalDivider(),
                  SaveCancelView(
                    onClick: () {},
                  ),
                ],
              ),
              //   ),
              // ),
            ),
          ));
    });
  }
}
