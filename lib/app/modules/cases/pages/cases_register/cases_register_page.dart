import 'package:flutter/material.dart';

class CasesRegisterPage extends StatefulWidget {
  final String title;
  const CasesRegisterPage({Key key, this.title = "CasesRegister"})
      : super(key: key);

  @override
  _CasesRegisterPageState createState() => _CasesRegisterPageState();
}

class _CasesRegisterPageState extends State<CasesRegisterPage> {
  final _tituloController = TextEditingController();
  final _descController = TextEditingController();
  final _valorController = TextEditingController();

////////
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text("Cadastro de novo Caso"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
            // ! Colocar abaixo novo caso (por enquanto tá a cópia do cadastro de professor)

            Card(
              elevation: 0,
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                    Padding(
                        padding: const EdgeInsets.only(top: 8, left: 10),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.person,
                                size: 20, color: Colors.grey[600]),
                            Text(
                              " Nome Completo:",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: Colors.grey[600],
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.left,
                            ),
                          ],
                        )),
                    Padding(
                      padding: const EdgeInsets.only(
                          bottom: 10.0, left: 10, right: 10),
                      child: TextField(
                        controller: _tituloController, //Colocar devedor
                        decoration: InputDecoration(
                            hintText: "Nome completo do docente"),
                      ),
                    )
                  ]),
            ),

            Card(
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 8, left: 10),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.school, size: 20, color: Colors.grey[600]),
                          Text(
                            " Universidade: ",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 10, right: 10),
                    child: TextField(
                      controller: _descController,
                      decoration:
                          InputDecoration(hintText: "Adicione a universidade"),
                    ),
                  )
                ],
              ),
            ),

            Card(
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 8, left: 10),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.subject,
                              size: 20, color: Colors.grey[600]),
                          Text(
                            " Disciplinas ministradas: ",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 10, right: 10),
                    child: TextField(
                      controller: _descController,
                      decoration:
                          InputDecoration(hintText: "Adicione as disciplinas"),
                    ),
                  )
                ],
              ),
            ),

//VALOR

            Card(
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 8, left: 10),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.assignment_ind,
                              size: 20, color: Colors.grey[600]),
                          Text(
                            " Nome de usuário: ",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 10, right: 10),
                    child: TextField(
                      controller: _descController,
                      decoration: InputDecoration(
                          hintText: "Adicione um nome de usuário"),
                    ),
                  )
                ],
              ),
            ),

            Card(
              elevation: 0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(top: 8, left: 10),
                      child: Row(
                        children: <Widget>[
                          Icon(Icons.security,
                              size: 20, color: Colors.grey[600]),
                          Text(
                            " Senha: ",
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[600],
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.left,
                          ),
                        ],
                      )),
                  Padding(
                    padding: const EdgeInsets.only(
                        bottom: 10.0, left: 10, right: 10),
                    child: TextField(
                      controller: _descController,
                      decoration:
                          InputDecoration(hintText: "Adicione uma nova senha"),
                    ),
                  )
                ],
              ),
            ),

            Divider(),
            // Linha com os botões
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  color: Colors.red,
                  child:
                      Text("Cancelar", style: TextStyle(color: Colors.white)),
                  onPressed: () => {Navigator.pop(context)},
                ),
                VerticalDivider(),
                RaisedButton(
                    color: Theme.of(context).primaryColor,
                    child: Text(
                      "Confirmar",
                      style: TextStyle(color: Colors.white),
                    ),
                    onPressed: () {
                      //
                    }),
                Divider(
                  height: 20,
                  color: Colors.transparent,
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.pushNamed(context, '/cases_home');
                  },
                  child: Icon(Icons.check),
                ),
              ],
            ),
          ]),
        ));
  }
}
