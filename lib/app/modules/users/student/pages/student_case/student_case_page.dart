import 'package:flutter/material.dart';

class StudentCasePage extends StatefulWidget {
  final String title;
  const StudentCasePage({Key key, this.title = "StudentCase"})
      : super(key: key);

  @override
  _StudentCasePageState createState() => _StudentCasePageState();
}

class _StudentCasePageState extends State<StudentCasePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
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
        ],
      ),
        ),
    );
  }
}
