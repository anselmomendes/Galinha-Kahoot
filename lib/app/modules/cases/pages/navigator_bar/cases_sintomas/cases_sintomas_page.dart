import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:PeensA/app/modules/cases/models/CasesModels.dart';
import 'package:PeensA/app/modules/cases/models/ComponentModel.dart';
import 'package:PeensA/app/modules/cases/pages/navigator_bar/cases_sintomas/cases_sintomas_controller.dart';
import 'package:PeensA/app/modules/common/styles.dart';
import 'package:PeensA/app/shared/widgets/raise_button/RaiseButton.dart';

class CasesSintomasPage extends StatefulWidget {
  final String title;
  final String page;
  final CasesModel model;
  const CasesSintomasPage({Key key, this.title, this.model, this.page})
      : super(key: key);

  @override
  _CasesSintomasPageState createState() => _CasesSintomasPageState();
}

class _CasesSintomasPageState
    extends ModularState<CasesSintomasPage, CasesSintomasController> {
  bool editMode;

  // Variável p/ pegar o valor da posição do último campo
  int lastPosition;

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
                              margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
                              child: Text(model.value,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                            );
                          }
                          if (model.type.compareTo("Texto") == 0) {
                            return Container(
                              margin: EdgeInsets.fromLTRB(0, 15, 0, 10),

                              // height: 50,
                              child: Text(
                                model.value,
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 18),
                              ),
                            );
                          } else if (model.type.compareTo("Imagem") == 0) {
                            return Container(
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),

                              // height: 50,
                              child: Image.network(
                                model.value,
                                fit: BoxFit.contain,
                                // height: 400,
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
              height: screenWidth * 1.10,
              child: Observer(
                name: 'componentes',
                builder: (_) {
                  if (controller.cases == null)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  else {
                    List<ComponentModel> list = controller.cases;

                    if (list.length != 0) {
                      // Valor (position) do último campo
                      lastPosition = list.last.position + 1;
                    } else {
                      lastPosition = 1;
                    }

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
                                    title: _selectField(model, index)
                                    /* Center(
                                      child: Text(
                                        model.type,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ) */
                                    ,
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.pushNamed(
                                        context, '/cases/cases_edit',
                                        arguments: model)
                                    .then((value) async =>
                                        await controller.getDocuments(
                                            model.idCases, model.page));
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
            Padding(padding: EdgeInsets.only(bottom: 8)),
            
            Padding(
              padding: EdgeInsets.only(
                bottom: 8.0,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  
                  children: [
                    
                    Padding(padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Imagem',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0,
                      ),
                    ),
                  ),
                    IconButton(
                        icon: Icon(
                          Icons.add_photo_alternate,
                          color: Colors.blueGrey[500],
                          size: 50.0,
                          semanticLabel: 'Imagem',
                        ),
                        tooltip: 'Imagem',
                        onPressed: () async {
                          ComponentModel model = ComponentModel();
                          model.type = 'Imagem';
                          model.idCases = widget.model.id;
                          model.page = widget.page;
                          model.value =
                              'https://livecasthd.com.br/sem_foto.png';
                          // model.type = 'image';
                          model.position = lastPosition;

                          await controller.create(model);
                          await controller.getDocuments(
                              widget.model.id, widget.page);
                        }),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 30.0,
                      ),
                    ),
                    Padding(padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Texto',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0,
                      ),
                    ),
                  ),
                    IconButton(
                        icon: Icon(
                          Icons.description,
                          color: Colors.blueGrey[500],
                          size: 50.0,
                          semanticLabel: 'Texto',
                        ),
                        tooltip: 'Texto',
                        onPressed: () async {
                          ComponentModel model = ComponentModel();
                          model.type = 'Texto';
                          model.idCases = widget.model.id;
                          model.page = widget.page;
                          model.value =
                              'Digite o conteúdo para o tópico deste caso.';
                          // model.type = 'text';
                          model.position = lastPosition;

                          await controller.create(model);
                          await controller.getDocuments(
                              widget.model.id, widget.page);
                        })
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(
                    right: 50.0,
                  ),
                ), 
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                
                  children: [
                   
                     Padding(padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'PDF',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0,
                      ),
                    ),
                  ),
                    IconButton(
                        icon: Icon(
                          Icons.picture_as_pdf,
                          color: Colors.blueGrey[500],
                          size: 50.0,
                          semanticLabel: 'PDF',
                        ),
                        tooltip: 'PDF',
                        onPressed: () async {
                          ComponentModel model = ComponentModel();
                          model.type = 'PDF';
                          model.idCases = widget.model.id;
                          model.page = widget.page;
                          model.value = 'Selecione um PDF para o conteúdo';
                          // model.type = 'topic';
                          model.position = lastPosition;
                          print(lastPosition);

                          await controller.create(model);
                          await controller.getDocuments(
                              widget.model.id, widget.page);
                        }),
                  ],
                ),
                 Padding(
                  padding: EdgeInsets.only(
                    right: 50.0,
                  ),
                ), 
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                
                  children: [
                  Padding(padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Título',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0,
                      ),
                    ),
                  ),
                    IconButton(
                        icon: Icon(
                          Icons.title,
                          color: Colors.blueGrey[500],
                          size: 50.0,
                          semanticLabel: 'Título',
                        ),
                        tooltip: 'Título',
                        onPressed: () async {
                          ComponentModel model = ComponentModel();
                          model.type = 'Título';
                          model.idCases = widget.model.id;
                          model.page = widget.page;
                          model.value = 'Digite um título para o conteúdo';
                          // model.type = 'topic';
                          model.position = lastPosition;
                          print(lastPosition);

                          await controller.create(model);
                          await controller.getDocuments(
                              widget.model.id, widget.page);
                        }),
                    Padding(
                      padding: EdgeInsets.only(
                        bottom: 30.0,
                      ),
                    ),
                     Padding(padding: EdgeInsets.only(left: 20),
                    child: Text(
                      'Link',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13.0,
                      ),
                    ),
                  ),
                    IconButton(
                        icon: Icon(
                          Icons.link,
                          color: Colors.blueGrey[500],
                          size: 50.0,
                          semanticLabel: 'Link',
                        ),
                        tooltip: 'Link',
                        onPressed: () async {
                          ComponentModel model = ComponentModel();
                          model.type = 'Link';
                          model.idCases = widget.model.id;
                          model.page = widget.page;
                          model.value = 'Digite um link para o conteúdo';
                          // model.type = 'topic';
                          model.position = lastPosition;
                          print(lastPosition);

                          await controller.create(model);
                          await controller.getDocuments(
                              widget.model.id, widget.page);
                        }),
                  ],
                ),
              ],
            ),
          ],
        ));
  }

  // Exibir os campos do caso
  Widget _selectField(ComponentModel model, int index) {
    return Row(
      children: <Widget>[
        /* Expanded(
          flex: 2,
          child: Container(),
        ), */
        Text(
          'Posição ${model.position} | ${model.type}',
          // "Campo | ${model.type}",
          // textAlign: TextAlign.end,
          style: TextStyle(
            fontWeight: FontWeight.w500,
            fontSize: 18,
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(),
        ),
        SizedBox(
          width: 35,
          // height: 40,
          child: FlatButton(
              padding: EdgeInsets.all(1),
              onPressed: () async {
                _showAlertDialogDelete(model);
              },
              child: Icon(
                Icons.delete,
                color: Colors.redAccent,
              )),
        ),
      ],
    );
  }

  // Aviso de confirmação para deletar campo
  void _showAlertDialogDelete(ComponentModel model) {
    // model ??= CasesModel();

    Widget cancelButton = FlatButton(
      child: Text("Cancelar"),
      onPressed: () {
        Modular.to.pop();
      },
    );
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () async {
        // await controller.delete(model);
        await controller.delete(widget.model.id, widget.page, model.id);
        await controller.getDocuments(widget.model.id, widget.page);
        Modular.to.pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Aviso"),
      content: Text("Deseja excluir esse campo?"),
      actions: [
        cancelButton,
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
