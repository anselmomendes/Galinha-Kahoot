import 'package:flutter/material.dart';
import 'package:flutter_duration_picker/flutter_duration_picker.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/class/models/ClassModels.dart';
import 'package:galinha_karoot/app/modules/class/pages/class_edit/class_edit_controller.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';

class ClassEditPage extends StatefulWidget {
  final ClassModel classModel;
  final bool showAppBar;
  final String title;
  const ClassEditPage(
      {Key key,
      this.title = "ClassEdit",
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

  /*  // Variaveis para o status da class
  var _status = ['Ativado', 'Desativado'];
  var _itemSelecionado = 'Ativado';
  String _currentStatus; */

  String itemSelecionado;

  // Variável para seleção do caso no RadioListTile
  var selectedCase;

  // Variável do temporizador selecionado (em minutos) - 5 dias (padrão)
  Duration resultingDuration = Duration(minutes: 7200);

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    // ClassModel model = ClassModel();

    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
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
                  // Text("Status atual: $_currentStatus"),
                  // Parte do DropDown
                  DropdownButton(
                    // items: _status.map((String dropDownStringItem) {
                    items: controller.status.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (String novoItemSelecionado) {
                      // _dropDownItemSelected(novoItemSelecionado);
                      // setState(() {
                      // _itemSelecionado = novoItemSelecionado;
                      controller.itemSelecionado = novoItemSelecionado;
                      print(controller.itemSelecionado);
                      setState(() {
                        controller.itemSelecionado = novoItemSelecionado;
                        itemSelecionado = novoItemSelecionado;
                      });
                      // });
                    },
                    value: itemSelecionado,
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
                  SizedBox(height: 5),
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
                                          _casesID = model.idCases;
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
                ],
              ),
            );
          }
        }),
      ),
    );
  }

  // Converter o status de 'true' ou 'false' para 'Ativado' ou 'Desativado'
  void _checkStatus(bool status) {
    if (status.toString().compareTo('true') == 0) {
      /* setState(() {
        this._currentStatus = 'Ativado';
      }); */
      controller.itemSelecionado = 'Ativado';
      setState(() {
        itemSelecionado = 'Ativado';
      });
    } else {
      controller.itemSelecionado = 'Desativado';
      setState(() {
        itemSelecionado = 'Desativado';
      });
      // this._currentStatus = 'Desativado';
    }
  }

  // Condicional para exibição do temporizado padrão ou o selecionado
  Widget selectionText(Duration resultingDuration) {
    Duration v = Duration(minutes: 7200);

    if (resultingDuration.compareTo(v) == 0) {
      return Text(
          "Por padrão, a turma será desativada em ${resultingDuration.inDays} dias.");
    }
    return Text("Turma será desativada em ${resultingDuration.inMinutes} min.");
  }
}
