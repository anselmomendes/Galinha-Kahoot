import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:PeensA/app/modules/common/styles.dart';
import 'package:PeensA/app/modules/users/student_2/student_pages/student_perfil_edit/student_perfil_edit_controller.dart';
import '../../models/StudentModel.dart';

class StudentPerfilEditPage extends StatefulWidget {
  final StudentModel studentModel; // Esse model agora é do Student_2
  final String title;
  const StudentPerfilEditPage(
      {Key key, this.title = "Editar Dados", @required this.studentModel})
      : super(key: key);

  @override
  _StudentPerfilEditPageState createState() => _StudentPerfilEditPageState();
}

class _StudentPerfilEditPageState
    extends ModularState<StudentPerfilEditPage, StudentPerfilEditController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _universityController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    // Iniciado os campos com os dados do db
    _nameController.text = widget.studentModel.name;
    _universityController.text = widget.studentModel.university;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: appContrastColor,
        title: Text(widget.title),
        centerTitle: true,
      ),
      body: _body(),
    );
  }

  _body() {
    var screenWidth = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
        padding: EdgeInsets.only(
            top: screenWidth * 0.2,
            left: screenWidth * 0.05,
            right: screenWidth * 0.05),
        child: Center(
            child: Column(children: <Widget>[
          Image.asset("assets/bits.png",
              width: MediaQuery.of(context).size.width * appLogoMediumSize),
          SizedBox(height: 20),
          Text("Alteração de Dados", style: headerTextStyle),
          SizedBox(height: 20),
          Form(
              key: _formKey,
              child: Column(children: <Widget>[
                // Nome
                TextFormField(
                    controller: _nameController,
                    decoration: const InputDecoration(
                      labelText: 'Nome',
                      hintText: "Nome completo",
                      prefixIcon: Icon(Icons.person),
                    )),

                // Universidade
                TextFormField(
                    controller: _universityController,
                    decoration: const InputDecoration(
                      labelText: 'Universidade',
                      hintText: "Nome da Universidade",
                      prefixIcon: Icon(Icons.school),
                    )),
              ])),
          SizedBox(height: 20),
          Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: <
              Widget>[
            FlatButton(
                onPressed: () {
                  // _register;
                  widget.studentModel.name = _nameController.text;
                  widget.studentModel.university = _universityController.text;
                  /*controller.save(widget.teacherModel);*/
                  debugPrint('Botão: salvar');
                },
                color: appContrastColor,
                child: Text('Salvar', style: TextStyle(color: Colors.white)))
          ])
        ])));
  }
}
