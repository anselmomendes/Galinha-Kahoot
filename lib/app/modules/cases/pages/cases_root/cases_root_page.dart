import 'package:flutter/material.dart';

class CasesRootPage extends StatefulWidget {
  final String title;
  const CasesRootPage({Key key, this.title = "CasesRoot"}) : super(key: key);

  @override
  _CasesRootPageState createState() => _CasesRootPageState();
}

class _CasesRootPageState extends State<CasesRootPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
