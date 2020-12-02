import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:PeensA/app/modules/cases/models/QuizModel.dart';
import 'package:PeensA/app/modules/common/styles.dart';
import 'package:PeensA/app/shared/widgets/raise_button/RaiseButton.dart';
import 'cases_quiz_edit_controller.dart';

class CasesQuizEditPage extends StatefulWidget {
  final String title;
  final QuizModel model;
  const CasesQuizEditPage({Key key, this.title = "Editar Questões", this.model})
      : super(key: key);

  @override
  _CasesQuizEditPageState createState() => _CasesQuizEditPageState();
}

class _CasesQuizEditPageState
    extends ModularState<CasesQuizEditPage, CasesQuizEditController> {
  //use 'controller' variable to access controller

  // Lista de widget de texto representando o temporizador da questão
  List<Widget> listTime = <Widget>[
    Text('10s'),
    Text('15s'),
    Text('25s'),
    Text('30s'),
    Text('45s'),
    Text('60s'),
  ];

  // Seleção do tempo da questão
  List<bool> isSelectedTimer = List.generate(6, (_) => false);
  // Seleção da alternativa certa 'type1'
  List<bool> isSelectedRight1 = List.generate(5, (_) => false);
  // Seleção da alternativa certa 'type2'
  List<bool> isSelectedRight2 = List.generate(2, (_) => false);

  // Iniciado as variáveis com o valor do db
  @override
  void initState() {
    // TODO: implement initState
    valueInitialTime();
    valueInitialRight1();
    valueInitialRight2();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        elevation: 0.1,
        backgroundColor: appContrastColor,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: Padding(
        // padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
        padding: EdgeInsets.fromLTRB(30, 5, 30, 30),
        child: ListView(
          children: <Widget>[
            Container(
                height: screenWidth * 1.5,
                child: SingleChildScrollView(
                  child: _selectField(),
                )),
            // SizedBox(height: 20),
            // Botão para salvar os dados no banco
            circularButton(
                text: 'Salvar',
                func: () async {
                  // widget.model.value = _initalValue.text.toString();
                  if (await controller.update(widget.model)) {
                    _showAlertDialog(context, 'Questão Registrada',
                        'A questão foi registrada com sucesso!');
                  } else
                    _showAlertDialog(context, 'Questão não Registrada',
                        'A questão não foi registrada!');
                })
          ],
        ),
      ),
    );
  }

  Widget _selectField() {
    if (widget.model.type.compareTo("type1") == 0) {
      return _questionType1();
    } else if (widget.model.type.compareTo("type2") == 0) {
      return _questionType2();
    } else
      return null;
  }

  // Questão do tipo Múltipla Escolha
  Widget _questionType1() {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          width: 200.0,
          height: 50.0,
          decoration: myBoxDecoration(),
          child: Text(
            'Número da questão',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          // controller: _initalValue,
          maxLength: 2,
          maxLines: 1,
          initialValue: widget.model.questionNumber,
          onChanged: (v) => widget.model.questionNumber = v,
          decoration: InputDecoration(
            icon: CircleAvatar(
                radius: 18.0,
                backgroundColor: Colors.blueAccent,
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    '#',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            labelText: 'Digite o número da questão',
            fillColor: Colors.redAccent,
            focusColor: Colors.redAccent,
            hoverColor: Colors.redAccent,
            // hintText: 'Digite o título',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
          ),
        ),
        Divider(
          height: 10,
          thickness: 1.0,
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          width: 200.0,
          height: 50.0,
          decoration: myBoxDecoration(),
          child: Text(
            'Comando da questão',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          // controller: _initalValue,
          maxLength: 800,
          maxLines: 3,
          initialValue: widget.model.question,
          onChanged: (v) => widget.model.question = v,
          decoration: InputDecoration(
            labelText: 'Digite a questão',
            fillColor: Colors.redAccent,
            focusColor: Colors.redAccent,
            hoverColor: Colors.redAccent,
            // hintText: 'Digite o título',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
          ),
        ),
        Divider(
          height: 10,
          thickness: 1.0,
        ),
        SizedBox(height: 10),

        /*   CircleAvatar(
                            backgroundColor: Colors.blueAccent,
                            radius: 20.0,
                            child: Text(
                            "!",
                              style: TextStyle(
                                fontSize: 22.0,
                                color: Colors.white,
                              ),
                            ),
                          ),       
                            */

        SizedBox(height: 20),
        TextFormField(
          // controller: _initalValue,
          maxLength: 80,
          maxLines: 2,
          initialValue: widget.model.answers1,
          onChanged: (v) => widget.model.answers1 = v,
          decoration: InputDecoration(
            icon: CircleAvatar(
                radius: 18.0,
                backgroundColor: Colors.blueAccent,
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
            labelText: 'Digite a alternativa',
            // hintText: 'Digite o título',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        /*Text(
          'Alternativa (b)',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),*/
        SizedBox(height: 5),
        TextFormField(
          // controller: _initalValue,
          maxLength: 80,
          maxLines: 2,
          initialValue: widget.model.answers2,
          onChanged: (v) => widget.model.answers2 = v,
          decoration: InputDecoration(
            icon: CircleAvatar(
                radius: 18.0,
                backgroundColor: Colors.blueAccent,
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
            labelText: 'Digite a alternativa',
            // hintText: 'Digite o título',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        /* Text(
          'Alternativa (c)',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        */
        SizedBox(height: 5),
        TextFormField(
          // controller: _initalValue,
          maxLength: 80,
          maxLines: 2,
          initialValue: widget.model.answers3,
          onChanged: (v) => widget.model.answers3 = v,
          decoration: InputDecoration(
            icon: CircleAvatar(
                radius: 18.0,
                backgroundColor: Colors.blueAccent,
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
            labelText: 'Digite a alternativa',
            // hintText: 'Digite o título',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        /*Text(
          'Alternativa (d)',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),*/
        SizedBox(height: 5),
        TextFormField(
          // controller: _initalValue,
          maxLength: 80,
          maxLines: 2,
          initialValue: widget.model.answers4,
          onChanged: (v) => widget.model.answers4 = v,
          decoration: InputDecoration(
            icon: CircleAvatar(
                radius: 18.0,
                backgroundColor: Colors.blueAccent,
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
            labelText: 'Digite a alternativa',
            // hintText: 'Digite o título',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        /*Text(
          'Alternativa (e)',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),*/
        SizedBox(height: 5),
        TextFormField(
          // controller: _initalValue,
          maxLength: 80,
          maxLines: 2,
          initialValue: widget.model.answers5,
          onChanged: (v) => widget.model.answers5 = v,
          decoration: InputDecoration(
            icon: CircleAvatar(
                radius: 18.0,
                backgroundColor: Colors.blueAccent,
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
            labelText: 'Digite a alternativa',
            // hintText: 'Digite o título',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Divider(
          height: 10,
          thickness: 1.0,
        ),
        SizedBox(height: 10),
        /*Text(
          'Selecione a alternativa correta',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ), */
        SizedBox(height: 5),
        Text(
          'Selecione a alternativa correta',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 10),
        ToggleButtons(
            textStyle: TextStyle(fontSize: 14.0),
            children: <Widget>[
              Text('(a)'), // 0
              Text('(b)'), // 1
              Text('(c)'), // 2
              Text('(d)'), // 3
              Text('(e)'), // 4
            ],
            onPressed: (int index) {
              setState(() {
                for (int buttonIndex = 0;
                    buttonIndex < isSelectedRight1.length;
                    buttonIndex++) {
                  if (buttonIndex == index) {
                    isSelectedRight1[buttonIndex] = true;
                    // Salva no model a resposta correta
                    saveSelectedRight1(buttonIndex);
                  } else {
                    isSelectedRight1[buttonIndex] = false;
                  }
                }
              });
            },
            isSelected: isSelectedRight1),
        SizedBox(height: 20),
       Text(
          'Selecione o tempo da questão',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ), 
      

//Temporizador 

         ToggleButtons(
            textStyle: TextStyle(fontSize: 14.0),
            children: listTime,
            onPressed: (int index) {
              setState(() {
                for (int buttonIndex = 0;
                    buttonIndex < isSelectedTimer.length;
                    buttonIndex++) {
                  if (buttonIndex == index) {
                    isSelectedTimer[buttonIndex] = true;
                    // Salva o valor selecionado do temporizador
                    saveSelectedTimer(buttonIndex);
                  } else {
                    isSelectedTimer[buttonIndex] = false;
                  }
                }
              });
            },
            isSelected: isSelectedTimer),
        SizedBox(height: 20),
        Divider(
          height: 10,
          thickness: 1.0,
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          width: 220.0,
          height: 50.0,
          decoration: myBoxDecoration(),
          child: Text(
            'Comentário da questão',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          // controller: _initalValue,
          maxLength: 800,
          maxLines: 3,
          initialValue: widget.model.commentary,
          onChanged: (v) => widget.model.commentary = v,
          decoration: InputDecoration(
            labelText: 'Digite o comentário',
            // hintText: 'Digite o título',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
      ],
    );
  }

  // Questão do tipo Verdadeiro ou Falso
  Widget _questionType2() {
    return Column(
      children: <Widget>[
        SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          width: 200.0,
          height: 50.0,
          decoration: myBoxDecoration(),
          child: Text(
            'Número da questão',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          // controller: _initalValue,
          maxLength: 2,
          maxLines: 1,
          initialValue: widget.model.questionNumber,
          onChanged: (v) => widget.model.questionNumber = v,
          decoration: InputDecoration(
            icon: CircleAvatar(
                radius: 18.0,
                backgroundColor: Colors.blueAccent,
                child: Padding(
                  padding: EdgeInsets.all(2),
                  child: Text(
                    '#',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 23.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                )),
            labelText: 'Digite o número da questão',
            fillColor: Colors.redAccent,
            focusColor: Colors.redAccent,
            hoverColor: Colors.redAccent,
            // hintText: 'Digite o título',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
          ),
        ),
        Divider(
          height: 10,
          thickness: 1.0,
        ),
        Container(
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          width: 200.0,
          height: 50.0,
          decoration: myBoxDecoration(),
          child: Text(
            'Comando da questão',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          // controller: _initalValue,
          maxLength: 800,
          maxLines: 3,
          //initialValue: widget.model.topicTree,
          initialValue: widget.model.question,
          onChanged: (v) => widget.model.question = v,
          decoration: InputDecoration(
            labelText: 'Digite a alternativa',
            // hintText: 'Descreva o caso',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
          ),
        ),
        SizedBox(height: 10),
        Divider(
          height: 10,
          thickness: 1.0,
        ),
        SizedBox(height: 10),
        Text(
          'Selecione a resposta (V ou F)',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),
        SizedBox(height: 5),
        ToggleButtons(
            textStyle: TextStyle(fontSize: 14.0),
            children: <Widget>[
              Icon(Icons.check), // true
              Icon(Icons.close) // false
            ],
            onPressed: (int index) {
              setState(() {
                for (int buttonIndex = 0;
                    buttonIndex < isSelectedRight2.length;
                    buttonIndex++) {
                  if (buttonIndex == index) {
                    isSelectedRight2[buttonIndex] = true;
                    // Salva no model a resposta correta
                    saveSelectedRight2(buttonIndex);
                  } else {
                    isSelectedRight2[buttonIndex] = false;
                  }
                }
              });
            },
            isSelected: isSelectedRight2),
        SizedBox(height: 20),
         Text(
          'Selecione o tempo da questão',
          style: TextStyle(fontSize: 18),
          textAlign: TextAlign.center,
        ),

        //Temporizador 

  
         ToggleButtons(
            textStyle: TextStyle(fontSize: 14.0),
            children: listTime,
            onPressed: (int index) {
              setState(() {
                for (int buttonIndex = 0;
                    buttonIndex < isSelectedTimer.length;
                    buttonIndex++) {
                  if (buttonIndex == index) {
                    isSelectedTimer[buttonIndex] = true;
                    // Salva o valor selecionado do temporizador
                    saveSelectedTimer(buttonIndex);
                  } else {
                    isSelectedTimer[buttonIndex] = false;
                  }
                }
              });
            },
            isSelected: isSelectedTimer), 
        SizedBox(height: 20),
        Divider(
          height: 10,
          thickness: 1.0,
        ),
        SizedBox(height: 10),
        Container(
          margin: const EdgeInsets.all(10.0),
          alignment: Alignment.center,
          width: 200.0,
          height: 50.0,
          decoration: myBoxDecoration(),
          child: Text(
            'Comentário da questão',
            style: TextStyle(
              fontSize: 18,
              color: Colors.white,
            ),
            textAlign: TextAlign.center,
          ),
        ),
        SizedBox(height: 10),
        TextFormField(
          // controller: _initalValue,
          maxLength: 800,
          maxLines: 3,
          initialValue: widget.model.commentary,
          onChanged: (v) => widget.model.commentary = v,
          decoration: InputDecoration(
            labelText: 'Digite o comentário',
            // hintText: 'Digite o título',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 1.0,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15.0),
              borderSide: BorderSide(
                color: Colors.black,
                width: 2.0,
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
      ],
    );
  }

  void _showAlertDialog(BuildContext context, String titulo, String mensagem) {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        Modular.to.pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text(titulo),
      content: Text(mensagem),
      actions: [
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

  // Salva no model o valor da questão correta que foi selecionada
  void saveSelectedRight1(int buttonIndex) {
    if (buttonIndex == 0) {
      widget.model.right = 'a';
    } else if (buttonIndex == 1) {
      widget.model.right = 'b';
    } else if (buttonIndex == 2) {
      widget.model.right = 'c';
    } else if (buttonIndex == 3) {
      widget.model.right = 'd';
    } else if (buttonIndex == 4) {
      widget.model.right = 'e';
    }
  }

  // Salva no model o valor da questão correta que foi selecionada
  void saveSelectedRight2(int buttonIndex) {
    if (buttonIndex == 0) {
      widget.model.right = 'true';
    } else if (buttonIndex == 1) {
      widget.model.right = 'false';
    }
  }

  // Salva no model o valor do temporizador da questão selecionada
  void saveSelectedTimer(int buttonIndex) {
    if (buttonIndex == 0) {
      widget.model.time = 10;
    } else if (buttonIndex == 1) {
      widget.model.time = 15;
    } else if (buttonIndex == 2) {
      widget.model.time = 25;
    } else if (buttonIndex == 3) {
      widget.model.time = 30;
    } else if (buttonIndex == 4) {
      widget.model.time = 45;
    } else if (buttonIndex == 5) {
      widget.model.time = 60;
    }
  }

  // Verificando o valor time no db
  void valueInitialTime() {
    if (widget.model.time == 10) {
      isSelectedTimer[0] = true;
    } else if (widget.model.time == 15) {
      isSelectedTimer[1] = true;
    } else if (widget.model.time == 25) {
      isSelectedTimer[2] = true;
    } else if (widget.model.time == 30) {
      isSelectedTimer[3] = true;
    } else if (widget.model.time == 45) {
      isSelectedTimer[4] = true;
    } else if (widget.model.time == 60) {
      isSelectedTimer[5] = true;
    }
  }

  // Verificando o valor da alternativa correta no db p/ questão de Múltipla Escolha
  void valueInitialRight1() {
    if (widget.model.right == 'a') {
      isSelectedRight1[0] = true;
    } else if (widget.model.right == 'b') {
      isSelectedRight1[1] = true;
    } else if (widget.model.right == 'c') {
      isSelectedRight1[2] = true;
    } else if (widget.model.right == 'd') {
      isSelectedRight1[3] = true;
    } else if (widget.model.right == 'e') {
      isSelectedRight1[4] = true;
    }
  }

  // Verificando o valor da alternativa correta no db p/ questão Verdadeiro ou Falso
  void valueInitialRight2() {
    if (widget.model.right.compareTo('true') == 0) {
      isSelectedRight2[0] = true;
    } else if (widget.model.right.compareTo('false') == 0) {
      isSelectedRight2[1] = true;
    }
  }

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
