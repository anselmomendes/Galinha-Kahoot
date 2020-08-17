import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/QuizModel.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import 'package:galinha_karoot/app/shared/widgets/raise_button/RaiseButton.dart';
import 'cases_quiz_edit_controller.dart';

class CasesQuizEditPage extends StatefulWidget {
  final String title;
  final QuizModel model;
  const CasesQuizEditPage({Key key, this.title = "Editar Questões", this.model})
      : super(key: key);

  @override
  _CasesQuizEditPageState createState() => _CasesQuizEditPageState();
}

class _CasesQuizEditPageState
    extends ModularState<CasesQuizEditPage, CasesQuizEditController> {
  //use 'controller' variable to access controller

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: appContrastColor,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
        child: ListView(
          children: <Widget>[
            Container(
              height: screenWidth * 1.2, 
              child: SingleChildScrollView(
                child: _selectField(),
              )
              ),
            // SizedBox(height: 20),
            circularButton(
                text: 'Salvar',
                func: () async {
                  // widget.model.value = _initalValue.text.toString();
                  if (await controller.update(widget.model)) {
                    _showAlertDialog(context, 'Questão Registrada',
                        'A questão foi registrada com sucesso!');
                  } else
                    _showAlertDialog(context, 'Questão não Registrada',
                        'A questão não foi registrada com sucesso!');
                })
          ],
        ),
      ),
    );
  }

  Widget _selectField() {
    if (widget.model.type.compareTo("type1") == 0) {
      return _questionType1();
    } else if (widget.model.type.compareTo("type2") == 0) {
      return _questionType2();
    } else
      return null;
  }

    // Questão do tipo Múltipla Escolha
    Widget _questionType1() {
    return Column(
      children: <Widget>[
        SizedBox(height: 5),
        Text(
          'Comando da questão',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5),
        TextFormField(
          // controller: _initalValue,
          maxLength: 200,
          maxLines: 3,
          initialValue: widget.model.question,
          onChanged: (v) => widget.model.question = v,
          decoration: InputDecoration(
            labelText: 'Digite o comando da questão',
            // hintText: 'Digite o título',
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
        SizedBox(height: 5),
        Text(
          'Alternativa (a)',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5),
        TextFormField(
          // controller: _initalValue,
          maxLength: 60,
          maxLines: 2,
          initialValue: widget.model.question,
          onChanged: (v) => widget.model.question = v,
          decoration: InputDecoration(
            labelText: 'Digite o comando da questão',
            // hintText: 'Digite o título',
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
        SizedBox(height: 5),
        Text(
          'Alternativa (b)',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5),
        TextFormField(
          // controller: _initalValue,
          maxLength: 60,
          maxLines: 2,
          initialValue: widget.model.question,
          onChanged: (v) => widget.model.question = v,
          decoration: InputDecoration(
            labelText: 'Digite o comando da questão',
            // hintText: 'Digite o título',
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
        SizedBox(height: 5),
        Text(
          'Alternativa (c)',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5),
        TextFormField(
          // controller: _initalValue,
          maxLength: 60,
          maxLines: 2,
          initialValue: widget.model.question,
          onChanged: (v) => widget.model.question = v,
          decoration: InputDecoration(
            labelText: 'Digite o comando da questão',
            // hintText: 'Digite o título',
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
        SizedBox(height: 5),
        Text(
          'Alternativa (d)',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5),
        TextFormField(
          // controller: _initalValue,
          maxLength: 60,
          maxLines: 2,
          initialValue: widget.model.question,
          onChanged: (v) => widget.model.question = v,
          decoration: InputDecoration(
            labelText: 'Digite o comando da questão',
            // hintText: 'Digite o título',
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
        SizedBox(height: 5),
        Text(
          'Alternativa (e)',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5),
        TextFormField(
          // controller: _initalValue,
          maxLength: 60,
          maxLines: 2,
          initialValue: widget.model.question,
          onChanged: (v) => widget.model.question = v,
          decoration: InputDecoration(
            labelText: 'Digite o comando da questão',
            // hintText: 'Digite o título',
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

  // Questão do tipo Verdadeirou ou Falso
  Widget _questionType2() {
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
          // controller: _initalValue,
          maxLength: 1000,
          maxLines: 5,
          //initialValue: widget.model.topicTree,
          initialValue: widget.model.question,
          onChanged: (v) => widget.model.question = v,
          decoration: InputDecoration(
            labelText: 'Digite um conteúdo para o caso',
            // hintText: 'Descreva o caso',
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
