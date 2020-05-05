import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/class/models/ClassModels.dart';
import 'package:galinha_karoot/app/modules/class/pages/class_register/class_register_controller.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import 'package:intl/intl.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_list_cases/teacher_list_cases_controller.dart';

class ClassRegisterPage extends StatefulWidget {
  final String title;
  const ClassRegisterPage({Key key, this.title = "Cadastrar Turma"})
      : super(key: key);

  @override
  _ClassRegisterPageState createState() => _ClassRegisterPageState();
}

class _ClassRegisterPageState
    extends ModularState<ClassRegisterPage, ClassRegisterController> {
  final _casesID = TextEditingController();
  final _teacherID = TextEditingController();
  final _timer = TextEditingController();

  String nomeCidade = "";
  var _status = ['Ativado', 'Desativado'];
  var _itemSelecionado = 'Ativado';

  var _currentTimeValue = 1;
                              var selectedCase;


  final creationDate = new DateFormat("dd/MM/y").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    ClassModel model = ClassModel();
    CasesModel model2 = CasesModel();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            // top: screenWidth * 0.2,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05),
        child: Observer(builder: (_) {
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

            return Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  /* Image.asset("assets/bits.png",
                  width: MediaQuery.of(context).size.width * appLogoMediumSize),
              SizedBox(height: 20), */
                  // Text("Cadastrar Turmas", style: headerTextStyle),
                  SizedBox(height: 20),
                  Text("Selecione o status:", style: headerTextStyle),
                  // Parte do DropDown
                  DropdownButton(
                    items: _status.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (String novoItemSelecionado) {
                      _dropDownItemSelected(novoItemSelecionado);
                      setState(() {
                        this._itemSelecionado = novoItemSelecionado;
                      });
                    },
                    value: _itemSelecionado,
                  ),
                  // SizedBox(height: 20),
                  Divider(
                    height: 40,
                  ),
                  Form(
                      child: Column(
                    children: <Widget>[
                      // _casesID
                      Text("Selecione o caso:", style: headerTextStyle),
                      // Lista de de casos (teste)
                      Container(
                        height: screenWidth * 1.0,
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

                              setSelectedCase(CasesModel model) {
                                setState(() {
                                  selectedCase = model;
                                });
                              }

                              return ListView.builder(
                                itemCount: list.length,
                                itemBuilder: (_, index) {
                                  CasesModel model = list[index];

                                  return Column(
                                    children: <Widget>[
                                      RadioListTile(
                                        value: model,
                                        groupValue: selectedCase,
                                        title: Text(model.question),
                                        onChanged: (currentCase) {
                                          print(index);
                                          print(
                                              "Current Case ${currentCase.question}");
                                          setSelectedCase(currentCase);
                                        },
                                        selected: selectedCase == model,
                                        activeColor: Colors.red,
                                      )
                                    ],
                                  );
                                },
                              );
                            }
                          },
                        ),
                      )
                    ],
                  )),
                  Divider(
                    height: 10,
                  ),
                  // SizedBox(height: 40),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Observer(builder: (BuildContext context) {
                        return FlatButton(
                            onPressed: () {
                              // Para teste
                              print(creationDate);

                              model.casesID = _casesID.text;
                              model.teacherID = _teacherID.text;
                              model.creationDate = creationDate;
                              if (_itemSelecionado.compareTo('Ativado') ==
                                  true) {
                                model.status = true;
                              } else {
                                model.status = false;
                              }

                              // controller.save(model);
                              // _showAlertDialog(context);
                            },
                            color: appColor,
                            child: Text('Salvar',
                                style: TextStyle(color: Colors.white)));
                      })
                    ],
                  ),
                  SizedBox(
                    height: 20.0,
                  )
                ],
              ),
            );
          }
        }),
      ),
    );
  }

  void _dropDownItemSelected(String novoItem) {
    setState(() {
      this._itemSelecionado = novoItem;
    });
  }

  void _showAlertDialog(BuildContext context) {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        _casesID.text = '';
        _teacherID.text = '';
        Modular.to.pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Turma criada"),
      content: Text("A turma foi criada com sucesso!"),
      actions: [
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
