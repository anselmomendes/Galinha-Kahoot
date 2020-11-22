import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'teacher_relatorio_controller.dart';

class TeacherRelatorioPage extends StatefulWidget {
  final String title;
  const TeacherRelatorioPage({Key key, this.title = "TeacherRelatorio"})
      : super(key: key);

  @override
  _TeacherRelatorioPageState createState() => _TeacherRelatorioPageState();
}

class _TeacherRelatorioPageState
    extends ModularState<TeacherRelatorioPage, TeacherRelatorioController> {
  //use 'controller' variable to access controller

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
