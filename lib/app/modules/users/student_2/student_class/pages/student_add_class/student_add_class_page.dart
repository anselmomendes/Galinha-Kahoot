import 'package:flutter/material.dart';
import 'package:PeensA/app/modules/users/student_2/repositories/student_2_repository.dart';
import 'package:PeensA/app/modules/users/student_2/student_class/pages/student_add_class/student_add_class_controller.dart';

class StudentAddClassPage extends StatefulWidget {
  final String title;
  const StudentAddClassPage({Key key, this.title = ""}) : super(key: key);

  @override
  _StudentAddClassPageState createState() => _StudentAddClassPageState();
}

class _StudentAddClassPageState extends State<StudentAddClassPage> {
  var controller = StudentAddClassController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    controller.repo.outState.listen((state) {
      switch (state) {
        case RegisterClassState.SUCESS:
          alerta('Turma foi cadastrada');
          break;
        case RegisterClassState.FAIL:
          alerta(
              'Ocorreu um erro, verifique se você já esta cadastrado a turma');
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            child: Center(
                child: ListView(
                    padding:
                        EdgeInsets.all(MediaQuery.of(context).size.width * 0.2),
                    children: <Widget>[
                  Column(children: <Widget>[
                    Image.asset("assets/bits.png",
                        width: MediaQuery.of(context).size.width * 0.3),
                    SizedBox(height: 20),
                    Text("Adicionar uma turma",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    SizedBox(height: 5),
                    Text("Digite o ID da turma disponibilizado pelo professor.",
                        textAlign: TextAlign.center),
                    SizedBox(height: 20),
                    Center(
                        child: Row(children: <Widget>[
                      Container(
                          width: 150,
                          child: TextField(
                              textAlign: TextAlign.center,
                              onChanged: controller.changeID,
                              decoration: InputDecoration(hintText: "ID"),
                              style: TextStyle(fontSize: 18))),
                    ], mainAxisAlignment: MainAxisAlignment.spaceEvenly)),
                    SizedBox(height: 20),
                    /*TextFormField(
                        controller: null, //nomeController,
                        decoration: InputDecoration(labelText: "Seu nome"),
                        style: TextStyle(fontSize: 18)),
                    SizedBox(height: 20),*/
                    FlatButton(
                      textColor: Colors.white,
                      color: Colors.redAccent,
                      child: Text("Adicionar"),
                      //onPressed: _openCaso) // MÉTODO ANTERIOR
                      // NOVA MÉTODO DE ACESSO
                      onPressed: () {
                        controller.getClassByAcessCode();
                      },
                    )
                  ]),
                ]))));
  }

  alerta(String text) {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return AlertDialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(10.0),
            ),
          ),
          title: Text(text),
          actions: [
            FlatButton(
              child: const Text('OK'),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
              },
            )
          ],
        );
      },
    );
  }
}
