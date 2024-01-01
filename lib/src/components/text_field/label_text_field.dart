import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class LabelTextField extends StatefulWidget {
  final String title;
  final String hintText;
  final VoidCallback onTap;
  final FormFieldValidator validator;
  late int minimumLine = 1;
  LabelTextField({super.key, required this.title, required this.hintText, required this.onTap, required this.validator});

  LabelTextField.min({super.key, required this.title, required this.hintText, required this.onTap, required this.validator, required this.minimumLine});

  @override
  State<LabelTextField> createState() => _LabelTextFieldState();
}

class _LabelTextFieldState extends State<LabelTextField> {
  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        widget.title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: color262D33, fontSize: fontSize14),
      ),
      addVerticalSpace(4),
      TextFormField(
        validator: widget.validator,
        onTap: widget.onTap,
        maxLines: widget.minimumLine,
        minLines: widget.minimumLine,
        decoration: textInputDecoration(widget.hintText),
      ),
    ]);
  }
}
