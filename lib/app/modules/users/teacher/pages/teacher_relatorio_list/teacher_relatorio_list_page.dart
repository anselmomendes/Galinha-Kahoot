import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import 'package:galinha_karoot/app/modules/users/student_2/models/StudentModel.dart';
import 'teacher_relatorio_list_controller.dart';

class TeacherRelatorioListPage extends StatefulWidget {
  final String title;
  final List<StudentModel> listmodel;

  const TeacherRelatorioListPage({
    Key key,
    this.title = "Lista de Alunos",
    bool showAppBar,
    this.listmodel,
  }) : super(key: key);

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
        elevation: 0.1,
        backgroundColor: appContrastColor,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: <Widget>[
            Expanded(
              flex: 4,
              child: _getListView(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _getListView() {
    return ListView.builder(
      itemCount: widget.listmodel.length,
      itemBuilder: (context, index) {
        List<StudentModel> model = widget.listmodel;
        return ListTile(
          leading: Icon(Icons.person_outline),
          title: Text("Aluno(a): ${model[index].name}"),
          subtitle: Text(
              "Acertos: ${model[index].hits} / Erros: ${model[index].errors}"),
        );
      },
    );
  }
}
