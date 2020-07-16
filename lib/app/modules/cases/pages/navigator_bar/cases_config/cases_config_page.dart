import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_config/cases_config_controller.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';

class CasesConfigPage extends StatefulWidget {
  final String title;
    final CasesModel model;
  const CasesConfigPage({Key key, this.title = "CasesConfig", this.model, this.showAppBar = true})
      : super(key: key);

final bool showAppBar;

  @override
  _CasesConfigPageState createState() => _CasesConfigPageState();
}

class _CasesConfigPageState extends ModularState<CasesConfigPage, CasesConfigController> {
  // Variaveis para o status da class
  var status = ['Ativado', 'Desativado'];
  String itemSelected = 'Ativado';
  String currentStatus;


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
                child: Column(
                  children: <Widget>[
                     SizedBox(height: 10),
                      Text("Alterar status:", style: headerTextStyle),
                    /*    DropdownButton(
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
                      ), */
                       Divider(height: 20),
                      Text("Alterar nome da turma:", style: headerTextStyle),
                      // Nome da turma
                      TextFormField(
                        maxLength: 20,
                        //initialValue: widget.classModel.className,
                         initialValue: "k",
                        //onChanged: (v) => widget.classModel.className = v,
                        decoration: const InputDecoration(
                          labelText: 'Nome da turma',
                          prefixIcon: Icon(Icons.title),
                        ),
                      ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}
