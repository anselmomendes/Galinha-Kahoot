import 'package:flutter/material.dart';

class ClassDetailPage extends StatefulWidget {
  final bool showAppBar;
  final String title;
  const ClassDetailPage({Key key, this.title = "ClassDetail", this.showAppBar = true})
      : super(key: key);

  @override
  _ClassDetailPageState createState() => _ClassDetailPageState();
}

class _ClassDetailPageState extends State<ClassDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              title: Text(widget.title),
            )
          : null,
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}
