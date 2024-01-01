import 'package:bem/src/components/buttons/common_buttons.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/components/divider/divider.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/components/text/common_text.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/sizes.dart';
import 'package:bem/src/features/row/models/dataModels/document_model.dart';
import 'package:bem/src/features/row/view/contacts/edit_contact.dart';
import 'package:bem/src/services/logger/logging_service.dart';
import 'package:bem/src/utils/device_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class ContactCard extends StatefulWidget {
  final DocumentDM document;
  final bool isTablet;

  /// Creates contact card for this request. Note that it is up to the caller to make sure the request is valid before calling this method.
  ///
  ///
  /// @return the contact card for this request or null if it cannot be created for some reason ( such as missing or invalid
  const ContactCard({super.key, required this.document, required this.isTablet});

  @override
  State<ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<ContactCard> {
  /// Builds the widget. Subclasses should override this method to provide their own rendering. It is expected that the widget is built in a way that's the responsibility of the caller to ensure that it is not modified by other methods that depend on it.
  ///
  /// @param context - the context in which the widget is built.
  ///
  /// @return the widget to be rendered to the user.dart or null if it could not be rendered to the user.dart due to lack of context
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: backgroundShadow(radius: 16),
      child: ExpansionTile(
        tilePadding: const EdgeInsets.all(16),
        shape: const RoundedRectangleBorder(
          side: BorderSide(color: colorDCDCDC, width: 1),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        collapsedShape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.white,
          ),
          borderRadius: BorderRadius.all(Radius.circular(16)),
        ),
        collapsedBackgroundColor: colorWhite,
        collapsedIconColor: colorBlack,

        title: Flex(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          direction: widget.isTablet ? Axis.horizontal : Axis.vertical,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      'John Green',
                      style: Theme.of(context).textTheme.headlineSmall?.copyWith(color: colorBlack, fontSize: fontSize16, height: 3),
                    ),
                    addHorizontalSpace(16),
                    addFileTypeText(context, 'Tenant', colorFF7D00),
                  ],
                ),
                addVerticalSpace(8),
                Flex(
                  direction: widget.isTablet ? Axis.horizontal : Axis.vertical,
                  children: [
                    GestureDetector(
                      onTap: () {
                        LoggingService.logDebug("Clicked email---");
                        launchEmail("emailname@mail.com");
                      },
                      /**
                      * Renders the text to be displayed in the call. It's a wrapper around the TextSpan that is used to populate the label.
                      * 
                      * @param email_outlined
                      * @param color - the color of the text.
                      * @param text - con the theme to be used.
                      * @param context
                      * 
                      * @return the text that is displayed in the call. It's a wrapper around TextSpan that is used to populate the label
                      */
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Image(image: AssetImage('assets/images/email.png'), height: 20, width: 20, color: color494A54),
                            ),
                            TextSpan(
                              text: "   emailname@mail.com",
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                    color: color494A54,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    addHorizontalSpace(30),
                    GestureDetector(
                      onTap: () {
                        LoggingService.logDebug("Clicked call---");
                        launchCall("+1 (484) 500 00 234");
                      },
                      /**
                      * A heading to the phone. It is used for tablets but not for phone - based ones.
                      * 
                      * @param color494A54 - color of the heading.
                      * @param isTablet
                      * 
                      * @return RichText with headlines of phone - based ones. Note that this RichText will be in fullscreen
                      */
                      child: RichText(
                        text: TextSpan(
                          children: [
                            const WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Image(image: AssetImage('assets/images/call.png'), height: 20, width: 20, color: color494A54),
                            ),
                            TextSpan(
                              text: " +1 (484) 500 00 234",
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                    color: color494A54,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            /**
            * Spacer for editing contacts. The button will be placed in the center of the container. Note that this is a static method and should not be called by user code.
            * 
            * @param centerRight - alignment Alignment to place the edit button. Default is Align#
            * @param editButton
            * 
            * @return Spacer that will be positioned to the right of the edit button or null if there is no edit button
            */
            if (widget.isTablet) const Spacer(),
            Container(
                alignment: Alignment.centerRight,
                child: editButton(() {
                  Get.to(() => const EditContact());
                })),
          ],
        ),
        //subtitle: Text('Trailing expansion arrow icon'),
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: addHorizontalDivider(),
          ),

          /// Address 1
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(24, 8, 8, 8),
            child: Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 20, color: color6C6C6C),
                Text(
                  "  25B Petra Sagaidachnoho Street, California, USA",
                  /**
                  * Copy with color and size. Used for text theme. It's a good example of how to use theme.
                  * 
                  * @param color374151 - Color of the text. Must be #RRGGBB
                  * @param fontSize18 - Size of the font.
                  * @param alignment - Alignment of the text
                  * @param fromLTRB
                  */
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: color374151,
                        fontSize: fontSize18,
                      ),
                )
              ],
            ),
          ),

          /// Address 2
          Container(
            alignment: Alignment.topLeft,
            padding: const EdgeInsets.fromLTRB(24, 8, 8, 8),
            child: Row(
              children: [
                const Icon(Icons.location_on_outlined, size: 20, color: color6C6C6C),
                Text(
                  "  25B Petra Sagaidachnoho Street, California, USA",
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        color: color374151,
                        fontSize: fontSize18,
                      ),
                )
              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(left: 16, right: 16),
            child: addHorizontalDivider(),
          ),

          /// Notes
          Padding(
            padding: const EdgeInsets.all(16),
            child: Text(
              "Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    color: color494A54,
                  ),
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }
}
