import 'package:bem/src/components/appbar/back_button.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/features/row/controllers/network_controller.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebView extends StatefulWidget {
  const WebView({super.key});

  @override
  State<WebView> createState() => _WebViewState();
}

class _WebViewState extends State<WebView> {
  final WebViewController _controller = WebViewController();
  bool _loading = true;
  bool showOfflineMessage = false;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    var isConnected = await NetworkController().isConnectionAvailable();
    print(isConnected);
    _controller.loadRequest(Uri.parse('https://bemsys.com/contact/'));
    _controller.setNavigationDelegate(NavigationDelegate(
      onPageFinished: (url) {
        setState(() {
          _loading = false;
          showOfflineMessage = false;
        });
      },
    ));
    if (!isConnected) {
      setState(() {
        _loading = false;
        showOfflineMessage = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: getBackButton(context, title: 'Support'),
      body: Stack(
        children: [
          WebViewWidget(controller: _controller),
          if (_loading)
            const Center(
              child: CircularProgressIndicator(),
            ),
          if (showOfflineMessage)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Image(
                    image: AssetImage('assets/images/no_internet.png'),
                    height: 48,
                    width: 48,
                  ),
                  addVerticalSpace(16),
                  Text(
                    noInternetTitle,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  addVerticalSpace(24),
                  Text(
                    noInternetMessage,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                          color: color374151,
                        ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }
}
