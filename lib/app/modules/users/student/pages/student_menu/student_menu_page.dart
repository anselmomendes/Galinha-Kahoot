import 'package:flutter/material.dart';
import 'package:galinha_karoot/app/modules/users/student/pages/student_menu/student_menu_controller.dart';
import 'package:galinha_karoot/app/modules/users/student/widgets_student/ClassCard.dart';
import '../../widgets_student/custom_drawer.dart';

class StudentMenuPage extends StatefulWidget {
  final String title;
  const StudentMenuPage({Key key, this.title = "Aluno"}) : super(key: key);

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
                  SizedBox(height: 10),
                  Text("Casos pendentes:",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                  SizedBox(
                      child: Card(
                          child: new InkWell(
                              child: Padding(
                                  padding: EdgeInsets.all(10),
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
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Text(
                                                  'Casos de possuimentos por demônios.',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13,
                                                      color: Colors.black87)),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: <Widget>[
                                                    Icon(
                                                        Icons
                                                            .collections_bookmark,
                                                        size: 12),
                                                    SizedBox(width: 5),
                                                    RichText(
                                                        text: TextSpan(
                                                      text: 'Turma do Satanás',
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 13,
                                                          color:
                                                              Colors.black54),
                                                    ))
                                                  ]),
                                              Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: <Widget>[
                                                    Icon(Icons.alarm, size: 12),
                                                    SizedBox(width: 5),
                                                    RichText(
                                                        text: TextSpan(
                                                            text: 'Expira em: ',
                                                            style: TextStyle(
                                                                fontSize: 11,
                                                                color: Colors
                                                                    .black87),
                                                            children: <
                                                                TextSpan>[
                                                          TextSpan(
                                                              text: "5 horas",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w900))
                                                        ]))
                                                  ])
                                            ])
                                      ])),
                              onTap: () {
                                print("Tocado");
                              }))),
                  SizedBox(height: 15),
                  Text("Meu desempenho:",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                  SizedBox(
                      child: Card(
                          child: InkWell(
                              child: Padding(
                                  padding: EdgeInsets.all(10),
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
                                                MainAxisAlignment.spaceEvenly,
                                            children: <Widget>[
                                              Text(
                                                  'Questionário sobre condicionais',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      fontSize: 13)),
                                              Text(
                                                  'Algoritmos condicionais em linguagem C.',
                                                  style: TextStyle(
                                                      fontWeight:
                                                          FontWeight.w300,
                                                      fontSize: 10))
                                            ]),
                                        Container(
                                            decoration: BoxDecoration(
                                                color: Colors.green,
                                                borderRadius:
                                                    BorderRadius.circular(50)),
                                            child: Padding(
                                              padding: EdgeInsets.all(5),
                                              child: RichText(
                                                  text: TextSpan(
                                                      text: "10/10",
                                                      style: TextStyle(
                                                          fontSize: 10,
                                                          fontWeight: FontWeight
                                                              .w800))),
                                            ))
                                      ])),
                              onTap: () {
                                print("Tocado 2");
                              }))),
                  SizedBox(height: 15),
                  Text("Minhas turmas:",
                      style:
                          TextStyle(fontWeight: FontWeight.w700, fontSize: 16)),
                  SizedBox(height: 5),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.max,
                      children: controller.classes
                          .map((e) => ClassCard.fromClass(e))
                          .toList() //;
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
