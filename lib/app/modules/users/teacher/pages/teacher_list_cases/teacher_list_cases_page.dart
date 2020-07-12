import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'teacher_list_cases_controller.dart';

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
          name: 'cases',
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
                              model
                                  .description, //model.description, //model.textOne,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/cases/sintomas',
                                arguments: model,
                              );
                            },
                            //subtitle: Text(model.right),
                          ),
                          ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                color: Colors.redAccent,
                                child: const Text('EXCLUIR'),
                                onPressed: () {
                                  _showAlertDialogDelete(model: model);
                                },
                              ),
                              FlatButton(
                                color: Colors.redAccent,
                                child: const Text('EDITAR'),
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/cases/cases_update',
                                    arguments: model,
                                  );
                                },
                              ),
                              FlatButton(
                                color: Colors.redAccent,
                                child: const Text('ACESSAR'),
                                onPressed: () {
                                  /* Navigator.pushNamed(
                                    context,
                                    '/cases/sintomas',
                                    arguments: model,
                                  ); */
                                  Navigator.pushNamed(
                                    context,
                                    '/cases/cases_home',
                                    arguments: model,
                                  );
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

  void _showAlertDialogDelete({CasesModel model}) {
    model ??= CasesModel();

    Widget cancelButton = FlatButton(
      child: Text("Cancelar"),
      onPressed: () {
        Modular.to.pop();
      },
    );
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () async {
        await controller.delete(model);
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
