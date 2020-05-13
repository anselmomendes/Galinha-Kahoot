import 'package:flutter/material.dart';

class ClassListPage extends StatefulWidget {
  final String title;
  const ClassListPage({Key key, this.title = "ClassList"}) : super(key: key);

  @override
  _ClassListPageState createState() => _ClassListPageState();
}

class _ClassListPageState extends State<ClassListPage> {
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
