import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_avaliacao/cases_avaliacao_controller.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import 'package:galinha_karoot/app/shared/widgets/raise_button/RaiseButton.dart';

class CasesAvaliacaoPage extends StatefulWidget {
  final String title;
  final CasesModel model;
  const CasesAvaliacaoPage(
      {Key key, this.title = "Avaliação Física", this.model})
      : super(key: key);

  @override
  _CasesAvaliacaoPageState createState() => _CasesAvaliacaoPageState();
}

class _CasesAvaliacaoPageState
    extends ModularState<CasesAvaliacaoPage, CasesAvaliacaoController> {
  final _topicTwo = TextEditingController();
  final _textTwo = TextEditingController();
  final _imageUrlTwo = TextEditingController();

  @override
  Widget build(BuildContext context) {
    /*
    return Observer(builder: (_) {
      if (controller.editMode) {
        return modoEdicao(widget.model);
      } else
        return modoVisualizacao();
    });
  }

  Scaffold modoVisualizacao() {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: appContrastColor,
        title: Text(widget.title),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: appContrastColor,
          child: Icon(Icons.edit),
          onPressed: () {
            controller.editMode = true;
          }),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
        child: Column(
          children: <Widget>[
            Container(
              child: Image.network(
                widget.model.imageUrlTwo, //widget.casesModel.imageUrlTwo,
                height: 300,
                width: 300,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              child: Text(
                widget.model.topicTwo, //widget.casesModel.textTwo,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              height: 300,
              child: Text(
                widget.model.textTwo, //widget.casesModel.textTwo,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Scaffold modoEdicao(CasesModel model) {

    // Iniciado os campos com os texto do db
    _topicTwo.text = widget.model.topicTwo;
    _textTwo.text = widget.model.textTwo;
    _imageUrlTwo.text = widget.model.imageUrlTwo;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: appContrastColor,
        title: Text('Edição - ${widget.title}'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
        child: ListView(
          children: <Widget>[
            SizedBox(height: 5),
            Text(
              'Título',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            TextFormField(
              controller: _topicTwo,
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
            SizedBox(height: 5),
            Text(
              'Descrição',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            TextFormField(
              controller: _textTwo,
              maxLength: 1000,
              maxLines: 5,
              //initialValue: widget.model.topicTwo,
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
            SizedBox(height: 5),
            Text(
              'Imagem',
              style: TextStyle(fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 5),
            TextFormField(
              maxLength: 50,
              controller: _imageUrlTwo,
              //initialValue: widget.model.topicTwo,
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
            SizedBox(height: 20),
            circularButton(
                text: 'Salvar',
                func: () {
                  widget.model.topicTwo = _topicTwo.text;
                  widget.model.textTwo = _textTwo.text;
                  widget.model.imageUrlTwo = _imageUrlTwo.text;
                  if (widget.model.imageUrlTwo == '')
                    widget.model.imageUrlTwo =
                        'https://livecasthd.com.br/sem_foto.png';
                  controller.save(widget.model);
                  controller.editMode = false;
                }),
          ],
        ),
      ),
    );*/
  }
}
