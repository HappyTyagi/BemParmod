import 'package:bem/src/components/alerts/delete_alert.dart';
import 'package:bem/src/components/buttons/common_buttons.dart';
import 'package:bem/src/components/divider/divider.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/components/text/common_text.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/view/parcel_details/parcel_details.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class MapParcelDetailsPin extends StatelessWidget {
  final bool showDownload;
  final VoidCallback onClick;
  const MapParcelDetailsPin({super.key, required String name, required this.onClick, this.showDownload = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: whiteContainer(),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.all(16),
            child: Row(
              children: <Widget>[
                statusContainer(context, status),
                const Spacer(),
                showDownload
                    ? Container(
                        decoration: whiteContainer(radius: 12),
                        padding: const EdgeInsets.fromLTRB(8, 8, 8, 4),
                        child: GestureDetector(
                          onTap: () {
                            showDeleteParcelAlert(context);
                          },
                          child: const Image(
                            image: AssetImage('assets/images/delete.png'),
                            height: 24,
                            width: 24,
                          ),
                        ),
                      )
                    : Container(
                        decoration: documentBorder(radius: 12),
                        padding: const EdgeInsets.all(8),
                        child: const Image(
                          image: AssetImage('assets/images/downloaded_active.png'),
                          height: 20,
                          width: 20,
                          color: color3A71FF,
                        ),
                      ),
              ],
            ),
          ),
          addVerticalSpace(8),
          locationText(context, "California, USA"),
          addVerticalSpace(20),
          Row(
            children: <Widget>[
              Text(
                "#218093",
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                      color: color374151,
                    ),
              ),
              const Spacer(), // use Spacer
              RichText(
                text: TextSpan(
                  text: "\u2022",
                  style: Theme.of(context).textTheme.displaySmall?.copyWith(
                        color: colorFF7D00,
                        fontWeight: FontWeight.w900,
                      ),
                  children: [
                    TextSpan(
                      text: " Project #213154",
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            color: color6C6C6C,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          addVerticalSpace(16),
          Row(
            children: <Widget>[
              Text(
                "Owner Name",
                style: Theme.of(context).textTheme.titleLarge?.copyWith(color: color374151, fontSize: fontSize18),
              ),
              const Spacer(), // use Spacer
              arrowButton(() {
                Get.to(const ParcelDetails());
              })
            ],
          ),
          addVerticalSpace(16),
          addHorizontalDivider(),
          addVerticalSpace(16),
          GestureDetector(
            onTap: onClick,
            child: Container(
              padding: const EdgeInsets.fromLTRB(24, 16, 24, 16),
              decoration: textBorder(radius: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'Get Direction',
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                          color: color3A71FF,
                        ),
                  ),
                  addHorizontalSpace(8),
                  const Image(
                    image: AssetImage('assets/images/direction_arrow.png'),
                    height: 20,
                    width: 20,
                    color: color3A71FF,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
