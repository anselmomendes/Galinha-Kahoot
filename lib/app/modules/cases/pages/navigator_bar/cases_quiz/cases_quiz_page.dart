import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/models/ComponentModel.dart';
import 'package:galinha_karoot/app/modules/cases/models/QuizModel.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_quiz/cases_quiz_controller.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import 'package:galinha_karoot/app/shared/widgets/raise_button/RaiseButton.dart';

class CasesQuizPage extends StatefulWidget {
  final String title;
  final String page;
  final CasesModel model;
  const CasesQuizPage({Key key, this.title, this.model, this.page})
      : super(key: key);

  @override
  _CasesQuizPageState createState() => _CasesQuizPageState();
}

class _CasesQuizPageState
    extends ModularState<CasesQuizPage, CasesQuizController> {
  bool editMode;

  @override
  void initState() {
    controller.getDocuments(widget.model.id, widget.page);
    editMode = false;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Observer(builder: (_) {
      return modeEdition(widget.model, screenWidth);
      /* if (editMode == true) {
        return modeEdition(widget.model, screenWidth);
      } else {
        return modeVisualization(screenWidth);
      } */
    });
  }

  // Modo visualização do tópico do caso
  Scaffold modeVisualization(var screenWidth) {
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
              setState(() {
                editMode = true;
              });
            }),
        body: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
          child: Column(
            children: <Widget>[
              Container(
                height: screenWidth * 1.4,
                child: Observer(
                  name: 'componentes',
                  builder: (_) {
                    if (controller.quiz == null)
                      return Center(
                        child: CircularProgressIndicator(),
                      );
                    else {
                      List<QuizModel> list = controller.quiz;
                      return ListView.builder(
                        itemCount: controller.quiz.length,
                        itemBuilder: (_, index) {
                          QuizModel model = list[index];

                          if (model.type.compareTo("type1") == 0) {
                            return Container(
                              height: 60,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                      'Questão ${index + 1} - Múltipla escolha',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(model.question,
                                      textAlign: TextAlign.justify,
                                      style: TextStyle(
                                        fontSize: 18,
                                        // fontWeight: FontWeight.bold,
                                      )),
                                ],
                              ),
                            );
                          } else if (model.type.compareTo("type2") == 0) {
                            return Container(
                              height: 60,
                              child: Column(
                                children: <Widget>[
                                  Text(
                                      'Questão ${index + 1} - Verdadeiro ou falso',
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold,
                                      )),
                                  Text(
                                    model.question,
                                    textAlign: TextAlign.justify,
                                    style: TextStyle(
                                      fontSize: 18,
                                      // fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ],
                              ),
                            );
                          }

                          /* return Container(
                          child: Card(
                            margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                            elevation: 20,
                            child: GestureDetector(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    title: Center(
                                      child: Text(
                                        model.type,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/cases/cases_edit',
                                    arguments: model);
                              },
                            ),
                          ),
                        ); */
                        },
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ));
  }

  // Modo edição (adicionar ou excluir campos)
  Scaffold modeEdition(CasesModel model, var screenWidth) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: appContrastColor,
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              height: screenWidth * 1.15,
              child: Observer(
                name: 'componentes',
                builder: (_) {
                  if (controller.quiz == null)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  else {
                    List<QuizModel> list = controller.quiz;
                    return ListView.builder(
                      itemCount: controller.quiz.length,
                      itemBuilder: (_, index) {
                        QuizModel model = list[index];

                        return Container(
                          child: Card(
                            margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                            elevation: 20,
                            child: GestureDetector(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    title: _selectQuestionType(model, index),
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/cases/cases_quiz_edit',
                                    arguments: model);
                              },
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            Text(
              'Adicionar Questão',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.1),
                  child: circularButton(
                      text: 'Múltipla \nEscolha',
                      sizeFont: 14,
                      func: () async {
                        QuizModel model = QuizModel();
                        // type1 representa as questões de múltiplas escolhas
                        model.type = 'type1';
                        model.idCases = widget.model.id;
                        model.page = widget.page;
                        model.question = 'Digite o comando da questão.';
                        model.answers1 = 'Alternativa 1';
                        model.answers2 = 'Alternativa 2';
                        model.answers3 = 'Alternativa 3';
                        model.answers4 = 'Alternativa 4';
                        model.answers5 = 'Alternativa 5';
                        model.commentary = 'Digite o comentário da questão.';
                        model.right = 'a';
                        model.time = 10;
                        // model.value = 'https://livecasthd.com.br/sem_foto.png';
                        await controller.create(model);
                        await controller.getDocuments(
                            widget.model.id, widget.page);
                      }),
                ),
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.1),
                  child: Row(
                    children: <Widget>[
                      circularButton(
                          text: 'Verdadeiro \nou Falso',
                          sizeFont: 14,
                          func: () async {
                            QuizModel model = QuizModel();
                            // type2 representa as questões do tipo verdadeiro ou falso
                            model.type = 'type2';
                            model.idCases = widget.model.id;
                            model.page = widget.page;
                            model.question = 'Digite o comando da questão.';
                            /* model.answers1 = 'Verdadeira';
                            model.answers2 = 'Falsa'; */
                            model.commentary =
                                'Digite o comentário da questão.';
                            model.right = 'true';
                            model.time = 10;
                            await controller.create(model);
                            await controller.getDocuments(
                                widget.model.id, widget.page);
                          }),
                    ],
                  ),
                ),
                SizedBox(height: 10),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.zero,
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Última Questão',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        // style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      circularButton(
                          text: 'Excluir',
                          sizeFont: 18,
                          func: () async {
                            await controller.delete(
                                widget.model.id, widget.page);
                            await controller.getDocuments(
                                widget.model.id, widget.page);
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }

  // Exibir as questões por tipo
  Widget _selectQuestionType(QuizModel model, int index) {
    // type1 representa as questões de múltiplas escolhas
    if (model.type.compareTo('type1') == 0) {
      return Text(
        // model.type,
        "Questão ${index + 1} | Múltipla Escolha",
        textAlign: TextAlign.start,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      );
    }
    // type2 representa as questões do tipo verdadeiro ou falso
    else if (model.type.compareTo('type2') == 0) {
      return Text(
        // model.type,
        "Questão ${index + 1} | Verdadeiro ou Falso",
        textAlign: TextAlign.start,
        style: TextStyle(
          fontWeight: FontWeight.w500,
          fontSize: 16,
        ),
      );
    }
    return null;
  }

/*   Widget _selectField() {
    if (widget.model.type.compareTo("Título") == 0) {
      return _fieldTopic();
    } else if (widget.model.type.compareTo("Texto") == 0) {
      return _fieldText();
    } else if (widget.model.type.compareTo("Imagem") == 0) {
      return _fieldImage();
    } else
      return null;
  } */

/*   Widget _fieldTopic() {
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
  } */

}
