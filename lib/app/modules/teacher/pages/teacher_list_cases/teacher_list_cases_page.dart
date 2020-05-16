import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/models/QuestionModel.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_list_cases/teacher_list_cases_controller.dart';

class TeacherListCasesPage extends StatefulWidget {
  final bool showAppBar;
  final String title;
  const TeacherListCasesPage(
      {Key key,
      this.title = "Lista de Casos do Professor",
      this.showAppBar = true})
      : super(key: key);

  @override
  _TeacherListCasesPageState createState() => _TeacherListCasesPageState();
}

class _TeacherListCasesPageState
    extends ModularState<TeacherListCasesPage, TeacherListCasesController> {
  QuestionModel question_model = QuestionModel(
    title: "Anselmo",
    description:
        "Após admissão evoluiu rapidamente com piora importante do estado geral, apresentando-se ao exame físico, taquicárdica, taquipnéica, desidratada 3+/4, hipocorada 3+/4, ictérica 2+/4.\n\nApresentou ainda lipotímia seguida de síncope.",
    imageUrl:
        "https://unifesspa.edu.br/images/conteudo/2019/Marca_-_Vertical__S%C3%ADmbolo_-_Tipografia.jpg",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              title: Text(widget.title),
            )
          : null,
      body: Container(
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
                    height: 150,
                    child: Card(
                      margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                      elevation: 20,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              'Caso ${index + 1}',
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
                            onTap: () {
                              Navigator.pushNamed(
                                  context, '/cases/cases_single',
                                  arguments: question_model);
                            },
                            //subtitle: Text(model.right),
                          ),
                          ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                color: Colors.red,
                                child: const Text('EXCLUIR'),
                                onPressed: () {
                                  controller.delete(model);
                                },
                              ),
                              FlatButton(
                                color: Colors.red,
                                child: const Text('EDITAR'),
                                onPressed: () {
                                  _showDialog(model: model);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }

  _showDialog({CasesModel model}) {
    model ??= CasesModel();
    showDialog(
      context: context,
      builder: (_) {
        return SingleChildScrollView(
          child: AlertDialog(
            title: Text(
              model.reference == null ? 'Adicionar Caso' : 'Alterar Caso',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
            content: Column(
              children: <Widget>[
                TextFormField(
                  maxLength: 50,
                  initialValue: model.question,
                  onChanged: (v) => model.question = v,
                  decoration: InputDecoration(
                    labelText: 'Digite sua pergunta',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLength: 20,
                  initialValue: model.answers1,
                  onChanged: (v) => model.answers1 = v,
                  decoration: InputDecoration(
                    labelText: 'Digite uma resposta',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLength: 20,
                  initialValue: model.answers2,
                  onChanged: (v) => model.answers2 = v,
                  decoration: InputDecoration(
                    labelText: 'Digite uma resposta',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLength: 20,
                  initialValue: model.answers3,
                  onChanged: (v) => model.answers3 = v,
                  decoration: InputDecoration(
                    labelText: 'Digite uma resposta',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLength: 20,
                  initialValue: model.answers4,
                  onChanged: (v) => model.answers4 = v,
                  decoration: InputDecoration(
                    labelText: 'Digite uma resposta',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLength: 20,
                  initialValue: model.answers5,
                  onChanged: (v) => model.answers5 = v,
                  decoration: InputDecoration(
                    labelText: 'Digite uma resposta',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLength: 1,
                  keyboardType: TextInputType.number,
                  initialValue: model.right,
                  onChanged: (v) => model.right = v,
                  decoration: InputDecoration(
                    labelText: 'Digite a alternativa correta',
                  ),
                ),
              ],
            ),
            actions: <Widget>[
              FlatButton(
                onPressed: () {
                  Modular.to.pop();
                },
                child: Text('Cancelar', style: TextStyle(fontSize: 16)),
              ),
              FlatButton(
                onPressed: () {
                  controller.save(model);
                  Modular.to.pop();
                },
                child: Text('Adicionar', style: TextStyle(fontSize: 16)),
              ),
            ],
          ),
        );
      },
    );
  }
}
