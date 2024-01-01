import 'package:bem/src/components/card/parcel_card.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/models/responseModels/parcel_response_model.dart';
import 'package:bem/src/features/row/view/search/search_bar.dart';
import 'package:flutter/material.dart';

import '../../../../utils/device_helper.dart';

class LastParcel extends StatefulWidget {
  final List<ParcelResponseModel?> parcelList;

  /// Returns the most recent parcel. Note that this does not change the state of the application it just returns the last one that was used to create the application.
  const LastParcel({Key? key, required this.parcelList}) : super(key: key);

  @override
  State<LastParcel> createState() => _LastParcelState();
}

class _LastParcelState extends State<LastParcel> {
  DeviceType deviceType = getDeviceType();

  /// Builds the widget. This is called by the build method and can be overridden to provide a more customized widget
  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.infinity,
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      decoration: gradiantBackground(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
            child: Text(lastParcels, style: Theme.of(context).textTheme.bodyMedium),
          ),
          Text(
            lastParcelDescription,
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                  color: color6F6E81,
                ),
          ),
          searchWidget(context),
          addVerticalSpace(8),
          Flexible(
            child: GridView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: deviceType == DeviceType.Phone ? 1 : 2,
                  crossAxisSpacing: 16,
                  mainAxisSpacing: 16,
                  mainAxisExtent: 360,
                ),
                itemCount: widget.parcelList.length,
                itemBuilder: (BuildContext context, int index) {
                  if (index / 2 == 0) {
                    return ParcelCard(parcelModel: widget.parcelList[index]!, showDownload: true);
                  } else {
                    return ParcelCard(parcelModel: widget.parcelList[index]!);
                  }
                }),
          ),
        ],
      ),
    );
  }
}
