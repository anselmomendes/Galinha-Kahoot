import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_register/cases_register_controller.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';

import '../../../../shared/widgets/text_form_field/TextFormField.dart';

class CasesRegisterPage extends StatefulWidget {
  final String title;
  const CasesRegisterPage({
    Key key,
    this.title,
  }) : super(key: key);

  @override
  _CasesRegisterPageState createState() => _CasesRegisterPageState();
}

class _CasesRegisterPageState
    extends ModularState<CasesRegisterPage, CasesRegisterController> {
  final _title = TextEditingController();
  final _description = TextEditingController();

  @override
  Widget build(BuildContext context) {
    CasesModel model = CasesModel();
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Cadastrar Caso"),
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
              Text("Cadastrar Casos", style: headerTextStyle),
              SizedBox(height: 20),
              Form(
                child: Column(
                  children: <Widget>[
                    //title
                    textFormFieldCustom(
                        controller: _title,
                        labelText: 'Digite um título',
                        hintText: 'Digite um título',
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
                      onPressed: () {
                        model.title = _title.text;
                        model.description = _description.text;
                        model.public = 'false';
                        controller.save(model);
                        _showAlertDialog(context);
                      },
                      color: appContrastColor,
                      child: Text('Registrar-se',
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
