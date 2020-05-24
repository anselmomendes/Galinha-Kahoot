import 'package:flutter/material.dart';

class ClassEditPage extends StatefulWidget {
  final String title;
  const ClassEditPage({Key key, this.title = "ClassEdit"}) : super(key: key);

  @override
  _ClassEditPageState createState() => _ClassEditPageState();
}

class _ClassEditPageState extends State<ClassEditPage> {
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
