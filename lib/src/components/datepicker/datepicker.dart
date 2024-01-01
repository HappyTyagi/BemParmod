import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/utils/device_helper.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class DatePickerLabel extends StatefulWidget {
  final String title;
  String? hintText;
  late String selectedDate;
  DateTime? initialDate;

  DatePickerLabel({super.key, required this.title, required this.hintText, required this.selectedDate});
  DatePickerLabel.edit({super.key, required this.title, required this.selectedDate, required this.initialDate});

  @override
  State<DatePickerLabel> createState() => _DatePickerLabelState();
}

class _DatePickerLabelState extends State<DatePickerLabel> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.text = widget.initialDate != null ? formatedDate(widget.initialDate!) : widget.hintText!;
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
          showDatePicker(context: context, initialDate: widget.initialDate ?? DateTime.now(), firstDate: DateTime(2000), lastDate: DateTime.now()).then((value) => {
                if (value != null)
                  {
                    setState(() {
                      controller.text = formatedDate(value);
                      widget.selectedDate = formatedDate(value);
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
