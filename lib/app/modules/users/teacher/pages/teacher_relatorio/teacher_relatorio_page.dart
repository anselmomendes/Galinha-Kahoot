import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/models/QuizModel.dart';
import 'package:galinha_karoot/app/modules/class/models/ClassModels.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import 'package:galinha_karoot/app/modules/users/student_2/models/StudentModel.dart';
import 'teacher_relatorio_controller.dart';

class TeacherRelatorioPage extends StatefulWidget {
  final String title;
  final ClassModel model;
  const TeacherRelatorioPage(
      {Key key, this.title = "Relatório", bool showAppBar, this.model})
      : super(key: key);

  @override
  _TeacherRelatorioPageState createState() => _TeacherRelatorioPageState();
}

class _TeacherRelatorioPageState
    extends ModularState<TeacherRelatorioPage, TeacherRelatorioController> {
  //use 'controller' variable to access controller

  @override
  void initState() {
    super.initState();
    controller.loadListStudents(widget.model.casesID);
    controller.getQuiz(widget.model.casesID);
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
      body: Observer(builder: (_) {
        if (controller.listStudents == null) {
          return Center(child: CircularProgressIndicator());
        } else {
          if (controller.listStudents.data.length == 0) {
            return Center(
              child: Text("Nenhum aluno resolveu o quiz"),
            );
          }
          if (controller.listquiz == null) {
            controller.getQuiz(widget.model.casesID);
            print("List quiz ta null");
            return Center(child: CircularProgressIndicator());
          } else {
            List<StudentModel> list = controller.listStudents.data;
            List<QuizModel> list2 = controller.listquiz.data;
            controller.getAverage(list, list2);
            return Container(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(30, 20, 30, 30),
                  child: Column(
                    children: <Widget>[
                      Text('Dados Gerais',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25.0,
                            fontWeight: FontWeight.w600,
                          )),
                      Divider(thickness: 2.0),
                      Padding(padding: EdgeInsets.only(bottom: 15.0)),
                      Column(
                        children: [
                          //Material onde exibe o total de acertos da turma
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text('N° de Questões: ',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.w600,
                                  )),
                              Padding(padding: EdgeInsets.only(right: 30.0)),
                              Material(
                                  color: Colors.blue,
                                  elevation: 14.0,
                                  borderRadius: BorderRadius.circular(12.0),
                                  shadowColor: Color(0x802196F3),
                                  child: Center(
                                      child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Text(
                                              '${controller.listquiz.data.length}',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.w700,
                                                  fontSize: 22.0)))))
                            ],
                          ),

                          Padding(padding: EdgeInsets.only(bottom: 20.0)),

                          _buildTile(
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('Total de acertos:',
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.w500,
                                            )),
                                        Text('${controller.hits}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 34.0))
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('Média da Turma:',
                                            style: TextStyle(
                                              color: Colors.green,
                                              fontWeight: FontWeight.w500,
                                            )),
                                        Text(
                                            '${controller.avaregeHits.toStringAsFixed(2)}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 34.0))
                                      ],
                                    ),
                                    Material(
                                        color: Colors.green,
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                        child: Center(
                                            child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Icon(Icons.done_outline,
                                              color: Colors.white, size: 30.0),
                                        ))),
                                  ]),
                            ),
                          ),

                          Padding(padding: EdgeInsets.only(bottom: 20.0)),

                          Padding(padding: EdgeInsets.only(bottom: 20.0)),

                          //Material onde exibe o total de erros da turma

                          _buildTile(
                            Padding(
                              padding: const EdgeInsets.all(24.0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: <Widget>[
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('Total de erros:',
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w500,
                                            )),
                                        Text('${controller.errors}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 34.0))
                                      ],
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text('Média da Turma:',
                                            style: TextStyle(
                                              color: Colors.red,
                                              fontWeight: FontWeight.w500,
                                            )),
                                        Text(
                                            '${controller.avaregeErrors.toStringAsFixed(2)}',
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.w700,
                                                fontSize: 34.0))
                                      ],
                                    ),
                                    Material(
                                        color: Colors.red,
                                        borderRadius:
                                            BorderRadius.circular(24.0),
                                        child: Center(
                                            child: Padding(
                                          padding: const EdgeInsets.all(16.0),
                                          child: Icon(Icons.cancel,
                                              color: Colors.white, size: 30.0),
                                        )))
                                  ]),
                            ),
                          ),

                          Padding(padding: EdgeInsets.only(bottom: 40.0)),

                          RaisedButton(
                              color: Colors.blue,
                              padding: const EdgeInsets.all(18.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.blueAccent)),
                              child: Text(
                                'Relátorio Individual dos Alunos',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                Modular.to.pushNamed(
                                  'teacher/teacher_relatorio_list',
                                  arguments: list,
                                );
                              }),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            );
          }
        }
      }),
    );
  }

  Widget _buildTile(Widget child, {Function() onTap}) {
    return Material(
        elevation: 14.0,
        borderRadius: BorderRadius.circular(12.0),
        shadowColor: Color(0x802196F3),
        child: InkWell(
            onTap: onTap != null
                ? () => onTap()
                : () {
                    print('null');
                  },
            child: child));
  }
}
