import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:galinha_karoot/app/modules/class/models/ClassModels.dart';
import 'package:galinha_karoot/app/modules/users/student/pages/test_student_menu/test_student_menu_controller.dart';
import 'package:galinha_karoot/app/modules/users/student/widgets_student/ClassCard.dart';
import 'package:mobx/src/api/async.dart';
import '../../widgets_student/custom_drawer.dart';

class StudentMenuPage extends StatefulWidget {
  final String title;
  const StudentMenuPage({Key key, this.title = "Aluno", bool showAppBar}) : super(key: key);

  @override
  _StudentMenuPageState createState() => _StudentMenuPageState();
}

class _StudentMenuPageState extends State<StudentMenuPage> {
  var controller = StudentMenuController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: CustomDrawer(),
        appBar: AppBar(
          title: Text("Peensa - Aluno", style: TextStyle(fontSize: 16)),
          actions: <Widget>[
            Padding(padding: EdgeInsets.only(right: 20.0)),
            FlatButton(
                onPressed: null,
                padding: EdgeInsets.all(0.0),
                child: Row(children: <Widget>[
                  Container(
                      child: CircleAvatar(
                          radius: 20,
                          backgroundImage: NetworkImage(
                              "https://i.pinimg.com/originals/11/ec/8b/11ec8bf3ba3c2aa047345434561b526e.png")),
                      width: 40.0,
                      height: 40.0,
                      padding: const EdgeInsets.all(2.0), // borde width
                      decoration: new BoxDecoration(
                        color: Colors.white, // border color
                        shape: BoxShape.circle,
                      ))
                ])),
          ],
        ),
        backgroundColor: Color.fromRGBO(240, 240, 240, 1),
        body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text("Minhas turmas:",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                  SizedBox(height: 5),
                  SafeArea(
                    child: Container(
                      child: Expanded(
                        child: Observer(builder: (_) {
                          if (controller.classes.data == null ||
                              controller.classes.data.isEmpty) {
                            return Text(
                                "Você não esta cadastrado em nenhuma turma");
                          } else {
                            return Container(
                              child: ListView.builder(
                                itemBuilder: (context, index) {
                                  return ClassCard.fromClass(
                                      controller.classes.data[index]);
                                },
                              ),
                            );
                          }
                        }),
                      ),
                    ),
                  )
                ])));
  }
/*
	@override
	void initState(){   
		controller.getClasses();
		super.initState();
	}*/
}
