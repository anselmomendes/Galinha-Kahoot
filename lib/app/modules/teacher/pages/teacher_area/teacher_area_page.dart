import 'package:flutter/material.dart';

class TeacherAreaPage extends StatefulWidget {
  final String title;
  const TeacherAreaPage({Key key, this.title = "TeacherArea"})
      : super(key: key);

  @override
  _TeacherAreaPageState createState() => _TeacherAreaPageState();
}

class _TeacherAreaPageState extends State<TeacherAreaPage> {
  @override
  Widget build(BuildContext context) {
    bool isSwitched = true; //Se não funcionar, tirar de dentro do Widget Build

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Área do professor"),
        centerTitle: true,
      ),

      body: ListView(
        padding: EdgeInsets.fromLTRB(15, 10, 15, 10),
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 30, 10, 20),
              child: Text(
                "Bem vindo (a), Eunice!",
                style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          Divider(
            height: 60,
            color: Colors.transparent,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(0, 10, 10, 20),
            child: Text(
              "Casos",
              style: TextStyle(fontSize: 20),
            ),
          ),
          Container(
            child: Center(

                //Cada Card é um "caso"
                child: Column(
              children: <Widget>[
                GestureDetector(
                  onTap: () {},
                  child: Card(
                    elevation: 10,
                    child: FlatButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/cases_home');
                      },
                      child: Container(
                        padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                        height: 40,
                        width: (MediaQuery.of(context).size.width),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.content_paste,
                                size: 20,
                                color: Colors.grey[600]), //Ícone do caso
                            Text(
                              " Caso 1",
                              style: TextStyle(fontSize: 18),
                            ), //Texto do caso

                            Padding(
                              padding: const EdgeInsets.only(left: 150),
                              child: Switch(
                                value: isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched = value;
                                  });
                                },
                                activeTrackColor: Colors.lightGreenAccent,
                                activeColor: Colors.green,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Card(
                    elevation: 10,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      height: 40,
                      width: (MediaQuery.of(context).size.width),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.content_paste,
                              size: 20,
                              color: Colors.grey[600]), //Ícone do caso
                          Text(
                            " Caso 2",
                            style: TextStyle(fontSize: 18),
                          ), //Texto do caso

                          Padding(
                            padding: const EdgeInsets.only(left: 150),
                            child: Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              },
                              activeTrackColor: Colors.lightGreenAccent,
                              activeColor: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    )),
                Card(
                    elevation: 10,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      height: 40,
                      width: (MediaQuery.of(context).size.width),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.content_paste,
                              size: 20,
                              color: Colors.grey[600]), //Ícone do caso
                          Text(
                            " Caso 3",
                            style: TextStyle(fontSize: 18),
                          ), //Texto do caso

                          Padding(
                            padding: const EdgeInsets.only(left: 150),
                            child: Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              },
                              activeTrackColor: Colors.lightGreenAccent,
                              activeColor: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    )),
                Card(
                    elevation: 10,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      height: 40,
                      width: (MediaQuery.of(context).size.width),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.content_paste,
                              size: 20,
                              color: Colors.grey[600]), //Ícone do caso
                          Text(
                            " Caso 4",
                            style: TextStyle(fontSize: 18),
                          ), //Texto do caso

                          //this goes in as one of the children in our column
                          //Botão switch
                          Padding(
                            padding: const EdgeInsets.only(left: 150),
                            child: Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              },
                              activeTrackColor: Colors.lightGreenAccent,
                              activeColor: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    )),
                Card(
                    elevation: 10,
                    child: Container(
                      padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                      height: 40,
                      width: (MediaQuery.of(context).size.width),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.content_paste,
                              size: 20,
                              color: Colors.grey[600]), //Ícone do caso
                          Text(
                            " Caso 5",
                            style: TextStyle(fontSize: 18),
                          ),

                          Padding(
                            padding: const EdgeInsets.only(left: 150),
                            child: Switch(
                              value: isSwitched,
                              onChanged: (value) {
                                setState(() {
                                  isSwitched = value;
                                });
                              },
                              activeTrackColor: Colors.lightGreenAccent,
                              activeColor: Colors.green,
                            ),
                          ),
                        ],
                      ),
                    )),
              ],
            )),
          )
        ],
      ),

      //Botão de adicionar novos casos
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, 'cases_register');
        },
        child: Icon(
          Icons.add,
          size: 35,
        ),
        tooltip: "Adicionar novo caso",
        backgroundColor: Colors.red,
      ),
    );
  }
}
