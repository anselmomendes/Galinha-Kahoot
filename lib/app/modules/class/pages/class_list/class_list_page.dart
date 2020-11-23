import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:PeensA/app/modules/class/models/ClassModels.dart';
import 'package:PeensA/app/modules/class/pages/class_list/class_list_controller.dart';

class ClassListPage extends StatefulWidget {
  final bool showAppBar;
  final String title;
  const ClassListPage(
      {Key key, this.title = "Lista de Turmas", this.showAppBar = true})
      : super(key: key);

  @override
  _ClassListPageState createState() => _ClassListPageState();
}

class _ClassListPageState
    extends ModularState<ClassListPage, ClassListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              centerTitle: true,
              backgroundColor: Colors.redAccent,
              title: Text(widget.title),
            )
          : null,
      body: Container(
        child: Observer(
          builder: (_) {
            if (controller.classList.data == null)
              // if (controller.classList2.data == null) //para testes
              return Center(
                child: CircularProgressIndicator(),
              );
            //else if (controller.classList.hasError)
            else if (controller.classList2.hasError)
              return Center(
                child: RaisedButton(
                  onPressed: () => controller.getList(),
                  // onPressed: () => controller.getListTrue(),
                  child: Text('Error'),
                ),
              );
            else {
              List<ClassModel> list = controller.classList.data;
              // List<ClassModel> list = controller.classList2.data;

              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (_, index) {
                  ClassModel model = list[index];

                  return Container(
                    height: 150,
                    child: Card(
                      margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                      elevation: 20,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.arrow_forward_ios),
                            title: Text(
                              'Turma ${index + 1}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Text(
                              // model.creationDate,
                              'Turma: ${model.className}',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            onTap: () {
                              /* Navigator.pushNamed(
                                  context, '/cases/cases_single',
                                  arguments: question_model) */
                              Navigator.pushNamed(
                                context,
                                '/class/class_detail',
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
                                  // controller.delete(model);
                                  _showAlertDialogDelete(model: model);
                                },
                              ),
                              FlatButton(
                                color: Colors.redAccent,
                                child: const Text('EDITAR'),
                                onPressed: () {
                                  // _showDialog(model: model);
                                  // Navigator.pushNamed(context, '/class/class_edit');
                                  Navigator.pushNamed(
                                      context, '/class/class_edit',
                                      arguments: model);
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

  void _showAlertDialogDelete({ClassModel model}) {
    model ??= ClassModel();

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
      content: Text("Deseja excluir a turma?"),
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
