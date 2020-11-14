import 'package:flutter/material.dart';

class TeacherRegisterPage extends StatefulWidget {
  final String title;
  const TeacherRegisterPage({Key key, this.title = "TeacherRegister"})
      : super(key: key);

  @override
  _TeacherRegisterPageState createState() => _TeacherRegisterPageState();
}

class _TeacherRegisterPageState extends State<TeacherRegisterPage> {
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
