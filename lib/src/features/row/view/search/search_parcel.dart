import 'package:bem/src/components/checkbox/checkboxField.dart';
import 'package:bem/src/components/divider/divider.dart';
import 'package:bem/src/components/dropdown/dropdown.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/components/text_field/label_text_field.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/utils/device_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/route_manager.dart';

class SearchParcel extends StatefulWidget {
  const SearchParcel({super.key});

  @override
  State<SearchParcel> createState() => _SearchParcelState();
}

class _SearchParcelState extends State<SearchParcel> {
  List<String> list = <String>['High-Low', 'Low-High', 'Create Date'];
  DeviceType deviceType = getDeviceType();
  bool isAssignedMeChecked = false;
  bool isOnlyDownloadedChecked = false;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return AlertDialog(
      surfaceTintColor: colorWhite,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      contentPadding: EdgeInsets.zero,
      actionsAlignment: MainAxisAlignment.spaceAround,
      title: Row(
        children: [
          Expanded(
            flex: 1,
            child: Center(
              child: Text(findParcel, style: Theme.of(context).textTheme.bodyMedium?.copyWith(fontSize: fontSize18, color: colorBlack)),
            ),
          ),
          IconButton(
            icon: const Icon(Icons.close),
            onPressed: () {
              Get.back();
            },
          ),
        ],
      ),
      //----- body ------
      content: Builder(builder: (context) {
        return Wrap(children: [
          addHorizontalDivider(),
          Container(
            padding: deviceType == DeviceType.Phone ? const EdgeInsets.all(24) : const EdgeInsets.all(40),
            width: deviceType == DeviceType.Phone ? width : width / 1.5,
            child: StaggeredGrid.count(
              crossAxisCount: 1,
              mainAxisSpacing: 16,
              crossAxisSpacing: 16,
              children: [
                DropDownList(
                  mList: const [
                    'alabama',
                  ],
                  title: county,
                  hint: countyHint,
                  onChanged: (p0) {},
                ),
                LabelTextField(
                  title: taxId,
                  hintText: taxIdHint,
                  onTap: () {},
                  validator: (value) {},
                ),
                LabelTextField(
                  title: propertyOwner,
                  hintText: propertyOwnerHint,
                  onTap: () {},
                  validator: (value) {},
                ),
                LabelTextField(
                  title: parcelNumber,
                  hintText: parcelNumberHint,
                  onTap: () {},
                  validator: (value) {},
                ),
                DropDownList(
                  mList: const [
                    'alabama',
                  ],
                  title: status,
                  hint: statusHint,
                  onChanged: (p0) {},
                ),
                Flex(
                  direction: deviceType == DeviceType.Phone ? Axis.vertical : Axis.horizontal,
                  children: [
                    CheckBoxField(title: assignedMe, onChanged: (value) {}, value: true),
                    if (deviceType == DeviceType.Tablet) addHorizontalSpace(72),
                    CheckBoxField(title: onlyDownloaded, onChanged: (value) {}, value: true),
                  ],
                ),
              ],
            ),
          ),
          addHorizontalDivider(),
          addVerticalSpace(20),
        ]);
        // var width = MediaQuery.of(context).size.width;
        // return Wrap(
        //   children: [
        //     Column(children: [
        //       addDivider(),
        //       Container(
        //         width: deviceType == DeviceType.Phone ? width : width / 1.5,
        //         padding: deviceType == DeviceType.Phone ? const EdgeInsets.all(12) : const EdgeInsets.all(40),
        //         child: Column(
        //           crossAxisAlignment: CrossAxisAlignment.stretch,
        //           mainAxisAlignment: MainAxisAlignment.start,
        //           children: [
        //             Text(
        //               county,
        //               style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: color262D33, fontSize: fontSize14),
        //             ),
        //             DropdownButtonFormField(
        //               items: list.map<DropdownMenuItem<String>>((String value) {
        //                 return DropdownMenuItem<String>(
        //                   value: value,
        //                   child: Text(
        //                     value,
        //                     style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        //                           color: color262D33,
        //                         ),
        //                   ),
        //                 );
        //               }).toList(),
        //               onChanged: (value) {
        //                 validator:
        //                 (value) => value.isEmpty ? 'field required' : null;
        //               },
        //               hint: Text(county, style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: colorABABAB, fontSize: fontSize14)),
        //               iconSize: 30,
        //               dropdownColor: Colors.white,
        //             ),
        //             addVerticalSpace(24),
        //             Text(
        //               taxId,
        //               style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: color262D33, fontSize: fontSize14),
        //             ),
        //             TextField(
        //               onTap: null,
        //               maxLines: 1,
        //               decoration: const InputDecoration(hintText: taxIdHint),
        //               scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        //             ),
        //             addVerticalSpace(24),
        //             Text(
        //               parcelNumber,
        //               style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: color262D33, fontSize: fontSize14),
        //             ),
        //             TextField(
        //               onTap: null,
        //               maxLines: 1,
        //               decoration: const InputDecoration(hintText: parcelNumberHint),
        //               scrollPadding: EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
        //             ),
        //             addVerticalSpace(24),
        //             Text(
        //               status,
        //               style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: color262D33, fontSize: fontSize14),
        //             ),
        //             DropdownButtonFormField(
        //               items: list.map<DropdownMenuItem<String>>((String value) {
        //                 return DropdownMenuItem<String>(
        //                   value: value,
        //                   child: Text(
        //                     value,
        //                     style: Theme.of(context).textTheme.bodyLarge?.copyWith(
        //                           color: color262D33,
        //                         ),
        //                   ),
        //                 );
        //               }).toList(),
        //               onChanged: (value) {
        //                 validator:
        //                 (value) => value.isEmpty ? 'field required' : null;
        //               },
        //               hint: Text(status, style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: colorABABAB, fontSize: fontSize14)),
        //               iconSize: 30,
        //               dropdownColor: Colors.white,
        //             ),

        //             if (deviceType == DeviceType.Phone)
        //               Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Row(
        //                     children: [
        //                       addVerticalSpace(16),
        //                       Transform.translate(
        //                         offset: const Offset(-8, 0),
        //                         child: Checkbox(
        //                           value: isAssignedMeChecked,
        //                           onChanged: (bool? value) {
        //                             setState(() {
        //                               isAssignedMeChecked = value!;
        //                             });
        //                           },
        //                           activeColor: color3A71FF,
        //                           materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        //                         ),
        //                       ),
        //                       Text(
        //                         assignedMe,
        //                         style: Theme.of(context).textTheme.titleLarge?.copyWith(
        //                               color: color6C6C6C,
        //                             ),
        //                       ),
        //                     ],
        //                   ),
        //                   Row(
        //                     children: [
        //                       Transform.translate(
        //                         offset: const Offset(-8, 0),
        //                         child: Checkbox(
        //                           value: isOnlyDownloadedChecked,
        //                           onChanged: (bool? value) {
        //                             setState(() {
        //                               isOnlyDownloadedChecked = value!;
        //                             });
        //                           },
        //                           activeColor: color3A71FF,
        //                           materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        //                         ),
        //                       ),
        //                       Text(
        //                         onlyDownloaded,
        //                         style: Theme.of(context).textTheme.titleLarge?.copyWith(
        //                               color: color2E2E2E,
        //                             ),
        //                       ),
        //                     ],
        //                   ),
        //                 ],
        //               ),
        //             // ------- Tablet -------
        //             if (deviceType == DeviceType.Tablet) ...[
        //               addVerticalSpace(32),
        //               Row(
        //                 children: [
        //                   Transform.translate(
        //                     offset: const Offset(-8, 0),
        //                     child: Checkbox(
        //                       value: isAssignedMeChecked,
        //                       onChanged: (bool? value) {
        //                         setState(() {
        //                           isAssignedMeChecked = value!;
        //                         });
        //                       },
        //                       activeColor: color3A71FF,
        //                       materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        //                     ),
        //                   ),
        //                   Text(
        //                     assignedMe,
        //                     style: Theme.of(context).textTheme.titleLarge?.copyWith(
        //                           color: color6C6C6C,
        //                         ),
        //                   ),
        //                   addHorizontalSpace(100),
        //                   Checkbox(
        //                     value: isOnlyDownloadedChecked,
        //                     onChanged: (value) {
        //                       setState(() {
        //                         isOnlyDownloadedChecked = value!;
        //                       });
        //                     },
        //                     activeColor: color3A71FF,
        //                   ),
        //                   Text(
        //                     onlyDownloaded,
        //                     style: Theme.of(context).textTheme.titleLarge?.copyWith(
        //                           color: color2E2E2E,
        //                         ),
        //                   ),
        //                 ],
        //               ),
        //             ]
        //           ],
        //         ),
        //       ),
        //       addDivider(),
        //       addVerticalSpace(20),
        //     ]),
        //   ],
        // );
      }),
      actions: <Widget>[
        TextButton(
          onPressed: () => Get.back(),
          child: Text(
            reset,
            style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: color3B3C45, fontSize: fontSize16),
          ),
        ),
        SizedBox(
          width: deviceType == DeviceType.Phone ? 100 : 200,
          child: ElevatedButton(
            onPressed: () => Get.back(),
            child: Text(
              apply,
              style: Theme.of(context).textTheme.titleLarge?.copyWith(color: colorWhite, fontSize: fontSize16),
            ),
          ),
        ),
      ],
    );
  }
}
