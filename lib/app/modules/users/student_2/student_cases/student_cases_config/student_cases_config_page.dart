import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:PeensA/app/modules/cases/models/CasesModels.dart';
import 'package:PeensA/app/modules/cases/pages/cases_config/cases_config_controller.dart';
import 'package:PeensA/app/modules/common/styles.dart';
import 'package:PeensA/app/modules/users/student_2/student_cases/student_cases_config/student_cases_config_controller.dart';

class StudentCasesConfigPage extends StatefulWidget {
  final String title;
  final bool showAppBar;
  final CasesModel model;
  const StudentCasesConfigPage(
      {Key key, this.title = "StudentCasesConfig", this.model, this.showAppBar = true})
      : super(key: key);

  @override
  _StudentCasesConfigPageState createState() => _StudentCasesConfigPageState();
}

class _StudentCasesConfigPageState
    extends ModularState<StudentCasesConfigPage, StudentCasesConfigController> {
  // Variaveis para o status da class
  var status = ['Sim', 'Não'];
  String itemSelected = 'Sim';
  String currentStatus;

  @override
  void initState() {
    // TODO: implement initState
    itemSelected = widget.model.public;
    if(itemSelected.compareTo('true') == 0) {
      itemSelected = 'Sim';
    } else {
      itemSelected = 'Não';
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              backgroundColor: appContrastColor,
              title: Text(widget.title),
              centerTitle: true,
            )
          : null,
      body: SingleChildScrollView(
        child: Column(
        children: <Widget>[
          Observer(builder: (_) {
            /* if (controller.casesList.data == null)
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
            else {} */
            return Center(
              child: Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.05, 
                    right: screenWidth * 0.05
                    ),
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 10),
                    Text("O caso é público?", style: headerTextStyle),
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
                    Text("Alterar o título do caso:", style: headerTextStyle),
                    // Título do caso
                    TextFormField(
                      maxLength: 20,
                      initialValue: widget.model.title,
                      // initialValue: "k",
                      onChanged: (v) => widget.model.title = v,
                      decoration: const InputDecoration(
                        labelText: 'Título do caso',
                        prefixIcon: Icon(Icons.title),
                      ),
                    ),
                    Divider(height: 20),
                    Text("Alterar a descrição do caso:",
                        style: headerTextStyle),
                    // Título do caso
                    TextFormField(
                      maxLength: 20,
                      initialValue: widget.model.description,
                      // initialValue: "k",
                      onChanged: (v) => widget.model.description = v,
                      decoration: const InputDecoration(
                        labelText: 'Descrição do caso',
                        prefixIcon: Icon(Icons.description),
                      ),
                    ),
                    SizedBox(height: screenWidth * 0.6),
                    Divider(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Observer(builder: (BuildContext context) {
                          return FlatButton(
                              onPressed: () {
                                
                                if (itemSelected.compareTo('Sim') == 0) {
                                  widget.model.public = 'true';
                                } else {
                                  widget.model.public = 'false';
                                }

                                controller.update(widget.model);
                                _showAlertDialog(context);
                              },
                              color: appContrastColor,
                              child: Text('Atualizar',
                                  style: TextStyle(color: Colors.white)));
                        })
                      ],
                    ),
                  ],
                ),
              ),
            );
          }),
        ],
      ),
      )
    );
  }

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
      title: Text("Aviso"),
      content: Text("Informações foram salvas com sucesso!"),
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
