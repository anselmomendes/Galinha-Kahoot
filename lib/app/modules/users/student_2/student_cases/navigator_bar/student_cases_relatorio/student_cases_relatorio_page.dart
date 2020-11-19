import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_relatorio/cases_relatorio_controller.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/navigator_bar/student_cases_relatorio/student_cases_relatorio_controller.dart';
import 'package:galinha_karoot/app/shared/widgets/raise_button/RaiseButton.dart';

class StudentCasesRelatorioPage extends StatefulWidget {
  final String title;
  final CasesModel model;
  const StudentCasesRelatorioPage(
      {Key key, this.title = "Relatório", this.model, String page})
      : super(key: key);

  @override
  _StudentCasesRelatorioPageState createState() =>
      _StudentCasesRelatorioPageState();
}

class _StudentCasesRelatorioPageState extends ModularState<
    StudentCasesRelatorioPage, StudentCasesRelatorioController> {
  final _topicSix = TextEditingController();
  final _textSix = TextEditingController();
  final _imageUrlSix = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      /* if (controller.editMode) {
        return modoEdicao(widget.model);
      } else */
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
      /* floatingActionButton: FloatingActionButton(
          backgroundColor: appContrastColor,
          child: Icon(Icons.edit),
          onPressed: () {
            controller.editMode = true;
          }), */
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 20, 20, 20),
        child: Column(
          children: <Widget>[
             Container(
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          width: 200.0,
          height: 50.0,
          decoration: myBoxDecoration(),
          child: Text(
            'Meu desempenho',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
            Padding(
              padding: EdgeInsets.only(bottom: 20.0),
            ),
            Row(
              children: [
                Card(
                     elevation: 5,
                    shape: BeveledRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: InkWell(
                        child: Padding(
                            padding: EdgeInsets.all(20),
                            child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceEvenly,
                                      children: <Widget>[
                                        Text('Questionário sobre condicionais',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w500,
                                                fontSize: 15)),
                                        Text(
                                            'Algoritmos condicionais em linguagem C.',
                                            style: TextStyle(
                                                fontWeight: FontWeight.w300,
                                                fontSize: 12))
                                      ]),
                                ])),
                        onTap: () {
                          print("Tocado 2");
                        })),
                         Padding(
              padding: EdgeInsets.only(right: 10.0),
            ),
                Container(
                    decoration: BoxDecoration(
                        color: Colors.green,
                        borderRadius: BorderRadius.circular(50)),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: RichText(
                          text: TextSpan(
                              text: "10/10",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.w800))),
                    ))
              ],
            ),
             Padding(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            Divider(
            color: Colors.blueGrey[500],
            height: 5,
            thickness: 1,
            indent: 5,
            endIndent: 2,
          ),
           Padding(
              padding: EdgeInsets.only(bottom: 10.0),
            ),
            /* Container(
              child: Image.network(
                widget.model.imageUrlSix, //widget.casesModel.imageUrlTwo,
                height: 300,
                width: 300,
              ),
            ),
            SizedBox(height: 10),
            Container(
              height: 50,
              child: Text(
                widget.model.topicSix, //widget.casesModel.textTwo,
                style: TextStyle(fontSize: 18),
              ),
            ),
            Container(
              height: 300,
              child: Text(
                widget.model.textSix, //widget.casesModel.textTwo,
                style: TextStyle(fontSize: 18),
              ),
            ), */
          ],
        ),
      ),
    );
    
  }
   BoxDecoration myBoxDecoration() {
    return BoxDecoration(
      color: Colors.blue,
      border: Border.all(
        width: 3.0,
        color: Colors.blue,
      ),
      borderRadius: BorderRadius.all(
          Radius.circular(5.0) //         <--- border radius here
          ),
    );
/* 
  Scaffold modoEdicao(CasesModel model) {

    // Iniciado os campos com os texto do db
    _topicSix.text = widget.model.topicSix;
    _textSix.text = widget.model.textSix;
    _imageUrlSix.text = widget.model.imageUrlSix;

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
              controller: _topicSix,
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
              controller: _textSix,
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
              controller: _imageUrlSix,
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
                  widget.model.topicSix = _topicSix.text;
                  widget.model.textSix = _textSix.text;
                  widget.model.imageUrlSix = _imageUrlSix.text;
                  if (widget.model.imageUrlSix == '')
                    widget.model.imageUrlSix =
                        'https://livecasthd.com.br/sem_foto.png';
                  controller.save(widget.model);
                  controller.editMode = false;
                }),
          ],
        ),
      ),
    );
  }
 */
 }
}
