import 'package:flutter/material.dart';

class TeacherCadastroPage extends StatefulWidget {
  final String title;
  const TeacherCadastroPage({Key key, this.title = "TeacherCadastro"})
      : super(key: key);

  @override
  _TeacherCadastroPageState createState() => _TeacherCadastroPageState();
}

class _TeacherCadastroPageState extends State<TeacherCadastroPage> {
  final _tituloController = TextEditingController();
  final _descController = TextEditingController();
  final _valorController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.redAccent,
          title: Text("Cadastro de novo Docente"),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Column(children: <Widget>[
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
                      // Map<String, String> dados = <String, String>{
                      //   "titulo": _tituloController.text,
                      //   "descricao": _descController.text,
                      //   "conta": _contaSelecionada,
                      //   "categoria": _categoriaSelecionada,
                      //   "valor": _valorController.text,
                      //   // "categoria" : this.categoria.toString(),
                      //   // "subcategoria" : this.subcategoria.toString() //CONTA?
                      // };

                      //Verifica se as entradas de texto estão vazias
                      //Se estiver vazio, abre o popup de alerta

                      //   if (_descController.text == "" ||
                      //           _tituloController.text == "" ||
                      //           _contaSelecionada == "" ||
                      //           _categoriaSelecionada == "" ||
                      //           _valorController.text == ""
                      //       //num.tryParse(valorController.text) == null
                      //       ) {

                      //     return new Alert(
                      //       context: context,
                      //       type: AlertType.error,
                      //       title: "AVISO",
                      //       desc: "Verifique se os dados estão corretos!",
                      //       buttons: [
                      //         DialogButton(
                      //           child: Text(
                      //             "OK",
                      //             style: TextStyle(
                      //                 color: Colors.white, fontSize: 20),
                      //           ),
                      //           onPressed: () => Navigator.pop(context),
                      //           width: 120,
                      //         )
                      //       ],
                      //     ).show();
                      //   } else {

                      //   CollectionReference entradas;

                      //   entradas = Firestore.instance
                      //   .collection("entradaCollection")
                      //   .document("entradaDocument").collection("entradas");

                      //   entradas.document().setData(dados).whenComplete(() {
                      //   print("Conta adicionada com sucesso");

                      //     // addEntrada = Firestore.instance
                      //     //     .collection("agricultores")
                      //     //     .document(widget.user.usuario.uid)
                      //     //     .collection("addEntrada");

                      //     // addEntrada
                      //     //     .document()
                      //     //     .setData(dados)
                      //     //     .whenComplete(() {
                      //     //   print("Document Added");
                      //     // }).catchError((e) => print(e));

                      //     //Seta novamente os campos para ficar "em branco". Dispose não estava funcionando
                      //     _descController.text = "";
                      //     _tituloController.text = "";
                      //     _valorController.text = "";
                      //     _contaSelecionada = "";
                      //     _categoriaSelecionada = "";

                      //     Navigator.pop(context);
                      //     // Navigator.pop(context);
                      //     // Navigator.pop(context);

                      //   }

                      // );
                      // }
                    }),
                Divider(
                  height: 20,
                  color: Colors.transparent,
                ),
              ],
            ),
          ]),
        ));
  }
}
