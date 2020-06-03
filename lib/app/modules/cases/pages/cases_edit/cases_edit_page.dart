import 'package:flutter/material.dart';

class CasesEditPage extends StatefulWidget {
  final String title;
  const CasesEditPage({Key key, this.title = "CasesEdit"}) : super(key: key);

  @override
  _CasesEditPageState createState() => _CasesEditPageState();
}

class _CasesEditPageState extends State<CasesEditPage> {
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
