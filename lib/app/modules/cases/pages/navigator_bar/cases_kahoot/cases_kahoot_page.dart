import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_kahoot/cases_kahoot_controller.dart';
import 'package:galinha_karoot/app/shared/widgets/raise_button/RaiseButton.dart';

class CasesKahootPage extends StatefulWidget {
  final String title;
  final CasesModel model;
  const CasesKahootPage({Key key, this.title = "CasesKahoot", this.model})
      : super(key: key);

  @override
  _CasesKahootPageState createState() => _CasesKahootPageState();
}

class _CasesKahootPageState
    extends ModularState<CasesKahootPage, CasesKahootController> {
  final _topicFour = TextEditingController();
  final _textFour = TextEditingController();
  final _imageUrlFour = TextEditingController();

  @override
  Widget build(BuildContext context) {
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
        backgroundColor: Colors.red,
        title: Text(widget.title),
        centerTitle: true,
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.red,
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
                widget.model.imageUrlFour, //widget.casesModel.imageUrlFour,
                height: 300,
                width: 300,
              ),
            ),
            SizedBox(height: 50),
            Container(
              height: 50,
              child: Text(
                widget.model.topicFour, //widget.casesModel.textFour,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              height: 300,
              child: Text(
                widget.model.textFour, //widget.casesModel.textFour,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Scaffold modoEdicao(CasesModel model) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: Colors.red,
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
              //initialValue: widget.model.topicFour,
              decoration: InputDecoration(
                labelText: 'Digite um conteudo para o caso',
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
              controller: _imageUrlFour,
              //initialValue: widget.model.topicFour,
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
                  widget.model.topicFour = _topicFour.text;
                  widget.model.textFour = _textFour.text;
                  widget.model.imageUrlFour = _imageUrlFour.text;
                  if (widget.model.imageUrlFour == '')
                    widget.model.imageUrlFour =
                        'https://livecasthd.com.br/sem_foto.png';
                  controller.save(widget.model);
                  controller.editMode = false;
                }),
          ],
        ),
      ),
    );
  }
}
