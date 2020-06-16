import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/common/BaseAuth.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import 'package:galinha_karoot/app/modules/teacher/models/TeacherModel.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_perfil/teacher_perfil_controller.dart';
import 'package:galinha_karoot/app/shared/widgets/raise_button/RaiseButton.dart';

class TeacherPerfilPage extends StatefulWidget {
  final bool showAppBar;
  final String title;
  const TeacherPerfilPage(
      {Key key, this.title = "TeacherPerfil", this.showAppBar})
      : super(key: key);

  @override
  _TeacherPerfilPageState createState() => _TeacherPerfilPageState();
}

class _TeacherPerfilPageState
    extends ModularState<TeacherPerfilPage, TeacherPerfilController> {
  final auth = Auth();
  FirebaseUser user;
  String userEmail;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    // Coletando informações do cadastro do professor
    collectUser();

    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              centerTitle: true,
              backgroundColor: Colors.redAccent,
              title: Text(widget.title),
            )
          : null,
      floatingActionButton: FloatingActionButton(
          backgroundColor: appContrastColor,
          child: Icon(Icons.edit),
          onPressed: null),
      body: Container(
        // height: 550,
        child: Observer(builder: (_) {
          /* if (userEmail == null)
            return Center(
              child: RaisedButton(
                onPressed: () => controller.getList(),
                child: Text('Nenhum usuário registrado'),
              ),
            );
          else  */if (controller.teacherList == null)
            return Center(
              child: CircularProgressIndicator(),
            );
          else if (controller.teacherList.name.isEmpty)
            return Center(
              child: RaisedButton(
                onPressed: () => controller.getList(),
                child: Text('Error'),
              ),
            );
          else {
            TeacherModel model = controller.teacherList;
            print(model.name);

            return SingleChildScrollView(
              padding: EdgeInsets.only(
                  top: screenWidth * 0.05,
                  left: screenWidth * 0.05,
                  right: screenWidth * 0.05),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Form(
                      child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Center(
                        child: Column(
                          children: <Widget>[
                            Text("Olá professor! ",
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600)),
                            SizedBox(height: 5),
                            Text("Aqui você encontra as informações do perfil.",
                                textAlign: TextAlign.center),
                          ],
                        ),
                      ),
                      SizedBox(height: 30),
                      RichText(
                          text: TextSpan(
                        text: 'Nome: ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: headerFontSize,
                            fontWeight: headerFontWeight),
                        children: <TextSpan>[
                          TextSpan(
                              text: '${model.name}', style: text2TextStyle),
                        ],
                      )),
                      Divider(thickness: 2.0),
                      SizedBox(height: 20),
                      RichText(
                          text: TextSpan(
                        text: 'Universidade: ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: headerFontSize,
                            fontWeight: headerFontWeight),
                        children: <TextSpan>[
                          TextSpan(
                              text: model.university, style: text2TextStyle),
                        ],
                      )),
                      Divider(thickness: 2.0),
                      SizedBox(height: 20),
                      RichText(
                          text: TextSpan(
                        text: 'Email: ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: headerFontSize,
                            fontWeight: headerFontWeight),
                        children: <TextSpan>[
                          TextSpan(text: userEmail, style: text2TextStyle),
                        ],
                      )),
                      Divider(thickness: 2.0),
                      /* Padding(
                        padding: EdgeInsets.only(left: screenWidth*0.72),
                        child: Row(
                          children: <Widget>[
                            FloatingActionButton(
                                backgroundColor: appContrastColor,
                                child: Icon(Icons.edit),
                                onPressed: null),
                          ],
                        ),
                      ), */
                      SizedBox(height: screenWidth * 0.7),
                      Center(
                        child:
                            circularButton(text: 'Alterar senha', func: () {}),
                      ),
                      // Divider(thickness: 2.0),
                      SizedBox(height: 10),
                      Center(
                        child: circularButton(
                            text: 'Excluir conta',
                            func: () {
                              // user.delete();
                              String senha = '123123';
                              // auth.signIn(userEmail, senha);
                              // auth.deleteUser();
                              deleteUser();
                              // controller.delete(model);
                              /* Navigator.pushNamedAndRemoveUntil(context, '/',
                                  (Route<dynamic> route) => false); */
                              print('Deletando user e model de perfil');
                            }),
                      ),
                    ],
                  ))
                ],
              ),
            );
          }
        }),
      ),
    );
  }

  void collectUser() async {
    FirebaseUser user = await auth.getCurrentUser();
    userEmail = user.email;
  }

  Future<void> deleteUser() async {
    FirebaseUser user = await auth.getCurrentUser();
    user.reload();
    user.delete();
  }
}
