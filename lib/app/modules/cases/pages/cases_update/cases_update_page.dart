import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import 'package:galinha_karoot/app/shared/widgets/text_form_field/TextFormField.dart';

import 'cases_update_controller.dart';

class CasesUpdatePage extends StatefulWidget {
  final String title;
  final CasesModel model;
  const CasesUpdatePage({
    Key key,
    this.title,
    this.model,
  }) : super(key: key);

  @override
  _CasesUpdatePageState createState() => _CasesUpdatePageState();
}

class _CasesUpdatePageState
    extends ModularState<CasesUpdatePage, CasesUpdateController> {
  //use 'controller' variable to access controller
  final _title = TextEditingController();
  final _description = TextEditingController();
  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Atualizar Caso"),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            top: screenWidth * 0.2,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05),
        child: Center(
          child: Column(
            children: <Widget>[
              Image.asset("assets/bits.png",
                  width: MediaQuery.of(context).size.width * appLogoMediumSize),
              SizedBox(height: 20),
              Text("Atualizar Casos", style: headerTextStyle),
              SizedBox(height: 20),
              Form(
                child: Column(
                  children: <Widget>[
                    //title
                    textFormFieldCustom(
                        controller: _title,
                        labelText: 'Digite um title',
                        hintText: 'Digite um title',
                        icon: Icon(Icons.description)),
                    //description
                    textFormFieldCustom(
                        controller: _description,
                        labelText: 'Digite uma descrição',
                        hintText: 'Digite uma descrição',
                        icon: Icon(Icons.description)),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  FlatButton(
                      onPressed: () async {
                        widget.model.title = _title.text;
                        widget.model.description = _description.text;
                        await controller.update(widget.model);
                        _showAlertDialog(context);
                      },
                      color: appContrastColor,
                      child: Text('Atualizar',
                          style: TextStyle(color: Colors.white))),
                ],
              ),
              SizedBox(
                height: 20.0,
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        _title.text = '';
        _description.text = '';
        Modular.to.pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Caso registrado"),
      content: Text("O caso foi registrado com sucesso!"),
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
