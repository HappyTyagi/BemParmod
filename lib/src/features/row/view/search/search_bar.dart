// Importing necessary dependencies and custom components
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/view/search/search_parcel.dart';
import 'package:bem/src/utils/device_helper.dart';
import 'package:flutter/material.dart';

// Function to create a search widget
Container searchWidget(BuildContext context) {
  // Getting the device type (phone, tablet, etc.)
  DeviceType deviceType = getDeviceType();

  // Calculating the width of the search bar based on the device type
  var searchWidth = deviceType == DeviceType.Phone ? MediaQuery.of(context).size.width - 20 : MediaQuery.of(context).size.width / 2 - 20;

  // Padding widget containing the search bar
  return Container(
    padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
    decoration: const BoxDecoration(
      boxShadow: [
        BoxShadow(
          color: colorF4F4F4, // Shadow color
          blurRadius: 5, // Blur radius
          offset: Offset(3, 8), // Offset of the shadow
        ),
      ],
    ), // Setting padding for the search bar
    child: SizedBox(
      width: searchWidth, // Setting the width of the search bar
      child: TextField(
        controller: null, // Using a TextEditingController (not implemented in this snippet)
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
              color: color6C6C6C, // Custom text color
            ),
        decoration: InputDecoration(
          filled: true, // Filling the search bar with color
          fillColor: colorWhite, // Custom fill color
          focusedBorder: textOutLineBorder(), // Applying custom border when focused
          enabledBorder: textOutLineBorder(), // Applying custom border when enabled
          contentPadding: EdgeInsets.zero, // Setting content padding to zero
          hintText: search, // Placeholder text for the search bar
          // Adding a clear button to the search bar
          suffixIcon: GestureDetector(
            onTap: () {
              showDialog(context: context, builder: (BuildContext context) => const SearchParcel()); // Showing a search dialog
            },
            child: const Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                Image(
                  image: AssetImage('assets/images/virtical_line.png'), // Icon for vertical line
                  height: 48,
                  width: 8,
                ),
                Image(
                  image: AssetImage('assets/images/search_filter.png'), // Icon for search filter
                  height: 48,
                  width: 48,
                ),
              ],
            ),
          ),
          prefixIcon: IconButton(
            icon: const Icon(
              Icons.search, // Search icon
              color: colorDCDCDC, // Custom icon color
            ),
            onPressed: () {
              // Action to perform when the search icon is pressed
            },
          ),
        ),
      ),
    ),
  );
}
