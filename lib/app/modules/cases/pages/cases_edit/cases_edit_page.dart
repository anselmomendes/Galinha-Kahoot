import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/pages/cases_edit/cases_edit_controller.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import 'package:galinha_karoot/app/shared/widgets/raise_button/RaiseButton.dart';

class CasesEditPage extends StatefulWidget {
  final String title;
  final Map modelTest;
  const CasesEditPage({Key key, this.title = "CasesEdit", this.modelTest})
      : super(key: key);

  @override
  _CasesEditPageState createState() => _CasesEditPageState();
}

class _CasesEditPageState
    extends ModularState<CasesEditPage, CasesEditController> {
  final _topicFour = TextEditingController();
  final _textFour = TextEditingController();
  final _imageUrlFour = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    // Iniciado os campos com os texto do db
    // _topicFour.text = widget.model.topicFour;
    // _textFour.text = widget.model.textFour;
    // _imageUrlFour.text = widget.model.imageUrlFour;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: appContrastColor,
        title: Text('Editar Campos'),
        // title: Text('Edição - ${widget.title}'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
        child: ListView(
          children: <Widget>[
            Container(height: screenWidth*1.4, child: _selectField()),
            // SizedBox(height: 20),
            circularButton(
                text: 'Salvar',
                func: () {
                  // widget.model.topicFour = _topicFour.text;
                  // widget.model.textFour = _textFour.text;
                  // widget.model.imageUrlFour = _imageUrlFour.text;
                  // if (widget.model.imageUrlFour == '')
                  //   widget.model.imageUrlFour =
                  //       'https://livecasthd.com.br/sem_foto.png';
                  // controller.save(widget.model);
                  // controller.editMode = false;
                }),
          ],
        ),
      ),
    );
  }

  Widget _selectField() {
    if (widget.modelTest["type"].toString().compareTo("title") == 0) {
      return _fieldTitle();
    } else if (widget.modelTest["type"] == "text") {
      return _fieldText();
    } else if (widget.modelTest["type"] == "image") {
      return _fieldImage();
    }
    // print("Não é text ou image");
    return Text("Não é text ou image");
  }

  Widget _fieldTitle() {
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
          controller: _topicFour,
          maxLength: 40,
          //initialValue: 'a',
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
          controller: _textFour,
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
          controller: _imageUrlFour,
          //initialValue: widget.model.topicTree,
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
}
