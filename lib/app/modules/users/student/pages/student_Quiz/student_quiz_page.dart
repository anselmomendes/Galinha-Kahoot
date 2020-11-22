import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'student_quiz_controller.dart';

class StudentQuizPage extends StatefulWidget {
  final String title;
  const StudentQuizPage({Key key, this.title = "StudentQuiz"})
      : super(key: key);

  @override
  _StudentQuizPageState createState() => _StudentQuizPageState();
}

class _StudentQuizPageState
    extends ModularState<StudentQuizPage, StudentQuizController> {
  //use 'controller' variable to access controller
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QUIZ'),
        backgroundColor: Colors.blue,
        centerTitle: true,
      ),
      backgroundColor: Colors.white,
      body: ListView(
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
                                  /*Título*/ Text(
                                    'Dados e dados de dados',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 22),
                                  ),
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
                      CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.blueAccent[900],
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
                                    '      São os dados que identificam o artigo e o seu autor ou autores. No caso de vários autores São os dados que identificam o artigo e o seu autor ou autores. No caso de vários autores ',
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
                      CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.blueAccent[900],
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
                                    '      São os dados que identificam o artigo e o seu autor ou autores. No caso de vários autores São os dados que identificam o artigo e o seu autor ou autores. No caso de vários autores ',
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
                      CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.blueAccent[900],
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
                                    '      São os dados que identificam o artigo e o seu autor ou autores. No caso de vários autores São os dados que identificam o artigo e o seu autor ou autores. No caso de vários autores ',
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
                      CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.blueAccent[900],
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
                                    '      São os dados que identificam o artigo e o seu autor ou autores. No caso de vários autores São os dados que identificam o artigo e o seu autor ou autores. No caso de vários autores ',
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
                      CircleAvatar(
                          radius: 20.0,
                          backgroundColor: Colors.blueAccent[900],
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
                                    '      São os dados que identificam o artigo e o seu autor ou autores. No caso de vários autores São os dados que identificam o artigo e o seu autor ou autores. No caso de vários autores ',
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
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.help_outline),
      ),
    );
    BoxDecoration myBoxDecoration() {
      return BoxDecoration(
        color: Colors.blueAccent,
        border: Border.all(
          width: 3.0,
          color: Colors.blueAccent,
        ),
        borderRadius: BorderRadius.all(
            Radius.circular(5.0) //         <--- border radius here
            ),
      );
    }
  }
}
