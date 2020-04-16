import 'package:flutter/material.dart';

class StudentCadastroPage extends StatefulWidget {
  final String title;
  const StudentCadastroPage({Key key, this.title = "StudentCadastro"})
      : super(key: key);

  @override
  _StudentCadastroPageState createState() => _StudentCadastroPageState();
}

class _StudentCadastroPageState extends State<StudentCadastroPage> {
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
