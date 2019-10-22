import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

class LocalAssetWebView extends StatefulWidget {
  final String pageTitle, asssetName;
  LocalAssetWebView(this.pageTitle, this.asssetName);
  @override
  _LocalAssetWebViewState createState() => _LocalAssetWebViewState();
}

class _LocalAssetWebViewState extends State<LocalAssetWebView> {
  String webUrl;
  WebViewController _webViewController;
  Completer<WebViewController> _controller = Completer<WebViewController>();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.pageTitle),
      ),
      body: WebView(
        initialUrl: '',
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (WebViewController webViewController) {
          _webViewController = webViewController;
          _loadLocalHTML(widget.asssetName);
          _controller.complete(webViewController);
        },
      ),
    );
  }

  _loadLocalHTML(String assetName) async {
    String fileHtmlContents = await rootBundle.loadString(assetName);
    _webViewController.loadUrl(Uri.dataFromString(fileHtmlContents,
            mimeType: 'text/html', encoding: Encoding.getByName('utf-8'))
        .toString());
  }
}
