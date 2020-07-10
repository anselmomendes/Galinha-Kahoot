import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/ComponentModel.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_edit/cases_edit_controller.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import 'package:galinha_karoot/app/shared/widgets/raise_button/RaiseButton.dart';

class CasesEditPage extends StatefulWidget {
  final String title;
  final ComponentModel model;
  const CasesEditPage({Key key, this.title = "CasesEdit", this.model})
      : super(key: key);

  @override
  _CasesEditPageState createState() => _CasesEditPageState();
}

class _CasesEditPageState
    extends ModularState<CasesEditPage, CasesEditController> {
  TextEditingController initalValue = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: appContrastColor,
        title: Text('Editar Campos'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
        child: ListView(
          children: <Widget>[
            Container(height: screenWidth * 1.2, child: _selectField()),
            // SizedBox(height: 20),
            circularButton(
                text: 'Salvar',
                func: () async {
                  widget.model.value = initalValue.text.toString();
                  if (await controller.update(widget.model)) {
                    _showAlertDialog(context, 'Componente Registrado',
                        'O componente do caso foi registrado com sucesso!');
                  } else
                    _showAlertDialog(context, 'Componente não Registrado',
                        'O componente do caso não foi registrado com sucesso!');
                })
          ],
        ),
      ),
    );
  }

  Widget _selectField() {
    if (widget.model.type.compareTo("topic") == 0) {
      return _fieldTopic();
    } else if (widget.model.type.compareTo("text") == 0) {
      return _fieldText();
    } else if (widget.model.type.compareTo("image") == 0) {
      return _fieldImage();
    } else
      return null;
  }

  Widget _fieldTopic() {
    return Column(
      children: <Widget>[
        SizedBox(height: 5),
        Text(
          'Título',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5),
        TextFormField(
          controller: initalValue,
          maxLength: 40,
          //initialValue: _textFour.text,
          decoration: InputDecoration(
            labelText: 'Digite um título para o caso',
            hintText: 'Digite o título',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _fieldText() {
    return Column(
      children: <Widget>[
        SizedBox(height: 5),
        Text(
          'Descrição',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5),
        TextFormField(
          controller: initalValue,
          maxLength: 1000,
          maxLines: 5,
          //initialValue: widget.model.topicTree,
          decoration: InputDecoration(
            labelText: 'Digite um conteúdo para o caso',
            hintText: 'Descreva o caso',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _fieldImage() {
    return Column(
      children: <Widget>[
        SizedBox(height: 5),
        Text(
          'Imagem',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5),
        TextFormField(
          maxLength: 50,
          controller: initalValue,
          // initialValue: controller.casesViewModel.casesPage.data[0].toString(),
          decoration: InputDecoration(
            labelText: 'Digite o link da imagem',
            hintText: 'Insira o link',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
          ),
        ),
      ],
    );
  }

  void _showAlertDialog(BuildContext context, String titulo, String mensagem) {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Modular.to.pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text(titulo),
      content: Text(mensagem),
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
