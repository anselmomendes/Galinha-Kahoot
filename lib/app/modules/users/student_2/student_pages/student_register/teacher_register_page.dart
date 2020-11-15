import 'package:flutter/material.dart';

class StudentRegisterPage extends StatefulWidget {
  final String title;
  const StudentRegisterPage({Key key, this.title = "StudentRegister"})
      : super(key: key);

  @override
  _StudentRegisterPageState createState() => _StudentRegisterPageState();
}

class _StudentRegisterPageState extends State<StudentRegisterPage> {
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
