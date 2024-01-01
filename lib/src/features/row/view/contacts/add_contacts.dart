import 'package:bem/src/components/appbar/back_button.dart';
import 'package:bem/src/components/bottombar/save_cancel_bottom_bar.dart';
import 'package:bem/src/components/checkbox/checkboxField.dart';
import 'package:bem/src/components/divider/divider.dart';
import 'package:bem/src/components/dropdown/dropdown.dart';
import 'package:bem/src/components/header/header.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/components/text_field/label_text_field.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/utils/device_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/route_manager.dart';

class AddContact extends StatefulWidget {
  const AddContact({super.key});

  @override
  State<AddContact> createState() => _AddContactState();
}

class _AddContactState extends State<AddContact> {
  DeviceType deviceType = getDeviceType();
  late bool isCompany;
  late bool isPrimaryContact;
  final List<String> stateList = <String>[];

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
            body: CustomScrollView(
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      addVerticalSpace(40),
                      headerView(context, addContact, parcelDescription),
                      addVerticalSpace(4),
                      addHorizontalDivider(),
                      Expanded(
                        child: Container(
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
                                  title: cell,
                                  hintText: cellHint,
                                  onTap: () {},
                                  validator: (value) {},
                                ),
                                LabelTextField(
                                  title: emailId,
                                  hintText: emailIdHint,
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
                            addVerticalSpace(32),
                            StaggeredGrid.count(
                              crossAxisCount: deviceType == DeviceType.Phone ? 1 : 2,
                              mainAxisSpacing: 16,
                              crossAxisSpacing: 16,
                              children: [
                                LabelTextField(
                                  title: zipcode,
                                  hintText: zipcode,
                                  onTap: () {},
                                  validator: (value) {},
                                ),
                                LabelTextField(
                                  title: city,
                                  hintText: city,
                                  onTap: () {},
                                  validator: (value) {},
                                ),
                                DropDownList(
                                  mList: stateList,
                                  title: state,
                                  hint: state,
                                  onChanged: (p0) {},
                                ),
                                LabelTextField(
                                  title: actualAddress,
                                  hintText: actualAddress,
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
                      ),
                      // ),
                      addHorizontalDivider(),
                      SaveCancelView(
                        onClick: () {},
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
