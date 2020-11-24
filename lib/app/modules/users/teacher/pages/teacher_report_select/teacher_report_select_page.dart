import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:PeensA/app/modules/class/models/ClassModels.dart';
import 'teacher_report_select_controller.dart';

class TeacherReportSelectPage extends StatefulWidget {
  final bool showAppBar;
  final String title;

  const TeacherReportSelectPage(
      {Key key, this.title = "Relatório", this.showAppBar})
      : super(key: key);

  @override
  _TeacherReportSelectPageState createState() =>
      _TeacherReportSelectPageState();
}

class _TeacherReportSelectPageState extends ModularState<
    TeacherReportSelectPage, TeacherReportSelectController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              centerTitle: true,
              title: Text(widget.title),
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              //height: 50,
              child: Center(
                child: Column(
                  children: <Widget>[
                    // Texto fixo na tela
                    SizedBox(height: 25),
                    Text("Olá professor! ",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    SizedBox(height: 5),
                    Text(
                        "Gere relatório por turmas. \nEscolha a turma que deseja gerar o relatório:",
                        textAlign: TextAlign.center),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            ),
            // Lista de de casos (teste)
            Container(
              height: 500,
              child: Observer(
                builder: (_) {
                  if (controller.classList.data == null)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  else if (controller.classList.hasError)
                    return Center(
                      child: RaisedButton(
                        onPressed: () => controller.getList(),
                        child: Text('Error'),
                      ),
                    );
                  else {
                    List<ClassModel> list = controller.classList.data;

                    return ListView.builder(
                      itemCount: list.length,
                      itemBuilder: (_, index) {
                        ClassModel model = list[index];

                        return Container(
                          height: 100,
                          child: Card(
                            margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                            elevation: 20,
                            child: GestureDetector(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    leading: Icon(Icons.arrow_forward_ios),
                                    title: Text(
                                      'Turma: ${model.className}',
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        fontSize: 18,
                                      ),
                                    ),
                                    subtitle: Text(
                                      'Status: ${model.status}',
                                      style: TextStyle(
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.pushNamed(
                                  context,
                                  '/teacher/teacher_relatorio',
                                  arguments: model,
                                );
                              },
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
