import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/class/models/ClassModels.dart';
import 'package:galinha_karoot/app/modules/class/pages/class_register/class_register_controller.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import 'package:intl/intl.dart';

class ClassRegisterPage extends StatefulWidget {
  final String title;
  const ClassRegisterPage({Key key, this.title = "Criar Turmas"})
      : super(key: key);

  @override
  _ClassRegisterPageState createState() => _ClassRegisterPageState();
}

class _ClassRegisterPageState
    extends ModularState<ClassRegisterPage, ClassRegisterController> {
  
  final _casesID = TextEditingController();
  final _teacherID = TextEditingController();
  final _timer = TextEditingController();

  final creationDate = new DateFormat("dd/MM/y").format(DateTime.now());

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    ClassModel model = ClassModel();

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.only(
            top: screenWidth * 0.2,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05),
        child: Center(
          child: Column(
            children: <Widget>[
              SizedBox(height: 10),
              Image.asset("assets/bits.png",
                  width: MediaQuery.of(context).size.width * appLogoMediumSize),
              SizedBox(height: 20),
              Text("Cadastrar Turmas", style: headerTextStyle),
              SizedBox(height: 20),
              Form(
                  child: Column(
                children: <Widget>[
                  // _casesID
                  TextFormField(
                      controller: _casesID,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        labelText: 'ID do caso',
                        hintText: "Digite o ID do caso",
                        prefixIcon: Icon(Icons.border_color),
                      )),
                  // _teacherID
                  TextFormField(
                      controller: _teacherID,
                      maxLength: 50,
                      decoration: const InputDecoration(
                        labelText: 'ID do docente',
                        hintText: "Digite o ID do docente",
                        prefixIcon: Icon(Icons.border_color),
                      )),
                ],
              )),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: <Widget>[
                  Observer(builder: (BuildContext context) {
                    return FlatButton(
                        onPressed: () {
                          // Para teste
                          print(creationDate);

                          model.casesID = _casesID.text;
                          model.teacherID = _teacherID.text;
                          model.creationDate = creationDate;

                          controller.save(model);
                          _showAlertDialog(context);
                        },
                        color: appColor,
                        child: Text('Salvar',
                            style: TextStyle(color: Colors.white)));
                  })
                ],
              ),
              SizedBox(
                height: 20.0,
              )
            ],
          ),
        ),
      ),
    );
  }

  void _showAlertDialog(BuildContext context) {
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        _casesID.text = '';
        _teacherID.text = '';
        Modular.to.pop();
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Turma criada"),
      content: Text("A turma foi criada com sucesso!"),
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
}
