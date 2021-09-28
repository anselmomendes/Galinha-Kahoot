import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_duration_picker/flutter_duration_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:PeensA/app/modules/cases/models/CasesModels.dart';
import 'package:PeensA/app/modules/class/models/ClassModels.dart';
import 'package:PeensA/app/modules/class/pages/class_register/class_register_controller.dart';
import 'package:PeensA/app/modules/common/BaseAuth.dart';
import 'package:PeensA/app/modules/common/styles.dart';
import 'package:PeensA/app/shared/widgets/text_timer/selectionText.dart';
import 'package:intl/intl.dart';

class ClassRegisterPage extends StatefulWidget {
  final String title;
  const ClassRegisterPage({Key key, this.title = "Cadastrar Turma"})
      : super(key: key);

  @override
  _ClassRegisterPageState createState() => _ClassRegisterPageState();
}

class _ClassRegisterPageState
    extends ModularState<ClassRegisterPage, ClassRegisterController> {
  // final _casesID = TextEditingController();
  // final _teacherID = TextEditingController();
  // final _timer = TextEditingController();
  final _className = TextEditingController();
  var _casesID = "";
  var _titleCases = "";

  // String nomeCidade = "";
  // Variaveis para o status da class
  var _status = ['Ativado', 'Desativado'];
  var _itemSelected = 'Ativado';

  Timestamp myTimeStamp;
  DateTime myDateTime;

  // var _currentTimeValue = 1;

  // Variável para seleção do caso no RadioListTile
  var selectedCase;

  // Data de criação da class
  var creationDate;

  // Variável do temporizador selecionado (em minutos) - 5 dias (padrão)
  Duration resultingDuration = Duration(minutes: 7200);

  // Temporizador personalizado - data final para desativar a turma
  var endTime;

  // Código de acesso da class de 4 dígitos
  int _accessCode = 999 + Random().nextInt(9999 - 999);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    ClassModel model = ClassModel();
    CasesModel model2 = CasesModel();

    /* // Coletando informações do usuário professor
    getUserLogged(); */

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
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
                  Text("Selecione o status:", style: headerTextStyle),
                  // Parte do DropDown
                  DropdownButton(
                    items: _status.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (String newItemSelected) {
                      _dropDownItemSelected(newItemSelected);
                      setState(() {
                        this._itemSelected = newItemSelected;
                      });
                    },
                    value: _itemSelected,
                  ),
                  Divider(height: 20),
                  Text("Adicione o nome da turma:", style: headerTextStyle),
                  // Nome da turma
                  TextFormField(
                      controller: _className,
                      maxLength: 20,
                      decoration: const InputDecoration(
                        labelText: 'Nome da turma',
                        hintText: "Digite o nome da turma",
                        prefixIcon: Icon(Icons.title),
                      )),
                  // SizedBox(height: 20),
                  // Divider(height: 20),
                  SizedBox(height: 5),
                  // selectionText(resultingDuration),
                  selectionText(resultingDuration),
                  SizedBox(height: 5),
                  Divider(
                    height: 30,
                  ),
                  Form(
                      child: Column(
                    children: <Widget>[
                      // _casesID
                      Text("Selecione o caso:", style: headerTextStyle),
                      // Lista de de casos (teste)
                      Container(
                        height: screenWidth * 0.55,
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
                                        title: Text(model.title),
                                        onChanged: (currentCase) {
                                          print(index);
                                          //print("Current Case ${currentCase.question}");
                                          setSelectedCase(currentCase);
                                          _casesID = model.reference.documentID;
                                          _titleCases = model.title;
                                        },
                                        selected: selectedCase == model,
                                        activeColor: Colors.redAccent,
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
                              // Novo modelo para capturar data/horário e temporizador
                              myDateTime = DateTime.now();
                              model.creationDate =
                                  Timestamp.fromDate(myDateTime);
                              model.endTime = Timestamp.fromDate(
                                  myDateTime.add(resultingDuration));
                              model.modifiedDate =
                                  Timestamp.fromDate(myDateTime);
                              model.timer = resultingDuration.inMinutes;

                              // Salvando nome da turma
                              model.className = _className.text;
                              // Salvando código de acesso
                              model.accessCode = _accessCode;
                              // Relacionando info de caso com a turma
                              model.titleCase = _titleCases;
                              model.casesID = _casesID;

                              // Condicional para transformar o status e salva no model
                              if (_itemSelected.compareTo('Ativado') == 0) {
                                model.status = true;
                              } else {
                                model.status = false;
                              }

                              controller.save(model);
                              _showAlertDialog(context);

                              /* == Comentários importantes == */

                              // Modelo antigo de captura de data e horário
                              // model.creationDate =
                              //     new DateFormat("dd/MM/y hh:mm")
                              //         .format(DateTime.now());
                              /* model.endTime = myDateTime
                                  .add(resultingDuration)
                                  .toString(); */
                              // model.timer = resultingDuration.toString();
                              // model.className = _className;

                              // model.creationDate = creationDate;
                              // model.endTime = re
                              // Para teste
                              /* print("Data de criação; ${creationDate}");
                                 print("Data de fechamento: ${endTime}");
                                 print("Data com temporizador: ${standartTimer}"); */

                              // var testTime = DateTime.now();
                              // var testTime2 =
                              //     DateTime.now().add(Duration(minutes: 130));
                              // print(testTime);
                              // print(testTime2);
                              // var diferenca = testTime2.difference(testTime);
                              // print(diferenca);
                              // print(testTime.isBefore(testTime2));
                            },
                            color: appContrastColor,
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

  // Menu de opções (Ativado ou Desativado)
  void _dropDownItemSelected(String newItem) {
    setState(() {
      this._itemSelected = newItem;
    });
  }

  // Aviso que a turma foi criada
  void _showAlertDialog(BuildContext context) {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        // _casesID.text = '';
        // _teacherID.text = '';
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

/*   // Condicional para exibição do temporizador padrão ou o selecionado
  Widget selectionText(Duration resultingDuration) {
    Duration v = Duration(minutes: 7200);

    if (resultingDuration.compareTo(v) == 0) {
      return Text(
          "Por padrão, a turma será desativada em ${resultingDuration.inDays} dias.");
    }
    return Text("Turma será desativada em ${resultingDuration.inMinutes} min.");
  } */
}
