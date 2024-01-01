import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:flutter/material.dart';

class DropDownList extends StatefulWidget {
  final List<String> mList;
  final String title;
  final String hint;
  String? selectedValue;
  final Function(String?) onChanged;
  late GlobalKey<FormState>? formKey;
  bool enabledDropdown = true;

  DropDownList({super.key, required this.mList, required this.title, required this.hint, required this.onChanged, this.formKey = null});
  DropDownList.valodate({super.key, required this.mList, required this.title, required this.hint, required this.onChanged, required this.formKey});
  DropDownList.selected(
      {super.key, required this.mList, required this.title, required this.hint, required this.onChanged, this.formKey = null, required this.selectedValue, bool enabledDropdown = false})
      : enabledDropdown = enabledDropdown;

  @override
  State<DropDownList> createState() => _DropDownListState();
}

class _DropDownListState extends State<DropDownList> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: widget.formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                  color: widget.enabledDropdown ? color262D33 : color6C6C6C,
                  fontSize: fontSize14,
                  fontWeight: widget.enabledDropdown ? FontWeight.w600 : FontWeight.w500,
                ),
          ),
          addVerticalSpace(4),
          DropdownButtonFormField(
            items: widget.mList.map<DropdownMenuItem<String>>((String value) {
              return DropdownMenuItem<String>(
                value: value,
                child: Text(
                  value,
                  style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                        color: color2E2E2E,
                      ),
                ),
              );
            }).toList(),
            value: widget.selectedValue,
            autovalidateMode: AutovalidateMode.onUserInteraction,
            onChanged: widget.enabledDropdown ? widget.onChanged : null,
            validator: (value) => value == null ? '${widget.title} is required.' : null,
            hint: Text(widget.hint, style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: colorABABAB, fontSize: fontSize14)),
            iconSize: 30,
            dropdownColor: Colors.white,
            decoration: const InputDecoration(
              contentPadding: EdgeInsets.all(8),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: colorDCDCDC,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: colorDCDCDC,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
              errorBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: colorRed,
                ),
                borderRadius: BorderRadius.all(Radius.circular(8)),
              ),
            ),
          )
        ],
      ),
    );
  }
}
