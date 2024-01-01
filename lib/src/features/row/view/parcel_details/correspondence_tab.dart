import 'package:bem/src/components/card/correnpondence_call_card.dart';
import 'package:bem/src/components/card/correspondence_attachment_card.dart';
import 'package:bem/src/components/card/correspondence_note_card.dart';
import 'package:bem/src/components/dropdown/dropdown.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/models/dataModels/correspondence_model.dart';
import 'package:bem/src/features/row/view/correspondences/add_correspondence.dart';
import 'package:bem/src/utils/device_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class CorrespondenceTab extends StatefulWidget {
  const CorrespondenceTab({super.key});

  @override
  State<CorrespondenceTab> createState() => _CorrespondenceTabState();
}

class _CorrespondenceTabState extends State<CorrespondenceTab> {
  CorrespondeceType selectedCorrespondenceType = CorrespondeceType.All;
  List<String> sortList = <String>['High-Low', 'Low-High', 'Create Date'];
  String sortingSelected = '';
  final _isTablet = isTablet();
  List<CorrespondenceDM> correspondenceList = [];
  List<CorrespondenceDM> correspondenceOriginalList = [];
  var listCount = 0;

  @override
  void initState() {
    super.initState();
    sortingSelected = sortList.first;
    correspondenceList.add(CorrespondenceDM(CorrespondeceType.Attachment, '', '', '', []));
    correspondenceList.add(CorrespondenceDM(CorrespondeceType.Attachment, '', '', '', []));
    correspondenceList.add(CorrespondenceDM(CorrespondeceType.Call, '', '', '', []));
    correspondenceList.add(CorrespondenceDM(CorrespondeceType.Email, '', '', '', []));
    correspondenceList.add(CorrespondenceDM(CorrespondeceType.Note, '', '', '', []));
    correspondenceList.add(CorrespondenceDM(CorrespondeceType.Note, '', '', '', []));
    correspondenceList.add(CorrespondenceDM(CorrespondeceType.Attachment, '', '', '', []));
    listCount = correspondenceList.length;
    correspondenceOriginalList = correspondenceList;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          addVerticalSpace(16),
          Flex(
            direction: _isTablet ? Axis.horizontal : Axis.vertical,
            children: [
              Text(
                "My Correspondences: $listCount",
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: fontSize24,
                    ),
              ),
              if (_isTablet) const Spacer(),
              Container(
                alignment: Alignment.centerRight,
                child: ElevatedButton.icon(
                  onPressed: () {
                    Get.to(const AddCorrespondence());
                  },
                  icon: const Icon(Icons.add, color: colorWhite),
                  label: Text(
                    addCorrespondences,
                    style: Theme.of(context).textTheme.labelLarge?.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                  ),
                ),
              ),
            ],
          ),
          addVerticalSpace(30),

          ///Show Correspondence Type Filters as horizontal list
          SizedBox(
            height: 50.0,
            child: ListView.separated(
                separatorBuilder: (context, index) {
                  return addHorizontalSpace(16);
                },
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemCount: CorrespondeceType.values.length,
                itemBuilder: (BuildContext context, int index) {
                  var correspondenceType = CorrespondeceType.values[index];
                  var isSelected = correspondenceType == selectedCorrespondenceType;
                  return GestureDetector(
                    onTap: () {
                      List<CorrespondenceDM> newList = [];

                      if (correspondenceType == CorrespondeceType.All) {
                        newList = correspondenceOriginalList;
                      } else {
                        newList = correspondenceOriginalList.where((element) => element.type == correspondenceType).toList();
                      }
                      setState(() {
                        selectedCorrespondenceType = correspondenceType;
                        correspondenceList = newList;
                      });
                    },
                    child: Container(
                      alignment: Alignment.center,
                      constraints: const BoxConstraints(minWidth: 100),
                      padding: const EdgeInsets.fromLTRB(10, 12, 10, 12),
                      decoration: isSelected ? lightBlueBorder() : documentBorder(radius: 8),
                      child: Text(
                        correspondenceType.name,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              color: isSelected ? color3A71FF : color494A54,
                              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                            ),
                      ),
                    ),
                  );
                }),
          ),

          /// Add Vertical Space
          addVerticalSpace(30),

          /// Add Sort Filters
          SizedBox(
            width: _isTablet ? MediaQuery.of(context).size.width / 2 : MediaQuery.of(context).size.width,
            child: DropDownList(
              mList: sortList,
              title: sortByDate,
              hint: sortByDate,
              onChanged: (p0) {},
            ),
          ),

          /// Add Vertical Space
          addVerticalSpace(20),

          /// Add all correspondence view
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) {
                return const SizedBox(width: 16, height: 16);
              },
              itemCount: correspondenceList.length,
              itemBuilder: (BuildContext context, int index) {
                Widget childWidget = Container();
                var correspondenceType = correspondenceList[index].type;
                if (correspondenceType == CorrespondeceType.Attachment) childWidget = const CorrespondenceAttachmentView();
                if (correspondenceType == CorrespondeceType.Call) childWidget = const CorrespondenceCallView();
                if (correspondenceType == CorrespondeceType.Note) childWidget = const CorrespondenceNoteView();
                return Container(
                  child: childWidget,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
