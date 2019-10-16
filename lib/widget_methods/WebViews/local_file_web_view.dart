import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LocalAssetWebView extends StatefulWidget {
  @override
  _LocalAssetWebViewState createState() => _LocalAssetWebViewState();
}

class _LocalAssetWebViewState extends State<LocalAssetWebView> {
  WebViewController _controller;

  @override
  Widget build(BuildContext context) {
    _loadHtmlFromAssets();
    return WebView(
      initialUrl: '',
      javascriptMode: JavascriptMode.unrestricted,
      onWebViewCreated: (WebViewController webViewController) {
        _controller = webViewController;
      },
    );
  }

  _loadHtmlFromAssets() async {
    String fileText = await rootBundle.loadString('assets/TermsOfUse.html');
    _controller.loadUrl(Uri.dataFromString(fileText,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
