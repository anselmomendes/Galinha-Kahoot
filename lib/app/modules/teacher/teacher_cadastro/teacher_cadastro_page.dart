import 'package:flutter/material.dart';

class TeacherCadastroPage extends StatefulWidget {
  final String title;
  const TeacherCadastroPage({Key key, this.title = "TeacherCadastro"})
      : super(key: key);

  @override
  _TeacherCadastroPageState createState() => _TeacherCadastroPageState();
}

class _TeacherCadastroPageState extends State<TeacherCadastroPage> {
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
