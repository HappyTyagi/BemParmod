import 'package:bem/src/components/appbar/back_button.dart';
import 'package:bem/src/components/bottombar/save_cancel_bottom_bar.dart';
import 'package:bem/src/components/card/document_card.dart';
import 'package:bem/src/components/card/image_card.dart';
import 'package:bem/src/components/card/upload_header.dart';
import 'package:bem/src/components/datepicker/datepicker.dart';
import 'package:bem/src/components/divider/divider.dart';
import 'package:bem/src/components/dropdown/dropdown.dart';
import 'package:bem/src/components/header/header.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/components/text_field/label_text_field.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/components/timepicker/timepicker.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/models/dataModels/document_model.dart';
import 'package:bem/src/features/row/view/camera/camera.dart';
import 'package:bem/src/utils/device_helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/route_manager.dart';

class AddCorrespondence extends StatefulWidget {
  const AddCorrespondence({super.key});

  @override
  State<AddCorrespondence> createState() => _AddCorrespondenceState();
}

class _AddCorrespondenceState extends State<AddCorrespondence> {
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
                                .map((photo) => Padding(
                                      padding: const EdgeInsets.only(right: 8),
                                      child: ImageCard.camera(
                                        document: photo,
                                      ),
                                    ))
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
            body: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  addVerticalSpace(40),
                  headerView(context, addCorrespondences, parcelDescription),
                  addVerticalSpace(4),
                  addHorizontalDivider(),
                  Container(
                    padding: const EdgeInsets.all(16),
                    child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      //---------- Main Information Section -----------//

                      Text(mainInformation, style: Theme.of(context).textTheme.bodyMedium),
                      addVerticalSpace(16),
                      Text(mainTabDescription, style: Theme.of(context).textTheme.displaySmall),
                      addVerticalSpace(16),

                      //---------- Input Fields Section -----------//

                      StaggeredGrid.count(
                        crossAxisCount: deviceType == DeviceType.Phone ? 1 : 3,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        children: [
                          LabelTextField(
                            title: name,
                            hintText: nameHint,
                            onTap: () {},
                            validator: (value) {},
                          ),
                          DropDownList(
                            mList: contactList,
                            title: contact,
                            hint: contactHint,
                            onChanged: (p0) {},
                          ),
                          DropDownList(
                            mList: typeList,
                            title: type,
                            hint: typeHint,
                            onChanged: (p0) {},
                          ),
                          TimePickerLabel(
                            hintText: timeHint,
                            title: time,
                            selectedTime: selectedDate,
                          ),
                          DropDownList(
                            mList: callDurationList,
                            title: callDuration,
                            hint: callDurationHint,
                            onChanged: (p0) {},
                          ),
                          DatePickerLabel(
                            hintText: dateHint,
                            title: date,
                            selectedDate: selectedDate,
                          ),
                        ],
                      ),

                      //---------- Notes Section -----------//
                      addVerticalSpace(16),
                      LabelTextField.min(
                        title: note,
                        hintText: note,
                        onTap: () {},
                        validator: (value) {},
                        minimumLine: 3,
                      ),
                      addVerticalSpace(16),
                      addHorizontalDivider(),
                      addVerticalSpace(16),

                      //---------- Upload Section -----------//

                      Text(upload, style: Theme.of(context).textTheme.bodyMedium),
                      addVerticalSpace(16),
                      Text(uploadDescription, style: Theme.of(context).textTheme.displaySmall),
                      addVerticalSpace(16),

                      //---------- Upload Photo Section -----------//
                      UploadHeader.photo(
                        onBrowse: () {
                          takeCameraPicture = false;
                          browsePhoto();
                        },
                        onCameraPressed: openBottomSheetView,
                        onUploadPressed: () {
                          print('Photo upload Pressed');
                        },
                      ),
                      if (photoList.isNotEmpty) addVerticalSpace(16),
                      Row(
                          children: photoList
                              .map((photo) => ImageCard(
                                    document: photo,
                                    onDeletePressed: () {
                                      setState(() {
                                        photoList.clear();
                                      });
                                    },
                                  ))
                              .toList()),

                      //---------- Upload Document Section -----------//
                      addVerticalSpace(16),
                      UploadHeader.document(
                        onBrowse: browseDocument,
                        onUploadPressed: () {
                          print('Document upload Pressed');
                        },
                      ),
                      if (documentList.isNotEmpty) addVerticalSpace(16),

                      StaggeredGrid.count(
                          crossAxisCount: deviceType == DeviceType.Phone ? 1 : 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          children: documentList
                              .map((document) => DocumentCard.addDocument(
                                    document: document,
                                    onDeletePressed: () {
                                      setState(() {
                                        documentList.clear();
                                      });
                                    },
                                  ))
                              .toList()),

                      //---------- Upload Audio Section -----------//
                      addVerticalSpace(16),
                      UploadHeader.audio(
                        onBrowse: browseAudio,
                        onUploadPressed: () {
                          print('Audio upload Pressed');
                        },
                      ),

                      if (audioList.isNotEmpty) addVerticalSpace(16),

                      StaggeredGrid.count(
                          crossAxisCount: deviceType == DeviceType.Phone ? 1 : 2,
                          mainAxisSpacing: 16,
                          crossAxisSpacing: 16,
                          children: audioList
                              .map((audioFile) => DocumentCard.addAudio(
                                    document: audioFile,
                                    onDeletePressed: () {
                                      setState(() {
                                        audioList.remove(audioFile);
                                      });
                                    },
                                  ))
                              .toList()),
                    ]),
                  ),
                  addHorizontalDivider(),
                  SaveCancelView(
                    onClick: () {},
                    title: addCorrespondences,
                  ),
                ],
              ),
            ),
          ));
    });
  }
}
