import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'teacher_relatorio_list_controller.dart';

class TeacherRelatorioListPage extends StatefulWidget {
  final String title;
  const TeacherRelatorioListPage({Key key, this.title = "TeacherRelatorioList"})
      : super(key: key);

  @override
  _TeacherRelatorioListPageState createState() =>
      _TeacherRelatorioListPageState();
}

class _TeacherRelatorioListPageState extends ModularState<
    TeacherRelatorioListPage, TeacherRelatorioListController> {
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
