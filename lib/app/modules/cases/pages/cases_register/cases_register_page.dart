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
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _imageUrl = TextEditingController();

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
                    // _title
                    TextFormField(
                        controller: _title,
                        maxLength: 20,
                        decoration: const InputDecoration(
                          labelText: 'Titulo do caso',
                          hintText: "Digite o titulo do caso",
                          prefixIcon: Icon(Icons.title),
                        )),

                    // _description
                    TextFormField(
                        controller: _description,
                        maxLength: 20,
                        decoration: const InputDecoration(
                          labelText: 'Digite o texto para o caso',
                          hintText: "Digite um texto para o caso",
                          prefixIcon: Icon(Icons.format_align_left),
                        )),

                    // _imgUrl
                    TextFormField(
                        controller: _imageUrl,
                        keyboardType: TextInputType.text,
                        maxLength: 40,
                        decoration: const InputDecoration(
                          labelText: 'Digite a url da imagem',
                          hintText: 'Digite o caminho da imagem',
                          prefixIcon: Icon(Icons.image),
                        )),
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
                        model.imageUrl = _imageUrl.text;

                        controller.save(model);
                        _showAlertDialog(context);
                      },
                      color: appColor,
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
        _imageUrl.text = '';
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
