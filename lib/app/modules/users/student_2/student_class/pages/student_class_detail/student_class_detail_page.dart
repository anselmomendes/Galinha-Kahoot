import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/class/models/ClassModels.dart';
import 'package:galinha_karoot/app/modules/class/pages/class_detail/class_detail_controller.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_class/pages/student_class_detail/student_class_detail_controller.dart';
import 'package:galinha_karoot/app/shared/widgets/text_timer/selectionText.dart';
import 'package:intl/intl.dart';

class StudentClassDetailPage extends StatefulWidget {
  final ClassModel classModel;
  final bool showAppBar;
  final String title;
  const StudentClassDetailPage({
    Key key,
    this.title = "Detalhe da Turma",
    this.showAppBar = true,
    @required this.classModel,
  }) : super(key: key);

  @override
  _StudentClassDetailPageState createState() => _StudentClassDetailPageState();
}

class _StudentClassDetailPageState
    extends ModularState<StudentClassDetailPage, StudentClassDetailController> {
  // Variável para o status da turma
  String _statusLocal;
  @override
  void initState() {
    controller.setClass(widget.classModel);
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              centerTitle: true,
              backgroundColor: Colors.redAccent,
              title: Text(widget.title),
            )
          : null,
      body: Container(
        child: Observer(
          builder: (_) {
            if (controller.classModel.data == null)
              return Center(
                child: CircularProgressIndicator(),
              );
            else {
              ClassModel classModel = controller.classModel.data;
              // Conversão do status
              bool _statusBool = classModel.status;
              _checkStatus(_statusBool);

              // Tratamento de data
              var creationDate;
              var modifiedDate;
              var endTime;
              creationDate = DateFormat("dd/MM/y hh:mm a")
                  .format(classModel.creationDate.toDate());
              modifiedDate = DateFormat("dd/MM/y hh:mm a")
                  .format(classModel.modifiedDate.toDate());
              endTime = DateFormat("dd/MM/y hh:mm a")
                  .format(classModel.endTime.toDate());

              return SingleChildScrollView(
                padding: EdgeInsets.only(
                    top: screenWidth * 0.05,
                    left: screenWidth * 0.05,
                    right: screenWidth * 0.05),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    // Text("Cadastrar Casos", style: headerTextStyle),
                    // SizedBox(height: 20),
                    Form(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          // SizedBox(height: 25),
                          Center(
                            child: Column(
                              children: <Widget>[
                                Text("Olá professor! ",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.w600)),
                                SizedBox(height: 5),
                                Text(
                                    "Aqui você encontra as informações da turma.",
                                    textAlign: TextAlign.center),
                              ],
                            ),
                          ),
                          SizedBox(height: 30),
                          RichText(
                              text: TextSpan(
                            text: 'Código de acesso: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: headerFontSize,
                                fontWeight: headerFontWeight),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '${classModel.accessCode}',
                                  style: text2TextStyle),
                            ],
                          )),
                          Divider(thickness: 2.0),
                          SizedBox(height: 20),
                          RichText(
                              text: TextSpan(
                            text: 'Status: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: headerFontSize,
                                fontWeight: headerFontWeight),
                            children: <TextSpan>[
                              TextSpan(
                                  text: _statusLocal, style: text2TextStyle),
                            ],
                          )),
                          Divider(thickness: 2.0),
                          SizedBox(height: 20),
                          RichText(
                              text: TextSpan(
                            text: 'Nome da turma: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: headerFontSize,
                                fontWeight: headerFontWeight),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '${classModel.className}',
                                  style: text2TextStyle),
                            ],
                          )),
                          Divider(thickness: 2.0),
                          SizedBox(height: 20),
                          RichText(
                              text: TextSpan(
                            text: 'Caso selecionado: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: headerFontSize,
                                fontWeight: headerFontWeight),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '${classModel.titleCase}',
                                  style: text2TextStyle),
                            ],
                          )),
                          /* Divider(thickness: 2.0),
                          SizedBox(height: 20),
                          RichText(
                              text: TextSpan(
                            text: 'Autor: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: headerFontSize,
                                fontWeight: headerFontWeight),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '',
                                  style: text2TextStyle),
                            ],
                          )), */
                          Divider(thickness: 2.0),
                          SizedBox(height: 20),
                          RichText(
                              text: TextSpan(
                            text: 'Data de criação: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: headerFontSize,
                                fontWeight: headerFontWeight),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '${creationDate}',
                                  style: text2TextStyle),
                            ],
                          )),
                          Divider(thickness: 2.0),
                          SizedBox(height: 20),
                          RichText(
                              text: TextSpan(
                            text: 'Última modificação: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: headerFontSize,
                                fontWeight: headerFontWeight),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '${modifiedDate}',
                                  style: text2TextStyle),
                            ],
                          )),
                          Divider(thickness: 2.0),
                          SizedBox(height: 20),
                          RichText(
                              text: TextSpan(
                            text: 'Temporizador: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: headerFontSize,
                                fontWeight: headerFontWeight),
                            children: <TextSpan>[
                              TextSpan(
                                  // text: '${model.timer} minutos',
                                  text: selectiontextDetail(classModel.timer),
                                  style: text2TextStyle),
                            ],
                          )),
                          Divider(thickness: 2.0),
                          SizedBox(height: 20),
                          RichText(
                              text: TextSpan(
                            text: 'Turma expira em: ',
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: headerFontSize,
                                fontWeight: headerFontWeight),
                            children: <TextSpan>[
                              TextSpan(
                                  text: '${endTime}', style: text2TextStyle),
                            ],
                          )),
                          Divider(thickness: 2.0),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Center(
                      child: RaisedButton(
                          child: Text("Acessar Caso"),
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              '/student_cases/cases_home',
                              arguments: classModel,
                            );
                          }),
                    )
                  ],
                ),
              );
            }
          },
        ),
      ),
    );
  }

  // Converter o status de 'true' ou 'false' para 'Ativado' ou 'Desativado'
  void _checkStatus(bool status) {
    if (status.toString().compareTo('true') == 0) {
      _statusLocal = 'Ativado';
    } else {
      _statusLocal = 'Desativado';
    }
  }
}
