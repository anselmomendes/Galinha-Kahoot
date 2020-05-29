import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_list_cases/teacher_list_cases_controller.dart';

class TeacherListCasesPage extends StatefulWidget {
  final bool showAppBar;
  final String title;
  const TeacherListCasesPage(
      {Key key, this.title = "Lista de Casos", this.showAppBar = true})
      : super(key: key);

  @override
  _TeacherListCasesPageState createState() => _TeacherListCasesPageState();
}

class _TeacherListCasesPageState
    extends ModularState<TeacherListCasesPage, TeacherListCasesController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              backgroundColor: Colors.redAccent,
              title: Text(widget.title),
              centerTitle: true,
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
                              model.title, //model.topicOne,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: //Text(model.title),
                                Text(
                              model.description, //model.textOne,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/cases/cases_single',
                              );
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
                                  _showAlertDialogDelete(model: model);
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
                  maxLength: 20,
                  initialValue: model.topicOne,
                  onChanged: (v) => model.topicOne = v,
                  decoration: InputDecoration(
                    labelText: 'Digite uma resposta',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLength: 20,
                  initialValue: model.textOne,
                  onChanged: (v) => model.textOne = v,
                  decoration: InputDecoration(
                    labelText: 'Digite uma resposta',
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                TextFormField(
                  maxLength: 20,
                  initialValue: model.imageUrlOne,
                  onChanged: (v) => model.imageUrlOne = v,
                  decoration: InputDecoration(
                    labelText: 'Digite uma resposta',
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

  void _showAlertDialogDelete({CasesModel model}) {
    model ??= CasesModel();

    Widget cancelButton = FlatButton(
      child: Text("Cancelar"),
      onPressed: () {
        // _casesID.text = '';
        // _teacherID.text = '';
        Modular.to.pop();
      },
    );
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        // _casesID.text = '';
        // _teacherID.text = '';
        controller.delete(model);
        Modular.to.pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Aviso"),
      content: Text("Deseja excluir o caso?"),
      actions: [
        cancelButton,
        okButton,
      ],
    );
    // exibe o dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alerta;
      },
    );
  }
}
