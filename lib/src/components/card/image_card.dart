import 'dart:io';
import 'package:bem/src/components/buttons/common_buttons.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/features/row/models/dataModels/document_model.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class ImageCard extends StatefulWidget {
  final DocumentDM document;
  void Function()? onDeletePressed;
  bool isCameraImage = false;
  ImageCard({super.key, required this.document, required this.onDeletePressed});
  ImageCard.camera({super.key, required this.document, this.isCameraImage = true});

  @override
  State<ImageCard> createState() => _ImageCardState();
}

class _ImageCardState extends State<ImageCard> {
  File? file;
  bool isSelected = false;

  @override
  void initState() {
    file = File(widget.document.imagePath!);
    isSelected = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 175,
        decoration: documentBorder(),
        child: DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: Colors.grey,
            image: DecorationImage(image: FileImage(file!), fit: BoxFit.cover),
          ),
          child: Align(
              alignment: Alignment.topRight,
              child: Padding(
                padding: widget.isCameraImage ? const EdgeInsets.all(2) : const EdgeInsets.all(8),
                child: widget.isCameraImage
                    ? Transform.scale(
                        scale: 1.5,
                        child: Checkbox(
                          checkColor: Colors.blue,
                          fillColor: MaterialStateProperty.all(isSelected ? colorWhite : transparent),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0), // CHANGE BORDER RADIUS HERE
                          ),
                          side: const BorderSide(width: 2, color: colorWhite),
                          value: isSelected,
                          onChanged: (bool? value) {
                            setState(() {
                              isSelected = value!;
                            });
                          },
                        ))
                    : deleteButton(widget.onDeletePressed),
              )),
        ));
  }
}
