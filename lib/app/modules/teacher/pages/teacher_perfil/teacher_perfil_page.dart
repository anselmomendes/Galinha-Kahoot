import 'package:flutter/material.dart';

class TeacherPerfilPage extends StatefulWidget {
  final bool showAppBar;
  final String title;
  const TeacherPerfilPage(
      {Key key, this.title = "TeacherPerfil", this.showAppBar})
      : super(key: key);

  @override
  _TeacherPerfilPageState createState() => _TeacherPerfilPageState();
}

class _TeacherPerfilPageState extends State<TeacherPerfilPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              title: Text(widget.title),
            )
          : null,
      body: Column(
        children: <Widget>[
          Center(
            child: Text('Formulario de editar dados do cadastro'),
          )
        ],
      ),
    );
  }
}
