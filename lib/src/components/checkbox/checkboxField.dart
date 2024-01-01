import 'package:bem/src/constants/app_color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CheckBoxField extends StatefulWidget {
  final String title;
  late Function(bool?)? onChanged = (p0) {};
  bool isActive = true;
  final bool value;
  CheckBoxField({super.key, required this.title, required this.onChanged, required this.value});

  CheckBoxField.disabled({super.key, required this.title, required this.value, this.isActive = false});

  @override
  State<CheckBoxField> createState() => _CheckBoxFieldState();
}

class _CheckBoxFieldState extends State<CheckBoxField> {
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Transform.translate(
        offset: const Offset(-8, 0),
        child: Checkbox(
          value: widget.value,
          onChanged: widget.onChanged,
          activeColor: widget.isActive ? color3A71FF : colorABABAB,
          materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
        ),
      ),
      Text(
        widget.title,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: widget.isActive ? color2E2E2E : colorABABAB,
            ),
      ),
    ]);
  }
}
