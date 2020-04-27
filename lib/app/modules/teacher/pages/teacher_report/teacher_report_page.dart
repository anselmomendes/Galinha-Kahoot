import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_report/teacher_report_controller.dart';

class TeacherReportPage extends StatefulWidget {
  final String title;
  const TeacherReportPage({Key key, this.title = "Relatório"})
      : super(key: key);

  @override
  _TeacherReportPageState createState() => _TeacherReportPageState();
}

class _TeacherReportPageState
    extends ModularState<TeacherReportPage, TeacherReportController> {
  // Teste anterior
/*   final List<String> entries = <String>['A', 'B', 'C'];
  final List<int> colorCodes = <int>[600, 500, 100]; */

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Container(
            //height: 50,
            child: Center(
              /*
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  // Texto fixo na tela
                  SizedBox(height: 25),
                  Text("Olá professor 'Vegano'! ",
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.w600)),
                  SizedBox(height: 5),
                  Text(
                      "Gere relatório por turmas. \nEscolhar a turma que deseja gerar o relatório:",
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
                if (controller.casesList.data == null)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                else if (controller.casesList.hasError)
                  return Center(
                    child: RaisedButton(
                      onPressed: () => controller.getList(),
                      child: Text('Error'),
                    ),
                  );
                else {
                  List<CasesModel> list = controller.casesList.data;

                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (_, index) {
                      CasesModel model = list[index];

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
                                  //isThreeLine: true,
                                  leading: IconButton(
                                    //color: Colors.brown,
                                    onPressed: () {
                                      //controller.save(model);
                                    },
                                    icon: Icon(Icons.arrow_forward_ios),
                                  ),
                                  /* trailing: IconButton(
                                  alignment: Alignment.center,
                                  icon: Icon(Icons.delete),
                                  color: Colors.red,
                                  onPressed: () {
                                    //controller.delete(model);
                                  },
                                ), */
                                  title: Text(
                                    'Caso ${model.position.toString()}',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 18,
                                    ),
                                  ),
                                  subtitle: Text(
                                    model.question,
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                  //subtitle: Text(model.right),
                                ),
                              ],
                            ),
                            onTap: () {
                              print(index);
                              //Navigator.pushNamed(context, '/teacher/teacher_menu');
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
          */
              )
        ],
      ),
    );
  }
}
