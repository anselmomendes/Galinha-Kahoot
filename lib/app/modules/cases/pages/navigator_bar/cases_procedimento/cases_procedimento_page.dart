import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_procedimento/cases_procedimento_controller.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import 'package:galinha_karoot/app/shared/widgets/raise_button/RaiseButton.dart';

class CasesProcedimentoPage extends StatefulWidget {
  final String title;
  final CasesModel model;
  const CasesProcedimentoPage(
      {Key key, this.title = "Informações Cirúrgicas", this.model})
      : super(key: key);

  @override
  _CasesProcedimentoPageState createState() => _CasesProcedimentoPageState();
}

class _CasesProcedimentoPageState
    extends ModularState<CasesProcedimentoPage, CasesProcedimentoController> {
  final _topicTree = TextEditingController();
  final _textTree = TextEditingController();
  final _imageUrlTree = TextEditingController();

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
                widget.model.imageUrlTree, //widget.casesModel.imageUrlFive,
                height: 300,
                width: 300,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              child: Text(
                widget.model.topicTree, //widget.casesModel.textFive,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              height: 300,
              child: Text(
                widget.model.textTree, //widget.casesModel.textFive,
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
    _topicTree.text = widget.model.topicTree;
    _textTree.text = widget.model.textTree;
    _imageUrlTree.text = widget.model.imageUrlTree;

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
              controller: _topicTree,
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
              controller: _textTree,
              maxLength: 1000,
              maxLines: 5,
              //initialValue: widget.model.topicFive,
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
              controller: _imageUrlTree,
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
                  widget.model.topicTree = _topicTree.text;
                  widget.model.textTree = _textTree.text;
                  widget.model.imageUrlTree = _imageUrlTree.text;
                  if (widget.model.imageUrlTree == '')
                    widget.model.imageUrlTree =
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
