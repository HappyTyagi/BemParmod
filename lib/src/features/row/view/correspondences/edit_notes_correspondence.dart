import 'package:bem/src/components/appbar/back_button.dart';
import 'package:bem/src/components/bottombar/save_cancel_bottom_bar.dart';
import 'package:bem/src/components/card/document_card.dart';
import 'package:bem/src/components/card/image_card.dart';
import 'package:bem/src/components/card/upload_header.dart';
import 'package:bem/src/components/datepicker/datepicker.dart';
import 'package:bem/src/components/divider/divider.dart';
import 'package:bem/src/components/dropdown/dropdown.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/components/text/common_text.dart';
import 'package:bem/src/components/text_field/label_text_field.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/components/timepicker/timepicker.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/models/dataModels/correspondence_model.dart';
import 'package:bem/src/features/row/models/dataModels/document_model.dart';
import 'package:bem/src/features/row/view/camera/camera.dart';
import 'package:bem/src/utils/device_helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/route_manager.dart';

class EditNotesCorrespondence extends StatefulWidget {
  const EditNotesCorrespondence({super.key});

  @override
  State<EditNotesCorrespondence> createState() => _EditNotesCorrespondenceState();
}

class _EditNotesCorrespondenceState extends State<EditNotesCorrespondence> {
  DeviceType deviceType = getDeviceType();
  final List<String> contactList = <String>[];
  final List<String> typeList = <String>[];
  final List<String> callDurationList = <String>[];
  String selectedDate = '';
  String selectedType = '';
  PlatformFile? file;
  List<DocumentDM> photoList = [];
  List<DocumentDM> cameraImageList = [];
  List<DocumentDM> documentList = [];
  List<DocumentDM> audioList = [];
  bool takeCameraPicture = false;

  @override
  void initState() {
    super.initState();
    contactList.add('John Green');
    typeList.add(email);
    typeList.add(call);
    typeList.add(note);
    typeList.add(attachment);

    callDurationList.add("1 min");
    callDurationList.add("2 min");
    callDurationList.add("3 min");
    callDurationList.add("4 min");
    callDurationList.add("5 min");
    callDurationList.add("10 min");
    callDurationList.add("15 min");
    callDurationList.add("20 min");
    callDurationList.add("30 min");
  }

  Future<void> browsePhoto() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.image,
    );

    if (result != null) {
      file = result.files.first;
      if (takeCameraPicture) {
        setState(() {
          cameraImageList.add(DocumentDM.add(file!.path, file!.name, getFileSize(file!.size), getCurrentDate(), 0, true, false));
        });
      } else {
        setState(() {
          photoList.clear();
        });
        Future.delayed(const Duration(milliseconds: 100), () {
          setState(() {
            photoList.add(DocumentDM.add(file!.path, file!.name, getFileSize(file!.size), getCurrentDate(), 0, true, false));
          });
        });
      }
    }
  }

  Future<void> browseDocument() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['docx', 'pdf']);
    if (result != null) {
      file = result.files.first;

      var contain = documentList.where((element) => element.imagePath == file!.path);
      if (contain.isEmpty) {
        setState(() {
          documentList.add(DocumentDM.add(file!.path, file!.name, getFileSize(file!.size), getCurrentDate(), 0, true, false));
        });
      } else {
        showToast("File exist");
      }
    }
  }

  Future<void> browseAudio() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['mp3', 'aac', 'wav']);
    if (result != null) {
      file = result.files.first;

      var contain = audioList.where((element) => element.imagePath == file!.path);
      if (contain.isEmpty) {
        setState(() {
          audioList.add(DocumentDM.add(file!.path, file!.name, getFileSize(file!.size), getCurrentDate(), 0, true, false));
        });
      } else {
        showToast("File exist");
      }
    }
  }

  openBottomSheetView() {
    takeCameraPicture = true;
    showModalBottomSheet(
      context: context,
      constraints: const BoxConstraints(
        maxWidth: double.infinity,
      ),
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Container(
              height: 300,
              width: double.infinity,
              color: colorWhite,
              padding: const EdgeInsets.fromLTRB(16, 16, 0, 24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0, 0, 16, 16),
                    child: Row(
                      children: [
                        Text(photo, style: Theme.of(context).textTheme.headlineSmall),
                        const Spacer(),
                        GestureDetector(
                            onTap: () {
                              takeCameraPicture = true;
                              browsePhoto();
                            },
                            child: Row(
                              children: [
                                Text(seeAll, style: Theme.of(context).textTheme.bodySmall?.copyWith(color: color3A71FF)),
                                const Padding(
                                  padding: EdgeInsets.only(left: 4),
                                  child: Icon(
                                    Icons.arrow_forward_ios_rounded,
                                    color: color3A71FF,
                                    size: 16,
                                  ),
                                ),
                              ],
                            )),
                      ],
                    ),
                  ),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 200,
                          height: 180,
                          child: GestureDetector(
                            onTap: () {
                              Get.to(const Camera());
                            },
                            child: const Image(
                              image: AssetImage('assets/images/picture.png'),
                              height: 200,
                              width: 180,
                            ),
                          ),
                        ),
                        addHorizontalSpace(8),
                        Row(
                            children: cameraImageList
                                .map(
                                  (photo) => Padding(
                                    padding: const EdgeInsets.only(right: 8),
                                    child: ImageCard.camera(
                                      document: photo,
                                    ),
                                  ),
                                )
                                .toList()),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
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
            body: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(40),
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Row(
                    children: [
                      Text("File Name", style: Theme.of(context).textTheme.displayMedium),
                      addHorizontalSpace(24),
                      addFileTypeText(context, note, color00A86B),
                    ],
                  ),
                ),

                addVerticalSpace(4),

                addHorizontalDivider(),

                //---------- Main Information Section -----------//
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(mainInformation, style: Theme.of(context).textTheme.bodyMedium),
                      addVerticalSpace(16),
                      Text(mainTabDescription, style: Theme.of(context).textTheme.displaySmall),
                      // addVerticalSpace(16),
                    ],
                  ),
                ),

                //---------- Input Fields Section -----------//
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: StaggeredGrid.count(
                      crossAxisCount: 1,
                      mainAxisSpacing: 16,
                      crossAxisSpacing: 16,
                      children: [
                        LabelTextField(
                          title: name,
                          hintText: fileNameHint,
                          onTap: () {},
                          validator: (value) {},
                        ),
                        addVerticalSpace(16),

                        //---------- Notes Section -----------//
                        LabelTextField.min(
                          title: note,
                          hintText: note,
                          onTap: () {},
                          validator: (value) {},
                          minimumLine: 3,
                        ),
                      ],
                    ),
                  ),
                ),

                addVerticalSpace(8),

                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      addHorizontalDivider(),
                      SaveCancelView(
                        onClick: () {},
                      )
                    ],
                  ),
                ),
              ],
            ),
          ));
    });
  }
}
