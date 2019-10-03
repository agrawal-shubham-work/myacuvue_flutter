import 'dart:async';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class webViewCreate extends StatelessWidget {
  final String webUrl;
  Completer<WebViewController> _controller = Completer<WebViewController>();
  webViewCreate(@required this.webUrl);

  @override
  Widget build(BuildContext context) {
    return WebView(
      initialUrl: webUrl,
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller.complete(webViewController);
      },
    );
  }
}
