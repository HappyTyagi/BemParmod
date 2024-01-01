import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/utils/device_helper.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TimePickerLabel extends StatefulWidget {
  final String title;
  String? hintText;
  TimeOfDay? initialTime;
  late String selectedTime;

  TimePickerLabel({super.key, required this.title, required this.hintText, required this.selectedTime});

  TimePickerLabel.edit({super.key, required this.title, required this.selectedTime, required this.initialTime});

  @override
  State<TimePickerLabel> createState() => _TimePickerLabelState();
}

class _TimePickerLabelState extends State<TimePickerLabel> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.initialTime != null ? formatTimeOfDay(widget.initialTime!) : widget.hintText!;
  }

  @override
  Widget build(BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        widget.title,
        style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: color262D33, fontSize: fontSize14),
      ),
      addVerticalSpace(4),
      TextField(
        controller: controller,
        onTap: () {
          showTimePicker(context: context, initialTime: widget.initialTime ?? TimeOfDay.now()).then((value) => {
                if (value != null)
                  {
                    setState(() {
                      controller.text = value.format(context);
                      widget.selectedTime = value.format(context);
                    })
                  }
              });
        },
        readOnly: true,
        decoration: InputDecoration(
          hintText: widget.hintText,
          contentPadding: const EdgeInsets.all(8),
          focusedBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: colorDCDCDC,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          enabledBorder: const OutlineInputBorder(
              borderSide: BorderSide(
                color: colorDCDCDC,
              ),
              borderRadius: BorderRadius.all(Radius.circular(8))),
          suffixIcon: const Icon(Icons.arrow_drop_down, size: 30),
        ),
      ),
    ]);
  }
}
