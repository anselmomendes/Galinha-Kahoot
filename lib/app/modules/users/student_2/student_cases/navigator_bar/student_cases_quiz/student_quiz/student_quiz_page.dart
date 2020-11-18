import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/QuizModel.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/navigator_bar/student_cases_quiz/student_quiz/result_dialog.dart';
import 'student_quiz_controller.dart';

class StudentQuizPage extends StatefulWidget {
  final String title;
  final List<QuizModel> list;
  const StudentQuizPage({
    Key key,
    this.title = "Peensa Quiz",
    @required this.list,
  }) : super(key: key);

  @override
  _StudentQuizPageState createState() => _StudentQuizPageState();
}

class _StudentQuizPageState
    extends ModularState<StudentQuizPage, StudentQuizController> {
  //use 'controller' variable to access controller
  List<Widget> _scoreKeeper = [];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.getQuiz(widget.list);
   
  }

  @override
  Widget build(BuildContext context) {
    if (controller.getType() == 'type1') {
      return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          body: multChoise());
    }
    if (controller.getType() == 'type2') {
      return Scaffold(
          appBar: AppBar(
            title: Text(widget.title),
             centerTitle: true,
             backgroundColor: Colors.purple,
          ),
          body: trueOrFalse());
    }
  }

  Widget multChoise() {
    String answer;
    return ListView(
      children: [
        //área da pergunta

        Container(
         decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/imagem2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 10.0),
                alignment: Alignment.center,
                width: 200.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.blue[900],
                  border: Border.all(
                    width: 3.0,
                    color: Colors.blue[900],
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(5.0) //         <--- border radius here
                      ),
                ),
                child: Text(
                  'Questão ${controller.questionIndex + 1} / ${controller.questionsNumber}',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Card(
                        margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(20.0),
                          alignment: Alignment.center,
                          width: 300.0,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                                width: 3.0, color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(
                                    10.0) //         <--- border radius here
                                ),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                ),
                                /*Texto*/
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      10.0, 0.0, 10.0, 10.0),
                                  child: Text(
                                    '${controller.getQuestion()}',
                                    style: TextStyle(fontSize: 20),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),

// área das questões
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage("assets/imagem4.jpg"),
                fit: BoxFit.cover,
              ),
              /*borderRadius: BorderRadius.only(
					topLeft: Radius.circular(30),
					topRight: Radius.circular(30),
				),*/
            ),
            margin: EdgeInsets.fromLTRB(1.0, 0.0, 1.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
// Questão A
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                    child: CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.blue,
                        child: Padding(
                          padding: EdgeInsets.all(2),
                          child: Text(
                            'A',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                        onTap: null ,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                    ),
                    Card(
                      margin: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                      elevation: 5,
                      color: Colors.white,
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        alignment: Alignment.center,
                        width: 300.0,
                        height: 110.0,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            width: 3.0,
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  10.0) //         <--- border radius here
                              ),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
                                child: Text(
                                  '${controller.getanswers1()}',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

//Questão B
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                    child: CircleAvatar(
                        radius: 20.0,
                        backgroundColor:  Colors.blue,
                        child: Padding(
                          padding: EdgeInsets.all(2),
                          child: Text(
                            'B',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                        onTap: null,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                    ),
                    Card(
                      margin: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
                      elevation: 5,
                      color: Colors.white,
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        alignment: Alignment.center,
                        width: 300.0,
                        height: 110.0,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            width: 3.0,
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  10.0) //         <--- border radius here
                              ),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
                                child: Text(
                                  '${controller.getanswers2()}',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

//Questão C
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                    child: CircleAvatar(
                        radius: 20.0,
                        backgroundColor:  Colors.blue,
                        child: Padding(
                          padding: EdgeInsets.all(2),
                          child: Text(
                            'C',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                        onTap: null,
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                    ),
                    Card(
                      margin: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
                      elevation: 5,
                      color: Colors.white,
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        alignment: Alignment.center,
                        width: 300.0,
                        height: 110.0,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            width: 3.0,
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  10.0) //         <--- border radius here
                              ),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
                                child: Text(
                                  '${controller.getanswers3()} ',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

//Questão D
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   InkWell(
                    child:  CircleAvatar(
                        radius: 20.0,
                        backgroundColor: Colors.blue,
                        child: Padding(
                          padding: EdgeInsets.all(2),
                          child: Text(
                            'D',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                        onTap: null,
                        ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                    ),
                    Card(
                      margin: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
                      elevation: 5,
                      color: Colors.white,
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        alignment: Alignment.center,
                        width: 300.0,
                        height: 110.0,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            width: 3.0,
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  10.0) //         <--- border radius here
                              ),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
                                child: Text(
                                  '${controller.getanswers4()} ',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),

//Questão E
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                   InkWell(
                    child:  CircleAvatar(
                        radius: 20.0,
                        backgroundColor:  Colors.blue,
                        child: Padding(
                          padding: EdgeInsets.all(2),
                          child: Text(
                            'E',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 23.0,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        )),
                        onTap: null,
                   ),
                    Padding(
                      padding: EdgeInsets.only(right: 15.0),
                    ),
                    Card(
                      margin: EdgeInsets.fromLTRB(0.0, 25.0, 0.0, 0.0),
                      elevation: 5,
                      color: Colors.white,
                      child: Container(
                        margin: const EdgeInsets.all(5.0),
                        alignment: Alignment.center,
                        width: 300.0,
                        height: 110.0,
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          border: Border.all(
                            width: 3.0,
                            color: Colors.transparent,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(
                                  10.0) //         <--- border radius here
                              ),
                        ),
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: <Widget>[
                              Padding(
                                padding:
                                    EdgeInsets.fromLTRB(5.0, 5.0, 0.0, 5.0),
                                child: Text(
                                  '${controller.getanswers5()}',
                                  style: TextStyle(fontSize: 16),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 45.0),
                ),
                nextQuestionButton(answer)
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget trueOrFalse() {
    return ListView(
      children: [
        //área da pergunta

        Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/imagem2.1.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Container(
                margin: const EdgeInsets.fromLTRB(50.0, 15.0, 50.0, 15.0),
                alignment: Alignment.center,
                width: 200.0,
                height: 50.0,
                decoration: BoxDecoration(
                  color: Colors.deepPurple[600],
                  border: Border.all(
                    width: 3.0,
                    color: Colors.deepPurple[600],
                  ),
                  borderRadius: BorderRadius.all(
                      Radius.circular(5.0) //         <--- border radius here
                      ),
                ),
                child: Text(
                  'Questão 1 / 10',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 23.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    children: <Widget>[
                      Card(
                        margin: EdgeInsets.fromLTRB(15.0, 15.0, 15.0, 15.0),
                        elevation: 5,
                        child: Container(
                          margin: const EdgeInsets.all(20.0),
                          alignment: Alignment.center,
                          width: 350.0,
                          height: 200.0,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                                width: 3.0, color: Colors.transparent),
                            borderRadius: BorderRadius.all(Radius.circular(
                                    10.0) //         <--- border radius here
                                ),
                          ),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Padding(
                                  padding: EdgeInsets.only(top: 10.0),
                                ),
                                /*Texto*/
                                Padding(
                                  padding: EdgeInsets.fromLTRB(
                                      10.0, 0.0, 10.0, 10.0),
                                  child: Text(
                                    '     São os dados que identificam o artigo e o seu autor ou autores. No caso de vários autores é necessário separar os nomes com vírgula. Além de dados em português, também é comum a inclusão do resumo e palavras-chave em outro idioma, geralmente o inglês. Veja quais são os elementos pré-textuais do artigo:São os dados que identificam o artigo e o seu autor ou autores. No caso de vários autores é necessário separar os São os dados que identificam o artigo e o seu autor ou autores. No caso de vários autores é necessário separar os nomes com vírgula. Além de dados em português, também é comum a inclusão do resumo e palavras-chave em outro idioma, geralmente o inglês. Veja quais são os elementos pré-textuais do artigo:São os dados que identificam o artigo e o seu autor ou autores. No caso de vários autores é necessário separar os',
                                    style: TextStyle(fontSize: 16),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
// área das questões
        Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.transparent,
              image: DecorationImage(
                image: AssetImage("assets/imagem2.2.jpg"),
                fit: BoxFit.cover,
              ),
              /*borderRadius: BorderRadius.only(
					topLeft: Radius.circular(30),
					topRight: Radius.circular(30),
				),*/
            ),
            margin: EdgeInsets.fromLTRB(1.0, 0.0, 1.0, 0.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 30.0),
                ),
                Row(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 85.0),
                    ),
                    ClipOval(
                      child: Material(
                        color: Colors.green, // button color
                        child: InkWell(
                          splashColor: Colors.greenAccent, // inkwell color
                          child: SizedBox(
                              width: 60,
                              height: 60,
                              child: Icon(
                                Icons.done,
                                color: Colors.white,
                              )),
                          onTap: () {},
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 100.0),
                    ),
                    ClipOval(
                      child: Material(
                        color: Colors.red, // button color
                        child: InkWell(
                          splashColor: Colors.redAccent, // inkwell color
                          child: SizedBox(
                              width: 56,
                              height: 56,
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                              )),
                          onTap: () {},
                        ),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 150.0),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget nextQuestionButton(String answer) {
    return RaisedButton(
       color: Colors.transparent,
       padding: const EdgeInsets.fromLTRB(40.0, 20.0, 40.0, 20.0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.transparent)),
                              child:  Text("Responder",
                              style: TextStyle(color: Colors.white),
                              ),
        onPressed: () {
          bool correct = controller.correctAnswer(answer);
          ResultDialog.show(
            context,
            question: controller.question,
            correct: correct,
            onNext: () {
              setState(() {
                _scoreKeeper.add(
                  Icon(
                    correct ? Icons.check : Icons.close,
                    color: correct ? Colors.green : Colors.red,
                  ),
                );

                if (_scoreKeeper.length < controller.questionsNumber) {
                  controller.nextQuestion();
                }
              });
            },
          );
        });
  }
}
