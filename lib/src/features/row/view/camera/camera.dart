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
import 'package:bem/src/utils/device_helper.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/route_manager.dart';

class Camera extends StatefulWidget {
  const Camera({super.key});

  @override
  State<Camera> createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  DeviceType deviceType = getDeviceType();
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool flashOn = true;

  @override
  void initState() {
    super.initState();
  }

  onflashTap() {
    setState(() {
      flashOn = !flashOn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: colorWhite,
      // decoration: backgroundImageDecoration(),
      child: Scaffold(
        key: scaffoldKey,
        appBar: AppBar(
            backgroundColor: colorBlack.withOpacity(0.6),
            scrolledUnderElevation: 0,
            leading: IconButton(
              color: color262D33,
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                color: colorWhite,
              ),
            ),
            actions: [
              IconButton(
                onPressed: onflashTap,
                icon: flashOn
                    ? const Icon(
                        Icons.flash_off,
                        color: colorWhite,
                      )
                    : const Icon(
                        Icons.flash_on,
                        color: colorWhite,
                      ),
              )
            ]),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            addVerticalSpace(40),
            headerView(context, addDocument, parcelDescription),
          ],
        ),
      ),
    );
  }
}
