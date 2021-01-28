import 'package:flutter/material.dart';
import 'package:grocery/util/constant.dart';
import 'package:webview_flutter/webview_flutter.dart';

class Terms extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: Constant.baseurl,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
