import 'package:bem/src/components/appbar/back_button.dart';
import 'package:bem/src/components/bottombar/save_cancel_bottom_bar.dart';
import 'package:bem/src/components/card/document_card.dart';
import 'package:bem/src/components/card/upload_header.dart';
import 'package:bem/src/components/divider/divider.dart';
import 'package:bem/src/components/header/header.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/models/dataModels/document_model.dart';
import 'package:bem/src/utils/device_helper.dart';
import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';

class AddDocument extends StatefulWidget {
  const AddDocument({super.key});

  @override
  State<AddDocument> createState() => _AddDocumentState();
}

class _AddDocumentState extends State<AddDocument> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PlatformFile? file;
  List<DocumentDM> ducuments = [];

  @override
  void initState() {
    ducuments.add(DocumentDM.add('', 'Price Information', '2 MB', '10.19.2023', 0, true, false));
    ducuments.add(DocumentDM.add('', 'Parcel Summery', '3 MB', '11.07.2023', 0, false, true));
    ducuments.add(DocumentDM.add('', 'Parcel Summery', '3 MB', '11.07.2023', 0, false, false));
    super.initState();
  }

  Future<void> pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles();
    if (result != null) {
      file = result.files.first;

      var contain = ducuments.where((element) => element.imagePath == file!.path);
      if (contain.isEmpty) {
        setState(() {
          ducuments.add(DocumentDM.add(file!.path, file!.name, getFileSize(file!.size), getCurrentDate(), 0, true, false));
        });
      } else {
        showToast("File exist");
      }
    }
  }

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
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addVerticalSpace(40),
            headerView(context, addDocument, parcelDescription),
            addVerticalSpace(4),
            addHorizontalDivider(),
            addVerticalSpace(8),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Text(
                documents,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      fontSize: fontSize24,
                    ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Text(documentDescription, style: Theme.of(context).textTheme.displaySmall),
            ),

            //--------------- Document Header Section ----------//
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: UploadHeader.document(
                onBrowse: pickFile,
                onUploadPressed: () {
                  print('Document upload Pressed');
                },
              ),
            ),

            Expanded(
              child: ListView.builder(
                  itemCount: ducuments.length,
                  itemBuilder: (BuildContext context, int index) => Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: DocumentCard(document: ducuments[index]),
                      )),
            ),
            addHorizontalDivider(),
            SaveCancelView(onClick: () {}),
          ],
        ),
      ),
    );
  }
}
