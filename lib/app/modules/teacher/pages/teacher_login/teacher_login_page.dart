import 'package:flutter/material.dart';

class TeacherLoginPage extends StatefulWidget {
  final String title;
  const TeacherLoginPage({Key key, this.title = "TeacherLogin"})
      : super(key: key);

  @override
  _TeacherLoginPageState createState() => _TeacherLoginPageState();
}

class _TeacherLoginPageState extends State<TeacherLoginPage> {
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
