import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class DetailScreen extends StatefulWidget {
  final String link;
  DetailScreen( this.link);


  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body:WebView(
        javascriptMode: JavascriptMode.unrestricted,
        initialUrl: widget.link,
      )



    );
  }
}
