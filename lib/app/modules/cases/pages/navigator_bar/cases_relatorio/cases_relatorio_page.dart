import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_relatorio/cases_relatorio_controller.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import 'package:galinha_karoot/app/modules/users/student_2/models/StudentModel.dart';

class CasesRelatorioPage extends StatefulWidget {
  final String title;
  final CasesModel model;
  const CasesRelatorioPage({Key key, this.title = "Relatório", this.model})
      : super(key: key);

  @override
  _CasesRelatorioPageState createState() => _CasesRelatorioPageState();
}

class _CasesRelatorioPageState
    extends ModularState<CasesRelatorioPage, CasesRelatorioController> {
  final _topicSix = TextEditingController();
  final _textSix = TextEditingController();
  final _imageUrlSix = TextEditingController();

  @override
  void initState() {
    super.initState();
    controller.loadList(widget.model.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: appContrastColor,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Observer(
        builder: (_) {
          if (controller.listStudents.data == null) {
            return Center(child: CircularProgressIndicator());
          } else if (controller.listStudents.data.isEmpty) {
            return Center(
              child: Text("Nenhuma turma encontrada"),
            );
          } else {
            List<StudentModel> list = controller.listStudents.data;
            controller.getAverage(list);
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: Column(
                children: <Widget>[
                  Text("Total de alunos que responderam: ${list.length}"),
                  Text("Media dos alunos: ${controller.avarege}")
                ],
              ),
            );
          }
        },
      ),
    );
  }
}
