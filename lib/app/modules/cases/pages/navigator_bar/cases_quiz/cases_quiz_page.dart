import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/models/QuizModel.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_quiz/cases_quiz_controller.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import 'package:galinha_karoot/app/shared/widgets/raise_button/RaiseButton.dart';

class CasesQuizPage extends StatefulWidget {
  final CasesModel model;
  final String title;
  const CasesQuizPage({Key key, this.title = "CasesQuiz", this.model}) : super(key: key);

  @override
  _CasesQuizPageState createState() => _CasesQuizPageState();
}

class _CasesQuizPageState extends ModularState<CasesQuizPage, CasesQuizController> {
  /* final _topicOne = TextEditingController();
  final _textOne = TextEditingController();
  final _imageUrlOne = TextEditingController(); */

  // Map<String, dynamic> mapTest = {"type": "title", "content": "content"};
  List listTest = [];

  /* @override
  void initState() {
    controller.getList('5Eg2Dv0erU37JCjQYoRI');
    // controller.getList(widget.model.id);
    super.initState();
  } */

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      // if (controller.editMode) {
        return modeEdition(widget.model);
      /* } else
        return modeVisualisation(); */
    });
  }

/*   // Modo visualização do tópico do caso
  Scaffold modeVisualisation() {
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
                widget.model.imageUrlOne, //widget.casesModel.imageUrlTwo,
                height: 300,
                width: 300,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              child: Text(
                widget.model.topicOne, //widget.casesModel.textTwo,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              height: 300,
              child: Text(
                widget.model.textOne, //widget.casesModel.textTwo,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  } */

  // Modo edição (adicionar ou excluir campos)
  Scaffold modeEdition(CasesModel model) {
    var screenWidth = MediaQuery.of(context).size.width;
    
    // controller.getList('5Eg2Dv0erU37JCjQYoRI');
    // controller.getList(widget.model.id);

    /* // Iniciado os campos com os texto do db
    _topicOne.text = widget.model.topicOne;
    _textOne.text = widget.model.textOne;
    _imageUrlOne.text = widget.model.imageUrlOne; */

    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: appContrastColor,
        title: Text('Adicionar Campos'),
        // title: Text('Edição - ${widget.title}'),
        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          // Lista de de casos (teste)
          Container(
            height: screenWidth * 1.05,
            child: Observer(
              builder: (_) {
                // if (controller.casesList.data == null)
                if (controller.quizList.data == null)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                // else if (controller.casesList.hasError)
                else if (controller.quizList.hasError)
                  return Center(
                    child: RaisedButton(
                      // onPressed: () => controller.getList('5Eg2Dv0erU37JCjQYoRI'),
                      // onPressed: () => controller.getList(widget.model.id),
                      onPressed: () => controller.getList(),
                      child: Text('Error'),
                    ),
                  );
                else {
                  // List<CasesModel> list = controller.casesList.data;
                  List<QuizModel> list = controller.quizList.data;
                  // List<dynamic> list2 = mapTest.values.toList();
                  // listTest.add(mapTest);
                  // print(listTest);

                  return ListView.builder(
                    itemCount: list.length,
                    itemBuilder: (_, index) {
                      // CasesModel model = list[index];
                      QuizModel model = list[index];
                      // Map model = listTest[index];

                      return Container(
                        // height: 60,
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
                                      // 'Caso ${model.topicOne}',
                                      // '${model['type']}',
                                      'Question: ${model.question}',
                                      // 'teste',
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
                              print(index);
                              // Navigator.pushNamed(context, '/cases/cases_edit', arguments: model);
                              //Navigator.pushNamed(context, '/teacher/teacher_menu');
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
          Divider(),
          Container(
            //height: 50,
            child: Padding(
              padding: EdgeInsets.fromLTRB(5.0, 0.0, 5.0, 0.0),
              child: Column(
                children: <Widget>[
                  Text(
                    'Adicionar Campos',
                    style: TextStyle(fontWeight: FontWeight.bold),
                    // style: TextStyle(fontSize: 18),
                    textAlign: TextAlign.center,
                  ),
                  Row(
                    children: <Widget>[
                      Padding(
                        padding: EdgeInsets.only(left: screenWidth * 0.05),
                        child: circularButton(
                            text: 'Imagem',
                            func: () {
                              _addImage();
                              /* Navigator.pushNamed(
                              context, 'teacher/teacher_perfil_edit',
                              arguments: model); */
                            }),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(),
                      ),
                      // SizedBox(height: 10.0,),
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: circularButton(
                            text: 'Texto',
                            func: () {
                              // _addText();
                              /* Navigator.pushNamed(
                              context, 'teacher/teacher_perfil_edit',
                              arguments: model); */
                            }),
                      ),
                      Expanded(
                        flex: 2,
                        child: Container(),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: screenWidth * 0.05),
                        child: circularButton(
                            text: 'Título',
                            func: () {
                              // _addTitle();
                              /* Navigator.pushNamed(
                              context, 'teacher/teacher_perfil_edit',
                              arguments: model); */
                            }),
                      ),
                      SizedBox(height: 10),
                    ],
                  ),
                  Divider(),
                  Padding(
                    padding: EdgeInsets.only(left: screenWidth * 0.05),
                    // padding: EdgeInsets.all(screenWidth * 0.05),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'Último Campo',
                          style: TextStyle(fontWeight: FontWeight.bold),
                          // style: TextStyle(fontSize: 18),
                          textAlign: TextAlign.center,
                        ),
                        circularButton(
                            text: 'Excluir',
                            func: () {
                              // _delField();
                              /* Navigator.pushNamed(
                              context, 'teacher/teacher_perfil_edit',
                              arguments: model); */
                            }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Adiciona um campo para texto
  void _addText() {
    Map<String, dynamic> mapTestText = {"type": "title", "content": "content"};

    mapTestText['type'] = 'text';
    listTest.add(mapTestText);
    setState(() {
      listTest;
    });
  }

  // Adiciona um campo para imagem
  void _addImage() {
    /* Map<String, dynamic> mapTestImage = {"type": "title", "content": "content"};

    mapTestImage['type'] = 'image';
    listTest.add(mapTestImage); */
    setState(() {
      // listTest;
    });
  }

  // Adiciona um campo para título
  void _addTitle() {
    Map<String, dynamic> mapTestTitle = {"type": "title", "content": "content"};

    mapTestTitle['type'] = 'title';
    listTest.add(mapTestTitle);
    setState(() {
      listTest;
    });
  }

  // Exclui campo (último campo inserido)
  void _delField() {
    setState(() {
      listTest.removeLast();
    });
  }

}