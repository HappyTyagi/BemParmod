import 'package:bem/src/components/appbar/appbar.dart';
import 'package:bem/src/components/header/header.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/view/drawer/drawer_menu.dart';
import 'package:flutter/material.dart';
import 'package:styled_text/styled_text.dart';

class Notifications extends StatefulWidget {
  /// Creates and returns the instance of Notifications. This method is intended for use in tests and not part of the public API.
  ///
  ///
  /// @return the instance of Notifications which can be used for testing
  const Notifications({super.key});

  @override
  State<Notifications> createState() => _NotificationsState();
}

class _NotificationsState extends State<Notifications> with SingleTickerProviderStateMixin {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: backgroundImageDecoration(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: transparent,
        appBar: getAppBar(context, scaffoldKey, title: '', isNotificationActive: true),
        drawer: const DrawerMenu(),
        body: ListView(
          children: [
            addVerticalSpace(40),
            headerView(context, notifications, dashboardDescription),

            // ----------- Notification 1 ---------- //
            Container(
              decoration: gradiantBackground(),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(16),
                    decoration: whiteContainer(),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: colorF8F8F9,
                          ),
                          child: const Image(
                            image: AssetImage('assets/images/notification_checkcircle.png'),
                            height: 48,
                            width: 48,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "\u2022 New Notification",
                                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: colorFF7D00, fontSize: fontSize16, height: 3),
                                ),
                                StyledText(
                                    text: "You have <bold>successfully added</bold> the document to the <bold>Parcel #212112.</bold>",
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                          color: color374151,
                                          fontSize: fontSize18,
                                        ),
                                    tags: {
                                      'bold': StyledTextTag(style: const TextStyle(fontWeight: FontWeight.bold)),
                                    })
                              ],
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: StyledText(text: "10:31 <bold>AM</bold>", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: color374151, height: 3), tags: {
                            'bold': StyledTextTag(style: const TextStyle(fontWeight: FontWeight.bold)),
                          }),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: colorF8F8F9,
                          ),
                          child: const Image(
                            image: AssetImage('assets/images/notification_xcircle.png'),
                            height: 48,
                            width: 48,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 0, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "\u2022 New Notification",
                                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: colorFF7D00, fontSize: fontSize16, height: 3),
                                ),
                                StyledText(
                                    text: "You could <bold>not download </bold>the Project.",
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                          color: color374151,
                                          fontSize: fontSize18,
                                        ),
                                    tags: {
                                      'bold': StyledTextTag(style: const TextStyle(fontWeight: FontWeight.bold)),
                                    })
                              ],
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: StyledText(text: "10:29 <bold>AM</bold>", style: Theme.of(context).textTheme.titleLarge?.copyWith(color: color374151, height: 3), tags: {
                            'bold': StyledTextTag(style: const TextStyle(fontWeight: FontWeight.bold)),
                          }),
                        )
                      ],
                    ),
                  ),

                  // ----------- Notification 2 ---------- //
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: colorF8F8F9,
                          ),
                          child: const Image(
                            image: AssetImage('assets/images/notification_right.png'),
                            height: 48,
                            width: 48,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                StyledText(
                                    text: "You have <bold>successfully downloaded</bold> the parcel for offline viewing and can view <link>it here.</link>",
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: color374151, fontSize: fontSize18, height: 2),
                                    tags: {
                                      'bold': StyledTextTag(style: const TextStyle(fontWeight: FontWeight.bold)),
                                      'link': StyledTextTag(style: const TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline))
                                    })
                              ],
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: StyledText(
                            text: "09.10.2023",
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: color374151, height: 2),
                          ),
                        )
                      ],
                    ),
                  ),

                  // ----------- Notification 3 ---------- //
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: colorF8F8F9,
                          ),
                          child: const Image(
                            image: AssetImage('assets/images/notification_document.png'),
                            height: 48,
                            width: 48,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: Stack(
                              alignment: Alignment.bottomLeft,
                              children: [
                                StyledText(
                                    text: "You have <bold>added two new attachments</bold> to the <bold>Parcel #212555.</bold>",
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: color374151, fontSize: fontSize18, height: 2),
                                    tags: {
                                      'bold': StyledTextTag(style: const TextStyle(fontWeight: FontWeight.bold)),
                                      'link': StyledTextTag(style: const TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline))
                                    })
                              ],
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: StyledText(
                            text: "09.10.2023",
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: color374151, height: 2),
                          ),
                        )
                      ],
                    ),
                  ),

                  // ----------- Notification 4 ---------- //
                  Container(
                    margin: const EdgeInsets.all(8),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Container(
                          padding: const EdgeInsets.all(12),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: colorF8F8F9,
                          ),
                          child: const Image(
                            image: AssetImage('assets/images/notification_cross.png'),
                            height: 48,
                            width: 48,
                          ),
                        ),
                        Expanded(
                          flex: 1,
                          child: Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 16, 0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                StyledText(
                                    text: "You could not download the Project.",
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: color374151, fontSize: fontSize18, height: 2),
                                    tags: {
                                      'bold': StyledTextTag(style: const TextStyle(fontWeight: FontWeight.bold)),
                                      'link': StyledTextTag(style: const TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline))
                                    })
                              ],
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.topRight,
                          child: StyledText(
                            text: "09.10.2023",
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(color: color374151, height: 2),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

enum Notification_Type { add_success, add_error, download_error, download_success, new_document }
