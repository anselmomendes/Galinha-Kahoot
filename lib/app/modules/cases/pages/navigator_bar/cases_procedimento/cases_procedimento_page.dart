import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_procedimento/cases_procedimento_controller.dart';
import 'package:galinha_karoot/app/shared/widgets/raise_button/RaiseButton.dart';

class CasesProcedimentoPage extends StatefulWidget {
  final String title;
  final CasesModel model;
  const CasesProcedimentoPage(
      {Key key, this.title = "CasesProcedimento", this.model})
      : super(key: key);

  @override
  _CasesProcedimentoPageState createState() => _CasesProcedimentoPageState();
}

class _CasesProcedimentoPageState
    extends ModularState<CasesProcedimentoPage, CasesProcedimentoController> {
  final _topicFive = TextEditingController();
  final _textFive = TextEditingController();
  final _imageUrlFive = TextEditingController();

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
                widget.model.imageUrlFive, //widget.casesModel.imageUrlFive,
                height: 300,
                width: 300,
              ),
            ),
            SizedBox(height: 50),
            Container(
              height: 50,
              child: Text(
                widget.model.topicFive, //widget.casesModel.textFive,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              height: 300,
              child: Text(
                widget.model.textFive, //widget.casesModel.textFive,
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
              controller: _topicFive,
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
              controller: _textFive,
              maxLength: 1000,
              maxLines: 5,
              //initialValue: widget.model.topicFive,
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
              controller: _imageUrlFive,
              //initialValue: widget.model.topicFive,
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
                  widget.model.topicFive = _topicFive.text;
                  widget.model.textFive = _textFive.text;
                  widget.model.imageUrlFive = _imageUrlFive.text;
                  if (widget.model.imageUrlFive == '')
                    widget.model.imageUrlFive =
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
