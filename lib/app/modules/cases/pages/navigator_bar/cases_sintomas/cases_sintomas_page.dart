import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/models/ComponentModel.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_sintomas/cases_sintomas_controller.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import 'package:galinha_karoot/app/shared/widgets/raise_button/RaiseButton.dart';

class CasesSintomasPage extends StatefulWidget {
  final String title;
  final String page;
  final CasesModel model;
  const CasesSintomasPage(
      {Key key, this.title, this.model, this.page})
      : super(key: key);

  @override
  _CasesSintomasPageState createState() => _CasesSintomasPageState();
}

class _CasesSintomasPageState
    extends ModularState<CasesSintomasPage, CasesSintomasController> {
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
      if (editMode == true) {
        return modeEdition(widget.model, screenWidth);
      } else {
        return modeVisualization(screenWidth);
      }
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
                  if (controller.cases == null)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  else {
                    List<ComponentModel> list = controller.cases;
                    return ListView.builder(
                      itemCount: controller.cases.length,
                      itemBuilder: (_, index) {
                        ComponentModel model = list[index];

                        if (model.type.compareTo("Título") == 0) {
                          return Container(
                            height: 50,
                            child: Text(
                              model.value, textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold,)
                            ),
                          );
                        } if (model.type.compareTo("Texto") == 0) {
                          return Container(
                            height: 50,
                            child: Text(
                              model.value, textAlign: TextAlign.justify,
                              style: TextStyle(fontSize: 18),
                            ),
                          );
                        } else if (model.type.compareTo("Imagem") == 0) {
                          return Container(
                            // height: 50,
                            child: Image.network(
                              model.value,
                              fit: BoxFit.contain,
                              height: 300,
                              width: 300,
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
        )
        );
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
                  if (controller.cases == null)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  else {
                    List<ComponentModel> list = controller.cases;
                    return ListView.builder(
                      itemCount: controller.cases.length,
                      itemBuilder: (_, index) {
                        ComponentModel model = list[index];

                        return Container(
                          child: Card(
                            margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 5.0),
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
                        );
                      },
                    );
                  }
                },
              ),
            ),
            Divider(
                height: 10.0,
                indent: 5.0,
                color: Colors.black,
                            ),
                            
            SizedBox(height: 10.0,),
            Text(
              'Adicionar Campos',
              style: TextStyle(fontWeight: FontWeight.bold,  fontSize: 18.0,),
              textAlign: TextAlign.center,
             
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0,),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.05),
                  child: IconButton(icon: Icon(Icons.add_photo_alternate,
                   color: Colors.blueGrey[500],
      size: 50.0,
      semanticLabel: 'Imagem',
                  ),
                  tooltip: 'Imagem',
                   onPressed:() async {
                        ComponentModel model = ComponentModel();
                        model.type = 'Imagem';
                        model.idCases = widget.model.id;
                        model.page = widget.page;
                        model.value = 'https://livecasthd.com.br/sem_foto.png';
                        // model.type = 'image';
                        await controller.create(model);
                        await controller.getDocuments(
                            widget.model.id, widget.page);
                      }),
                  
                  
                  
                  
                  /*circularButton(
                      text: 'Imagem',
                      func: () async {
                        ComponentModel model = ComponentModel();
                        model.type = 'Imagem';
                        model.idCases = widget.model.id;
                        model.page = widget.page;
                        model.value = 'https://livecasthd.com.br/sem_foto.png';
                        // model.type = 'image';
                        await controller.create(model);
                        await controller.getDocuments(
                            widget.model.id, widget.page);
                      }*/),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
                Padding(
                padding: EdgeInsets.only(right: screenWidth * 0.05),
                  child: IconButton(icon: Icon(Icons.note_add,
                   color: Colors.blueGrey[500],
      size: 50.0,
      semanticLabel: 'Texto',),
       tooltip: 'Texto',
       onPressed:  () async {
                        ComponentModel model = ComponentModel();
                        model.type = 'Texto';
                        model.idCases = widget.model.id;
                        model.page = widget.page;
                        model.value = 'Digite o conteúdo para o tópico deste caso.';
                        // model.type = 'text';
                        await controller.create(model);
                        await controller.getDocuments(
                            widget.model.id, widget.page);
                      })),
                Expanded(
                  flex: 1,
                  child: Container(),
                ),
 
                Padding(
                   padding: EdgeInsets.only(right: screenWidth * 0.05),
                  child: IconButton(icon: Icon(Icons.playlist_add,
                   color: Colors.blueGrey[500],
      size: 50.0,
      semanticLabel: 'Título',),
       tooltip: 'Título',
       onPressed:() {}
       )),
                SizedBox(height: 10),
              ],
            ),
           /*Column(
              children: [
                Padding(
                     padding: EdgeInsets.only(top: screenWidth * 0.05),
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
            ),*/
          ],
        ));
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
