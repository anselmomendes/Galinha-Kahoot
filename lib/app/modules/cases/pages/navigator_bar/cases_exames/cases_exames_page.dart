import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_exames/cases_exames_controller.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import 'package:galinha_karoot/app/shared/widgets/raise_button/RaiseButton.dart';

class CasesExamesPage extends StatefulWidget {
  final String title;
  final CasesModel model;
  const CasesExamesPage(
      {Key key, this.title = "Exames Complementares", this.model})
      : super(key: key);

  @override
  _CasesExamesPageState createState() => _CasesExamesPageState();
}

class _CasesExamesPageState
    extends ModularState<CasesExamesPage, CasesExamesController> {
  final _topicFour = TextEditingController();
  final _textFour = TextEditingController();
  final _imageUrlFour = TextEditingController();
  
  List listTest = [];

  @override
  Widget build(BuildContext context) {
    /*
    return Observer(builder: (_) {
      if (controller.editMode) {
        return modeEdition(widget.model);
      } else
        return modeVisualisation();
    });
  }

  // Modo visualização do tópico do caso
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
                widget.model.imageUrlFour, //widget.casesModel.imageUrlTree,
                height: 300,
                width: 300,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              child: Text(
                widget.model.topicFour, //widget.casesModel.textTree,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              height: 300,
              child: Text(
                widget.model.textFour, //widget.casesModel.textTree,
                style: TextStyle(fontSize: 18),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Modo edição (adicionar ou excluir campos)
  Scaffold modeEdition(CasesModel model) {
    var screenWidth = MediaQuery.of(context).size.width;

    // Iniciado os campos com os texto do db
    _topicFour.text = widget.model.topicFour;
    _textFour.text = widget.model.textFour;
    _imageUrlFour.text = widget.model.imageUrlFour;

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
                if (controller.casesList.data == null)
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                else if (controller.casesList.hasError)
                  return Center(
                    child: RaisedButton(
                      onPressed: () => controller.getList(),
                      child: Text('Error'),
                    ),
                  );
                else {
                  // List<CasesModel> list = controller.casesList.data;
                  // List<dynamic> list2 = mapTest.values.toList();
                  // listTest.add(mapTest);
                  print(listTest);

                  return ListView.builder(
                    // itemCount: list.length,
                    itemCount: listTest.length,
                    itemBuilder: (_, index) {
                      // CasesModel model = list[index];
                      Map model = listTest[index];

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
                                      '${model['type']}',
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
                              Navigator.pushNamed(context, '/cases/cases_edit', arguments: model);
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
                              _addText();
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
                              _addTitle();
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
                              _delField();
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
    );*/
  }

  // Adiciona um campo para texto
  void _addText() {
    Map<String, dynamic> mapTestText = {"type": "title", "content": "content"};

    mapTestText['type'] = 'text';
    listTest.add(mapTestText);
    // controller.editMode = true;
    setState(() {
      listTest;
    });
  }

  // Adiciona um campo para imagem
  void _addImage() {
    Map<String, dynamic> mapTestImage = {"type": "title", "content": "content"};

    mapTestImage['type'] = 'image';
    listTest.add(mapTestImage);
    setState(() {
      listTest;
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
