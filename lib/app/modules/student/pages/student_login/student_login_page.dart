import 'package:flutter/material.dart';

class StudentLoginPage extends StatefulWidget {
  final String title;
  const StudentLoginPage({Key key, this.title = "StudentLogin"})
      : super(key: key);

  @override
  _StudentLoginPageState createState() => _StudentLoginPageState();
}

class _StudentLoginPageState extends State<StudentLoginPage> {
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
