import 'package:bem/src/components/appbar/back_button.dart';
import 'package:bem/src/components/spaces/widget_space.dart';
import 'package:bem/src/components/decorations/decorations.dart';
import 'package:bem/src/constants/app_color.dart';
import 'package:bem/src/constants/text_strings.dart';
import 'package:bem/src/utils/device_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';

class PDFViewer extends StatefulWidget {
  const PDFViewer({super.key});

  @override
  State<PDFViewer> createState() => PDFViewerState();
}

class PDFViewerState extends State<PDFViewer> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  String urlPDFPath = "";
  bool exists = true;
  int _totalPages = 0;
  int _currentPage = 0;
  bool pdfReady = false;
  late PDFViewController _pdfViewController;
  bool loaded = false;

  Future<File> getFileFromUrl(String url, {name}) async {
    var fileName = 'testonline';
    if (name != null) {
      fileName = name;
    }
    try {
      var data = await http.get(Uri.parse(url));
      var bytes = data.bodyBytes;
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/" + fileName + ".pdf");
      print(dir.path);
      File urlFile = await file.writeAsBytes(bytes);
      return urlFile;
    } catch (e) {
      throw Exception("Error opening url file");
    }
  }

  Future<void> requestPersmission() async {
    final permission = Permission.storage;

    if (await permission.isDenied) {
      await permission.request();
    }
  }

  @override
  void initState() {
    requestPersmission();
    getFileFromUrl("http://www.africau.edu/images/default/sample.pdf").then(
      (value) => {
        setState(() {
          if (value != null) {
            urlPDFPath = value.path;
            loaded = true;
            exists = true;
          } else {
            exists = false;
          }
        })
      },
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      decoration: gradiantBackground(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: transparent,
        appBar: getBackButton(context),
        body: loaded
            ? Padding(
                padding: const EdgeInsets.all(4),
                child: PDFView(
                  filePath: urlPDFPath,
                  autoSpacing: true,
                  enableSwipe: true,
                  pageSnap: true,
                  swipeHorizontal: false,
                  onError: (error) {
                    print(error);
                    showErrorToast(errorMessage);
                  },
                  onPageError: (page, error) {
                    print('$page: ${error.toString()}');
                    showErrorToast(errorMessage);
                  },
                  onViewCreated: (PDFViewController vc) {
                    _pdfViewController = vc;
                  },
                  onPageChanged: (page, total) {
                    setState(() {
                      _currentPage = page!;
                    });
                    var msg = "Page ${_currentPage + 1} of $_totalPages";
                    showToast(msg);
                  },
                  onRender: (pages) {
                    setState(() {
                      _totalPages = pages!;
                      pdfReady = true;
                    });
                  },
                ),
              )
            : Center(
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const CircularProgressIndicator(color: color3A71FF),
                    addHorizontalSpace(16),
                    const Text("Loading..."),
                  ],
                ),
              ),
      ),
    );
  }
}
