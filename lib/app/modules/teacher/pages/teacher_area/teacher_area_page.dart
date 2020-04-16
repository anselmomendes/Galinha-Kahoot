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
                  onTap: () {
                    /*
                    Navigator.push(
                        context,
                        // !Mudar para o bottomTabSelect
////                  MaterialPageRoute(builder: (context) => SintomasCasoPage())); //Passar argumento do caso pra dar certo ao ler cada um. Pode ser o ID...
                        MaterialPageRoute(
                            builder: (context) =>
                                TabSelect())); //Passar argumento do caso pra dar certo ao ler cada um. Pode ser o ID...
                  */
                  },
                  child: Card(
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
                              " Caso 1",
                              style: TextStyle(fontSize: 18),
                            ), //Texto do caso

                            //Espaço entre o texto e o botão switch

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
                  // Container(
                  //   color: Colors.yellow,
                  //   child: Text('TURN LIGHTS ON'),
                  // ),
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

                          //Espaço entre o texto e o botão switch

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
                            " Caso 3",
                            style: TextStyle(fontSize: 18),
                          ), //Texto do caso

                          //Espaço entre o texto e o botão switch

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
                          ), //Texto do caso

                          //Espaço entre o texto e o botão switch

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

      // SingleChildScrollView(
      //   padding: EdgeInsets.only(
      //     top: 40.0,
      //     left: 40.0,
      //     right: 40.0,
      //   ),
      //   child:

      // Column(
      //     children: <Widget>[

      //       Text("Bem vindo (a), Eunice!\n", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30,),
      //       textAlign: TextAlign.left,),

      //   Container(
      //     height: 50.0,
      //     alignment: Alignment.centerRight,
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         begin: Alignment.topLeft,
      //         end: Alignment.bottomRight,
      //         stops: [0.3, 1],
      //         colors: [ Colors.green, Colors.green],
      //       ),
      //       borderRadius: BorderRadius.all(
      //         Radius.circular(10.0),
      //       ),
      //     ),
      //     child: SizedBox.expand(
      //       child: FlatButton(
      //         //NAVIGATOR PARA VISUALIZAR ENTRADAS
      //         onPressed: () {
      //           // Navigator.push(
      //           //   context,
      //           //   MaterialPageRoute(builder: (context) => VisualizarEntradas()),
      //           // );
      //         },
      //         child: Text(
      //           "Visualizar entradas",
      //           style: TextStyle(
      //             fontSize: 16,
      //             color: Colors.white,
      //             // fontWeight: FontWeight.w900,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),

      //   SizedBox(
      //     height: 20.0,
      //   ),

      //   Container(
      //     height: 50.0,
      //     alignment: Alignment.centerRight,
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         begin: Alignment.topLeft,
      //         end: Alignment.bottomRight,
      //         stops: [0, 1],
      //         colors: [
      //           Colors.green, Colors.green,
      //         ],
      //       ),
      //       borderRadius: BorderRadius.all(
      //         Radius.circular(10.0),
      //       ),
      //     ),
      //     child: SizedBox.expand(
      //       child: FlatButton(
      //         onPressed: () {
      //           // Navigator.push(
      //           //   context,
      //           //   MaterialPageRoute(builder: (context) => CadastrarEntrada()),
      //           // );
      //         },
      //         child: Text(
      //           "Cadastrar nova entrada",
      //           style: TextStyle(
      //             fontSize: 16,
      //             color: Colors.white,
      //             // fontWeight: FontWeight.w900,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),

      //   SizedBox(
      //     height: 20.0,
      //   ),

      //   Container(
      //     height: 50.0,
      //     alignment: Alignment.centerRight,
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         begin: Alignment.topLeft,
      //         end: Alignment.bottomRight,
      //         stops: [0, 1],
      //         colors: [
      //           Colors.orange, Colors.redAccent,
      //         ],
      //       ),
      //       borderRadius: BorderRadius.all(
      //         Radius.circular(10.0),
      //       ),
      //     ),
      //     child: SizedBox.expand(
      //       child: FlatButton(
      //         onPressed: () {
      //           // Navigator.push(
      //           //   context,
      //           //   MaterialPageRoute(builder: (context) => VisualizarSaidas()),
      //           // );
      //         },
      //         child: Text(
      //           "Visualizar saídas",
      //           style: TextStyle(
      //             fontSize: 16,
      //             color: Colors.white,
      //             // fontWeight: FontWeight.w900,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),

      //   SizedBox(
      //     height: 20.0,
      //   ),
      //   Container(
      //     height: 50.0,
      //     alignment: Alignment.centerRight,
      //     decoration: BoxDecoration(
      //       gradient: LinearGradient(
      //         begin: Alignment.topLeft,
      //         end: Alignment.bottomRight,
      //         stops: [0, 1],
      //         colors: [
      //           Colors.orange, Colors.redAccent,
      //         ],
      //       ),
      //       borderRadius: BorderRadius.all(
      //         Radius.circular(10.0),
      //       ),
      //     ),
      //     child: SizedBox.expand(
      //       child: FlatButton(
      //         onPressed: () {
      //           // Navigator.push(
      //           //   context,
      //           //   MaterialPageRoute(builder: (context) => CadastrarSaida()),
      //           // );
      //         },
      //         child: Text(
      //           "Cadastrar nova saída",
      //           style: TextStyle(
      //             fontSize: 16,
      //             color: Colors.white,
      //             // fontWeight: FontWeight.w900,
      //           ),
      //         ),
      //       ),
      //     ),
      //   ),
      // ],
    );
  }
}
