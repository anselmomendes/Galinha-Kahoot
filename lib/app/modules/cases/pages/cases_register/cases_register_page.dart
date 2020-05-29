import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_register/cases_register_controller.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import '../../../../shared/widgets/text_form_field/TextFormField.dart';

class CasesRegisterPage extends StatefulWidget {
  final String title;
  const CasesRegisterPage({Key key, this.title = "CasesRegister"})
      : super(key: key);

  @override
  _CasesRegisterPageState createState() => _CasesRegisterPageState();
}

class _CasesRegisterPageState
    extends ModularState<CasesRegisterPage, CasesRegisterController> {
  /*
    Vamos criar outra tela para criar caso.
    */
  final _title = TextEditingController();
  final _description = TextEditingController();
  final _topicOne = TextEditingController();
  final _textOne = TextEditingController();
  final _imageUrlOne = TextEditingController();
  final _topicTwo = TextEditingController();
  final _textTwo = TextEditingController();
  final _imageUrlTwo = TextEditingController();
  final _topicTree = TextEditingController();
  final _textTree = TextEditingController();
  final _imageUrlTree = TextEditingController();
  final _topicFour = TextEditingController();
  final _textFour = TextEditingController();
  final _imageUrlFour = TextEditingController();
  final _topicFive = TextEditingController();
  final _textFive = TextEditingController();
  final _imageUrlFive = TextEditingController();
  final _topicSix = TextEditingController();
  final _textSix = TextEditingController();
  final _imageUrlSix = TextEditingController();

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
                    //tela1
                    textFormFieldCustom(
                        controller: _topicOne,
                        labelText: 'Digite o titulo do topíco 1',
                        hintText: 'Digite o titulo do topíco 1',
                        icon: Icon(Icons.description)),
                    textFormFieldCustom(
                        controller: _textOne,
                        labelText: 'Digite o digite o texto 1',
                        hintText: 'Digite o digite o texto 1',
                        icon: Icon(Icons.description)),
                    textFormFieldCustom(
                        controller: _imageUrlOne,
                        labelText: 'Url da imagem 1',
                        hintText: 'Url da imagem 1',
                        icon: Icon(Icons.description)),
                    textFormFieldCustom(
                        controller: _topicTwo,
                        labelText: 'Digite o titulo do topíco 2',
                        hintText: 'Digite o titulo do topíco 2',
                        icon: Icon(Icons.description)),
                    textFormFieldCustom(
                        controller: _textTwo,
                        labelText: 'Digite o digite o texto 2',
                        hintText: 'Digite o digite o texto 2',
                        icon: Icon(Icons.description)),
                    textFormFieldCustom(
                        controller: _imageUrlTwo,
                        labelText: 'Url da imagem 2',
                        hintText: 'Url da imagem 2',
                        icon: Icon(Icons.description)),
                    textFormFieldCustom(
                        controller: _topicTree,
                        labelText: 'Digite o titulo do topíco 3',
                        hintText: 'Digite o titulo do topíco 3',
                        icon: Icon(Icons.description)),
                    textFormFieldCustom(
                        controller: _textTree,
                        labelText: 'Digite o digite o texto 3',
                        hintText: 'Digite o digite o texto 3',
                        icon: Icon(Icons.description)),
                    textFormFieldCustom(
                        controller: _imageUrlTree,
                        labelText: 'Url da imagem 3',
                        hintText: 'Url da imagem 3',
                        icon: Icon(Icons.description)),
                    textFormFieldCustom(
                        controller: _topicFour,
                        labelText: 'Digite o titulo do topíco 4',
                        hintText: 'Digite o titulo do topíco 4',
                        icon: Icon(Icons.description)),
                    textFormFieldCustom(
                        controller: _textFour,
                        labelText: 'Digite o digite o texto 4',
                        hintText: 'Digite o digite o texto 4',
                        icon: Icon(Icons.description)),
                    textFormFieldCustom(
                        controller: _imageUrlFour,
                        labelText: 'Url da imagem 4',
                        hintText: 'Url da imagem 4',
                        icon: Icon(Icons.description)),
                    textFormFieldCustom(
                        controller: _topicFive,
                        labelText: 'Digite o titulo do topíco 5',
                        hintText: 'Digite o titulo do topíco 5',
                        icon: Icon(Icons.description)),
                    textFormFieldCustom(
                        controller: _textFive,
                        labelText: 'Digite o digite o texto 5',
                        hintText: 'Digite o digite o texto 5',
                        icon: Icon(Icons.description)),
                    textFormFieldCustom(
                        controller: _imageUrlFive,
                        labelText: 'Url da imagem 5',
                        hintText: 'Url da imagem 5',
                        icon: Icon(Icons.description)),
                    textFormFieldCustom(
                        controller: _topicSix,
                        labelText: 'Digite o titulo do topíco 6',
                        hintText: 'Digite o titulo do topíco 6',
                        icon: Icon(Icons.description)),
                    textFormFieldCustom(
                        controller: _textSix,
                        labelText: 'Digite o digite o texto 6',
                        hintText: 'Digite o digite o texto 6',
                        icon: Icon(Icons.description)),
                    textFormFieldCustom(
                        controller: _imageUrlSix,
                        labelText: 'Url da imagem 6',
                        hintText: 'Url da imagem 6',
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
                        // campos de imputs igual;
                        model.title = _title.text;
                        model.description = _description.text;
                        model.topicOne = _topicOne.text;
                        model.textOne = _textOne.text;
                        model.imageUrlOne = _imageUrlOne.text;
                        model.topicTwo = _topicTwo.text;
                        model.textTwo = _textTwo.text;
                        model.imageUrlTwo = _imageUrlTwo.text;
                        model.topicTree = _topicTree.text;
                        model.textTree = _textTree.text;
                        model.imageUrlTree = _imageUrlTree.text;
                        model.topicFour = _topicFour.text;
                        model.textFour = _textFour.text;
                        model.imageUrlFour = _imageUrlFour.text;
                        model.topicFive = _topicFive.text;
                        model.textFive = _textFive.text;
                        model.imageUrlFive = _imageUrlFive.text;
                        model.topicSix = _topicSix.text;
                        model.textSix = _textSix.text;
                        model.imageUrlSix = _imageUrlSix.text;

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
        _topicOne.text = '';
        _textOne.text = '';
        _imageUrlOne.text = '';
        _topicTwo.text = '';
        _textTwo.text = '';
        _imageUrlTwo.text = '';
        _topicTree.text = '';
        _textTree.text = '';
        _imageUrlTree.text = '';
        _topicFour.text = '';
        _textFour.text = '';
        _imageUrlFour.text = '';
        _topicFive.text = '';
        _textFive.text = '';
        _imageUrlFive.text = '';
        _topicSix.text = '';
        _textSix.text = '';
        _imageUrlSix.text = '';
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
