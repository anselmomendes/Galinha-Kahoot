import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import 'package:galinha_karoot/app/modules/teacher/models/TeacherModel.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_perfil/teacher_perfil_controller.dart';

class TeacherPerfilEditPage extends StatefulWidget {
  final TeacherModel teacherModel;
  final String title;
  const TeacherPerfilEditPage(
      {Key key, this.title = "Editar Dados", @required this.teacherModel})
      : super(key: key);

  @override
  _TeacherPerfilEditPageState createState() => _TeacherPerfilEditPageState();
}

class _TeacherPerfilEditPageState
    extends ModularState<TeacherPerfilEditPage, TeacherPerfilController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  // final TextEditingController _emailController = TextEditingController();
  // final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _universityController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();

@override
  void initState() {
    // TODO: implement initState
    // Iniciado os campos com os dados do db
    _nameController.text = widget.teacherModel.name;
    _universityController.text = widget.teacherModel.university;
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

                /* // Email
                TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(
                      labelText: 'Email',
                      hintText: "Endereço de email",
                      prefixIcon: Icon(Icons.mail),
                    )),

                // Senha
                TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(
                      labelText: 'Senha',
                      hintText: "Senha",
                      prefixIcon: Icon(Icons.lock),
                    )), */
              ])),
          SizedBox(height: 20),
          Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                FlatButton(
                    onPressed: () {
                      // _register;
                      widget.teacherModel.name = _nameController.text;
                      widget.teacherModel.university = _universityController.text;
                      controller.save(widget.teacherModel);
                      debugPrint('Botão: salvar');
                    },
                    color: appContrastColor,
                    child:
                        Text('Salvar', style: TextStyle(color: Colors.white)))
              ])
        ])));
  }
}
