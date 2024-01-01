import 'package:bem/src/components/buttons/common_buttons.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/utils/device_helper.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class UploadHeader extends StatefulWidget {
  late UploadType uploadType;
  late String imageUrl;
  late String title;
  late String description;
  void Function()? onUploadPressed;
  void Function()? onCameraPressed;
  void Function()? onBrowse;

  UploadHeader.photo({
    super.key,
    required this.onUploadPressed,
    required this.onCameraPressed,
    required this.onBrowse,
    this.uploadType = UploadType.photo,
    this.imageUrl = 'assets/images/photo.png',
    this.title = photoTitle,
    this.description = photoDescription,
  });
  UploadHeader.document({
    super.key,
    required this.onUploadPressed,
    required this.onBrowse,
    this.uploadType = UploadType.document,
    this.imageUrl = 'assets/images/document_head.png',
    this.title = documentTitle,
    this.description = documentHeaderDescription,
  });

  UploadHeader.audio({
    super.key,
    required this.onUploadPressed,
    required this.onBrowse,
    this.uploadType = UploadType.audio,
    this.imageUrl = 'assets/images/microphone.png',
    this.title = audioTitle,
    this.description = audioDescription,
  });

  @override
  State<UploadHeader> createState() => _UploadHeaderState();
}

class _UploadHeaderState extends State<UploadHeader> {
  DeviceType deviceType = getDeviceType();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: colorD7E2FF.withOpacity(0.15), borderRadius: BorderRadius.circular(16), border: Border.all(color: colorEEEEEE)),
      child: Flex(direction: deviceType == DeviceType.Tablet ? Axis.horizontal : Axis.vertical, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        GestureDetector(
          onTap: widget.onBrowse,
          child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Image(
              image: AssetImage(widget.imageUrl),
              height: 60,
              width: 60,
            ),
            addHorizontalSpace(16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: colorBlack, fontSize: fontSize16, height: 2),
                  overflow: TextOverflow.ellipsis,
                ),
                Text(
                  widget.description,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                        color: color494A54,
                      ),
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            )
          ]),
        ),
        Container(
          alignment: Alignment.centerRight,
          child: Wrap(
            children: [
              if (widget.uploadType == UploadType.photo) cameraButton(widget.onCameraPressed),
              addHorizontalSpace(16),
              uploadButton(widget.onUploadPressed),
            ],
          ),
        ),
      ]),
    );
  }
}

enum UploadType { photo, document, audio }
