import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/models/QuizModel.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/navigator_bar/student_cases_relatorio/student_cases_relatorio_controller.dart';

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
  initState() {
    super.initState();
    controller.verifyQuiz(widget.model.id);
    controller.getQuizAnswer(widget.model.id);
    controller.getHits(widget.model.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: appContrastColor,
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Observer(builder: (_) {
          if (controller.access == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else {
            if (controller.access.value) {
              return SingleChildScrollView(
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
                    Container(
                      margin: const EdgeInsets.all(10.0),
                      alignment: Alignment.center,
                      width: 200.0,
                      height: 50.0,
                      decoration: myBoxDecoration(),
                      child: Text(
                        'Você não realizou o Quiz ainda!',
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
                  ],
                ),
              );
            } else {
              if (controller.quizAnswered == null && controller.hits == null) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else {
                List<QuizModel> list = controller.quizAnswered;
                String hits = controller.hits;
                return SingleChildScrollView(
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
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: <Widget>[
                                            Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                children: <Widget>[
                                                  Text('${widget.model.title}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w500,
                                                          fontSize: 15)),
                                                  Text(
                                                      '${widget.model.description}',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w300,
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
                                        text: "${hits}/${list.length}",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.w800))),
                              ))
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(bottom: 20.0),
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
                    ],
                  ),
                );
              }
            }
          }
        }));
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
  }
}
