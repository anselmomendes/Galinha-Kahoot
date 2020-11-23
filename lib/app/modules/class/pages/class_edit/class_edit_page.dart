import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_duration_picker/flutter_duration_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:PeensA/app/modules/cases/models/CasesModels.dart';
import 'package:PeensA/app/modules/class/models/ClassModels.dart';
import 'package:PeensA/app/modules/class/pages/class_edit/class_edit_controller.dart';
import 'package:PeensA/app/modules/common/styles.dart';
import 'package:PeensA/app/shared/widgets/text_timer/selectionText.dart';
import 'package:intl/intl.dart';

class ClassEditPage extends StatefulWidget {
  final ClassModel classModel;
  final bool showAppBar;
  final String title;
  const ClassEditPage(
      {Key key,
      this.title = "Editar Turma",
      @required this.classModel,
      this.showAppBar = true})
      : super(key: key);

  @override
  _ClassEditPageState createState() => _ClassEditPageState();
}

class _ClassEditPageState
    extends ModularState<ClassEditPage, ClassEditController> {
  final _className = TextEditingController();
  var _casesID = "";
  var _titleCases = "";

  // Variaveis para o status da class
  var status = ['Ativado', 'Desativado'];
  String itemSelected = 'Ativado';
  String currentStatus;

  // Variável para seleção do caso no RadioListTile
  var selectedCase;

  // Variável do temporizador selecionado (em minutos) - 5 dias (padrão)
  Duration resultingDuration = Duration(minutes: 7200);
  int currentTime;
  Timestamp myTimeStamp;
  DateTime modifiedDate;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    // ClassModel model = ClassModel();

    bool statusBool = widget.classModel.status;
    checkStatus(statusBool);
    String currentTitleCase = widget.classModel.titleCase;
    currentTime = widget.classModel.timer;
    // _titleCases = widget.classModel.titleCase;

    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              backgroundColor: Colors.redAccent,
              title: Text(widget.title),
              centerTitle: true,
            )
          : null,
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
            return Center(
              child: Column(
                children: <Widget>[
                  SizedBox(height: 10),
                  Text("Alterar status:", style: headerTextStyle),
                  Text("Status atual: ${currentStatus}"),
                  // Parte do DropDown
                  DropdownButton(
                    // items: _status.map((String dropDownStringItem) {
                    items: status.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (String newItemSelected) {
                      itemSelected = newItemSelected;
                      print(itemSelected);
                      setState(() {
                        itemSelected = newItemSelected;
                      });
                      // });
                    },
                    value: itemSelected,
                  ),
                  Divider(height: 20),
                  Text("Alterar nome da turma:", style: headerTextStyle),
                  // Nome da turma
                  TextFormField(
                    maxLength: 20,
                    initialValue: widget.classModel.className,
                    onChanged: (v) => widget.classModel.className = v,
                    decoration: const InputDecoration(
                      labelText: 'Nome da turma',
                      prefixIcon: Icon(Icons.title),
                    ),
                  ),
                  Text("Selecione o temporizador:", style: headerTextStyle),
                  Text("Temporizador atual: ${currentTime} minutos"),
                  SizedBox(height: 5),
                  // selectionText(resultingDuration),
                  selectionText(resultingDuration),
                  SizedBox(height: 5),
                  FlatButton(
                      onPressed: () async {
                        resultingDuration = await showDurationPicker(
                          context: context,
                          initialTime: new Duration(minutes: 30),
                        );

                        if (resultingDuration != null) {
                          Duration durationZeroTest = Duration(minutes: 0);

                          if (resultingDuration.compareTo(durationZeroTest) ==
                              0) {
                            resultingDuration = Duration(minutes: 7200);
                          }
                        } else {
                          resultingDuration = Duration(minutes: 7200);
                        }
                        setState(() {
                          resultingDuration = resultingDuration;
                        });
                      },
                      color: appColor,
                      child: Text(
                        "Selecionar",
                        style: TextStyle(color: Colors.white),
                      )),
                  Divider(
                    height: 30,
                  ),
                  Form(
                      child: Column(
                    children: <Widget>[
                      // _casesID
                      Text("Selecione o caso:", style: headerTextStyle),
                      Text("Caso atual: ${currentTitleCase}"),
                      // Lista de de casos (teste)
                      Container(
                        height: screenWidth * 0.45,
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
                                          _casesID = model.id;
                                          _titleCases = model.title;
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Observer(builder: (BuildContext context) {
                        return FlatButton(
                            onPressed: () {
                              modifiedDate = DateTime.now();

                              widget.classModel.timer =
                                  resultingDuration.inMinutes;
                              widget.classModel.className =
                                  widget.classModel.className;
                              widget.classModel.endTime = Timestamp.fromDate(
                                  modifiedDate.add(resultingDuration));

                              if (selectedCase != null) {
                                widget.classModel.titleCase = _titleCases;
                              }
                              
                              widget.classModel.modifiedDate =
                                  Timestamp.fromDate(modifiedDate);

                              // importante
                              // var testTime = DateTime.now();
                              // var testTime2 =
                              //     DateTime.now().add(Duration(minutes: 130));
                              // print(testTime);
                              // print(testTime2);
                              // var diferenca = testTime2.difference(testTime);
                              // print(diferenca);
                              // print(testTime.isBefore(testTime2));

                              if (itemSelected.compareTo('Ativado') == 0) {
                                widget.classModel.status = true;
                              } else {
                                widget.classModel.status = false;
                              }

                              controller.save(widget.classModel);
                              _showAlertDialog(context);
                            },
                            color: appColor,
                            child: Text('Atualizar',
                                style: TextStyle(color: Colors.white)));
                      })
                    ],
                  ),
                ],
              ),
            );
          }
        }),
      ),
    );
  }

  // Converter o status de 'true' ou 'false' para 'Ativado' ou 'Desativado'
  void checkStatus(bool status) {
    if (status.toString().compareTo('true') == 0) {
      currentStatus = 'Ativado';
    } else {
      currentStatus = 'Desativado';
    }
  }

/*   // Condicional para exibição do temporizado padrão ou o selecionado
  Widget selectionText(Duration resultingDuration) {
    Duration v = Duration(minutes: 7200);

    if (resultingDuration.compareTo(v) == 0) {
      return Text(
          "Por padrão, a turma será desativada em ${resultingDuration.inDays} dias.");
    }
    return Text("Turma será desativada em ${resultingDuration.inMinutes} min.");
  } */

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
}
