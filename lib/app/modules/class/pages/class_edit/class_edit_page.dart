import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
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

  // Variaveis para o status da class
  var _status = ['Ativado', 'Desativado'];
  var _itemSelecionado = 'Ativado';
  String _currentStatus;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    // ClassModel model = ClassModel();

    bool _statusBool = widget.classModel.status;
    _checkStatus(_statusBool);

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
                  Text("Status atual: $_currentStatus"),
                  // Parte do DropDown
                  DropdownButton(
                    items: _status.map((String dropDownStringItem) {
                      return DropdownMenuItem<String>(
                        value: dropDownStringItem,
                        child: Text(dropDownStringItem),
                      );
                    }).toList(),
                    onChanged: (String novoItemSelecionado) {
                      // _dropDownItemSelected(novoItemSelecionado);
                      setState(() {
                        _itemSelecionado = novoItemSelecionado;
                      });
                    },
                    value: _itemSelecionado,
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
      setState(() {
        this._currentStatus = 'Ativado';
      });
    } else {
      this._currentStatus = 'Desativado';
    }
  }
}
