import 'package:flutter/material.dart';
import 'package:rflutter_alert/rflutter_alert.dart';

class StudentLoginPage extends StatefulWidget {
  final String title;
  const StudentLoginPage({Key key, this.title = "StudentLogin"})
      : super(key: key);

  @override
  _StudentLoginPageState createState() => _StudentLoginPageState();
}

class _StudentLoginPageState extends State<StudentLoginPage> {
  final maxIdLength = 11;
  var qrCodeCaso;
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  var casoIdController = TextEditingController();
  var nomeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        resizeToAvoidBottomInset: false,
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
                    Text("Entrar como aluno",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w600)),
                    SizedBox(height: 5),
                    Text(
                        "Digite o ID do caso ou escaneie o QR Code disponibilizado pelo professor.",
                        textAlign: TextAlign.center),
                    SizedBox(height: 20),
                    Center(
                        child: Row(children: <Widget>[
                      Container(
                          width: 150,
                          child: TextField(
                              textAlign: TextAlign.center,
                              controller: casoIdController,
                              onChanged: _onCasoIdChanged,
                              maxLength: maxIdLength,
                              decoration: InputDecoration(hintText: "Caso"),
                              style: TextStyle(fontSize: 18))),
                      IconButton(
                          onPressed: _openQrScanner,
                          icon: Icon(Icons.camera_alt),
                          color: Colors.redAccent)
                    ], mainAxisAlignment: MainAxisAlignment.spaceEvenly)),
                    SizedBox(height: 20),
                    TextFormField(
                        controller: nomeController,
                        decoration: InputDecoration(labelText: "Seu nome"),
                        style: TextStyle(fontSize: 18)),
                    SizedBox(height: 20),
                    FlatButton(
                      textColor: Colors.white,
                      color: Colors.redAccent,
                      child: Text("Entrar"),
                      //onPressed: _openCaso) // MÉTODO ANTERIOR
                      // NOVA MÉTODO DE ACESSO
                      onPressed: () { 
                        //_openCaso();
                        // Navigator.pushNamed(context, '/student/student_menu');
                        Navigator.pushNamed(context, '/student_2/teacher/teacher_menu');
                      },
                    )
                  ]),
                ]))));
  }

  bool _validarId() {
    // TODO: Implementar checagem baseada na DB.
    return casoIdController.text.isNotEmpty &&
        casoIdController.text.length == maxIdLength;
  }

  bool _validarNome() {
    // Pode ser qualquer nome /shrug
    return nomeController.text.isNotEmpty;
  }

  _openCaso() {
    // Preguiço de fazer algo melhor
    if (!_validarId()) {
      return new Alert(
        context: context,
        type: AlertType.error,
        title: "Caso inválido!",
        desc: "Verifique o caso inserido e tente novamente.",
        buttons: [
          DialogButton(
            child:
                Text("OK", style: TextStyle(color: Colors.white, fontSize: 20)),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    }

    // Preguiço de fazer algo melhor
    if (!_validarNome()) {
      return new Alert(
        context: context,
        type: AlertType.error,
        title: "Nome inválido!",
        desc: "Verifique o nome inserido e tente novamente.",
        buttons: [
          DialogButton(
            child:
                Text("OK", style: TextStyle(color: Colors.white, fontSize: 20)),
            onPressed: () => Navigator.pop(context),
            width: 120,
          )
        ],
      ).show();
    }
    // IR PARA PAGINA DE MENU
    // Navigator.pushNamed(context, '/student/student_menu');
    Navigator.pushNamed(context, '/student_2/teacher/teacher_menu');


    // Go to caso
    /*Widget destination =
        AlunoTabSelect(casoIdController.text, nomeController.text);
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => destination));
    */
    // MaterialPageRoute(builder: (context) => LoadingPage(destination) ));
  }

  _openQrScanner() async {
    /*qrCodeCaso = await Navigator.push(
        context, MaterialPageRoute(builder: (context) => QRVE())
        );*/
    setState(() {
      if (qrCodeCaso.toString().length > maxIdLength) {
        String substring = qrCodeCaso.toString().substring(0, maxIdLength);
        casoIdController.text = substring;
      } else {
        casoIdController.text = qrCodeCaso;
      }
    });
  }

  void _onCasoIdChanged(String i) async {
    // Caso seja necessário checar a ID do caso antes.
  }
}
