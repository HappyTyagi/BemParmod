import 'package:bem/src/components/appbar/back_button.dart';
import 'package:bem/src/components/bottombar/save_cancel_bottom_bar.dart';
import 'package:bem/src/components/divider/divider.dart';
import 'package:bem/src/components/dropdown/dropdown.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/components/text_field/label_text_field.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/utils/device_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class Address extends StatefulWidget {
  final bool isEditMode;
  final String initialAddress;

  // Constructor for adding a new address
  Address.add()
      : isEditMode = false,
        initialAddress = '';

  // Constructor for editing an existing address
  Address.edit({required this.initialAddress}) : isEditMode = true;

  @override
  _AddressState createState() => _AddressState();
}

class _AddressState extends State<Address> {
  var isTabletDevice = isTablet();
  var title = 'Add Address';
  late bool isCompany;
  late bool isPrimaryContact;
  final List<String> stateList = <String>[];

  @override
  void initState() {
    super.initState();
    if (widget.isEditMode) {
      title = 'Edit Address';
    }
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
          body: Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                addVerticalSpace(24),
                Text(
                  title,
                  style: Theme.of(context).textTheme.displayMedium?.copyWith(
                        color: color2E2E2E,
                      ),
                ),
                addVerticalSpace(8),
                addHorizontalDivider(),
                addVerticalSpace(40),
                Expanded(
                  child: StaggeredGrid.count(
                    crossAxisCount: isTabletDevice ? 3 : 1,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    children: [
                      DropDownList(
                        mList: stateList,
                        title: state,
                        hint: stateHint,
                        onChanged: (p0) {},
                      ),
                      LabelTextField(
                        title: city,
                        hintText: cityHint,
                        onTap: () {},
                        validator: (value) {},
                      ),
                      LabelTextField(
                        title: zipcode,
                        hintText: zipcodeHint,
                        onTap: () {},
                        validator: (value) {},
                      ),
                    ],
                  ),
                ),

                // SaveCancelView moved outside SingleChildScrollView
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      addHorizontalDivider(),
                      SaveCancelView(
                        onClick: () {},
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }
}
