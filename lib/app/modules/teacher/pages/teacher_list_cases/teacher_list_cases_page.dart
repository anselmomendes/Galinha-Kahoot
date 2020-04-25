import 'package:flutter/material.dart';

class TeacherListCasesPage extends StatefulWidget {
  final String title;
  const TeacherListCasesPage({Key key, this.title = "TeacherListCases"})
      : super(key: key);

  @override
  _TeacherListCasesPageState createState() => _TeacherListCasesPageState();
}

class _TeacherListCasesPageState extends State<TeacherListCasesPage> {
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
    // return Container();
  }
}
