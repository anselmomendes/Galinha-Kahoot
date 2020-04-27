import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_register/cases_register_controller.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';

class CasesRegisterPage extends StatefulWidget {
  final String title;
  const CasesRegisterPage({Key key, this.title = "CasesRegister"})
      : super(key: key);

  @override
  _CasesRegisterPageState createState() => _CasesRegisterPageState();
}

class _CasesRegisterPageState
    extends ModularState<CasesRegisterPage, CasesRegisterController> {
  final _question = TextEditingController();
  final _answers1 = TextEditingController();
  final _answers2 = TextEditingController();
  final _answers3 = TextEditingController();
  final _answers4 = TextEditingController();
  final _answers5 = TextEditingController();
  final _right = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    CasesModel model = CasesModel();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.redAccent,
        title: Text("Cadastro de novo Caso"),
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
                    // _question
                    TextFormField(
                        controller: _question,
                        maxLength: 50,
                        decoration: const InputDecoration(
                          labelText: 'Pergunta',
                          hintText: "Digite sua pergunta",
                          prefixIcon: Icon(Icons.border_color),
                        )),

                    // _answers1
                    TextFormField(
                        controller: _answers1,
                        maxLength: 20,
                        decoration: const InputDecoration(
                          labelText: 'Resposta 1',
                          hintText: "Digite uma resposta",
                          prefixIcon: Icon(Icons.filter_1),
                        )),

                    // _answers2
                    TextFormField(
                        controller: _answers2,
                        maxLength: 20,
                        decoration: const InputDecoration(
                          labelText: 'Resposta 2',
                          hintText: "Digite uma resposta",
                          prefixIcon: Icon(Icons.filter_2),
                        )),

                    // _answers3
                    TextFormField(
                        controller: _answers3,
                        maxLength: 20,
                        decoration: const InputDecoration(
                          labelText: 'Resposta 3',
                          hintText: "Digite uma resposta",
                          prefixIcon: Icon(Icons.filter_3),
                        )),

                    // _answers4
                    TextFormField(
                        controller: _answers4,
                        maxLength: 20,
                        decoration: const InputDecoration(
                          labelText: 'Resposta 4',
                          hintText: "Digite uma resposta",
                          prefixIcon: Icon(Icons.filter_4),
                        )),

                    // _answers5
                    TextFormField(
                        controller: _answers5,
                        maxLength: 20,
                        decoration: const InputDecoration(
                          labelText: 'Resposta 5',
                          hintText: "Digite uma resposta",
                          prefixIcon: Icon(Icons.filter_5),
                        )),

                    // _right
                    TextFormField(
                        controller: _right,
                        keyboardType: TextInputType.number,
                        maxLength: 1,
                        decoration: const InputDecoration(
                          labelText: 'Resposta Correta',
                          hintText: 'Digite a alternativa correta',
                          prefixIcon: Icon(Icons.done),
                        )),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Observer(
                    builder: (BuildContext context) {
                      return FlatButton(
                          onPressed: () {
                            model.question = _question.text;
                            model.answers1 = _answers1.text;
                            model.answers2 = _answers2.text;
                            model.answers3 = _answers3.text;
                            model.answers4 = _answers4.text;
                            model.answers5 = _answers5.text;
                            model.right = _right.text;

                            controller.save(model);
                            _showAlertDialog(context);
                          },
                          color: appColor,
                          child: Text('Registrar-se',
                              style: TextStyle(color: Colors.white)));
                    },
                  )
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
        _question.text = '';
        _answers1.text = '';
        _answers2.text = '';
        _answers3.text = '';
        _answers4.text = '';
        _answers5.text = '';
        _right.text = '';
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
