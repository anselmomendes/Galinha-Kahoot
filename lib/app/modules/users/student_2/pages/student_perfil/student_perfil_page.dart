import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/common/BaseAuth.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import '../../models/StudentModel.dart';
import 'student_perfil_controller.dart';
import 'package:galinha_karoot/app/shared/widgets/raise_button/RaiseButton.dart';

class StudentPerfilPage extends StatefulWidget {
  final bool showAppBar;
  final String title;
  const StudentPerfilPage(
      {Key key, this.title = "TeacherPerfil", this.showAppBar})
      : super(key: key);

  @override
  _TeacherPerfilPageState createState() => _TeacherPerfilPageState();
}

class _TeacherPerfilPageState
    extends ModularState<StudentPerfilPage, StudentPerfilController> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _passwordController = TextEditingController();
  final auth = Auth();
  FirebaseUser user;
  bool _passCheck = false;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    // Coletando informações do usuário professor
    getUserLogged();

    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              centerTitle: true,
              backgroundColor: Colors.redAccent,
              title: Text(widget.title),
            )
          : null,
      /* floatingActionButton: FloatingActionButton(
          backgroundColor: appContrastColor,
          child: Icon(Icons.edit),
          onPressed: () {
            Navigator.pushNamed(context, 'teacher/teacher_perfil_edit',
                arguments: model);
          }), */
      body: Container(
        // height: 550,
        child: Observer(builder: (_) {
          if (controller.teacherList == null)
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
            StudentModel model = controller.teacherList;
            // TeacherModel model = controller.teacherList;

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
                          TextSpan(text: model.name, style: text2TextStyle),
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
                          TextSpan(text: user.email, style: text2TextStyle),
                        ],
                      )),
                      Divider(thickness: 2.0),
                      SizedBox(height: screenWidth * 0.5),
                      Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            RaisedButton(
                                color: Colors.blueAccent,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                    side: BorderSide(color: Colors.blueAccent)),
                                child: Text(
                                  'Editar Dados',
                                  style: TextStyle(
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {
                                  Navigator.pushNamed(
                                      context, 'teacher/teacher_perfil_edit',
                                      arguments: model);
                                }),

                            // Divider(thickness: 2.0),
                            SizedBox(height: 10),

                            RaisedButton(
                              color: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.blueAccent)),
                              child: Text(
                                'Alterar Senha',
                                style: TextStyle(
                                  color: Colors.white,
                                ),
                              ),
                              onPressed: () {
                                _showVerifyEmailSentDialogConfirm();
                              },
                            ),

                            /* try {
                                await auth.sendPasswordResetMail(user.email);
                                _showVerifyEmailSentDialogConfirm();
                              } catch (e) {
                                print("Error em alterar senha: $e");
                              } */
                            // Divider(thickness: 2.0),
                            SizedBox(height: 10),
                            RaisedButton(
                              color: Colors.blueAccent,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                  side: BorderSide(color: Colors.blueAccent)),
                              child: Text('Excluir Conta',
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                              onPressed: () {
                                _showAlertDialogDelete(model: model);
                              },
                            ),
                          ],
                        ),
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

  void getUserLogged() async {
    user = await auth.getCurrentUser();
  }

  Future<void> deleteUser() async {
    // user = await auth.getCurrentUser();

    String _userUidCheck =
        await auth.signIn(user.email, _passwordController.text);

    if (_userUidCheck == null) {
      _passCheck = false;
    } else {
      _passCheck = true;
    }
  }

  void _showVerifyEmailSentDialogConfirm() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Aviso"),
          content: new Text("Deseja alterar a senha?"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Cancelar"),
              onPressed: () {
                Modular.to.pop();
              },
            ),
            new FlatButton(
              child: new Text("OK"),
              onPressed: () async {
                try {
                  await auth.sendPasswordResetMail(user.email);
                  // _showVerifyEmailSentDialogConfirm();
                  _showVerifyEmailSentDialog();
                } catch (e) {
                  print("Error em alterar senha: $e");
                }
              },
            ),
          ],
        );
      },
    );
  }

  void _showVerifyEmailSentDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Verifique seu email."),
          content: new Text(
              "Um link para alterar a senha foi enviado para seu email."),
          actions: <Widget>[
            new FlatButton(
              child: new Text("OK"),
              onPressed: () {
                // Navigator.pushNamed(context, Modular.initialRoute);
                // Modular.to.pop();
                controller.controllerRoot.logout();
                Navigator.pushNamedAndRemoveUntil(
                    context, '/', (Route<dynamic> route) => false);
              },
            ),
          ],
        );
      },
    );
  }

  void _showAlertDialogDelete({StudentModel model}) {
    model ??= StudentModel();
    var screenWidth = MediaQuery.of(context).size.width;

    Widget cancelButton = FlatButton(
      child: Text("Cancelar"),
      onPressed: () {
        _passwordController.text = '';
        Modular.to.pop();
      },
    );
    // configura o button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        // _casesID.text = '';
        // _teacherID.text = '';
        // controller.delete(model);
        // _passwordController.text = '';
        if (_formKey.currentState.validate()) {
          deleteUser();

          /*  if (_passCheck == true) {
            controller.delete(model);
            user.delete();
            controller.controllerRoot.logout();
            Navigator.pushNamedAndRemoveUntil(
                context, '/', (Route<dynamic> route) => false);
          }*/

          /* if (_passCheck == false) {
            _passwordController.text = '';

            Modular.to.pop();
          } */
        }
      },
    );
    // configura o  AlertDialog
    AlertDialog alerta = AlertDialog(
      title: Text("Aviso"),
      content: Form(
          key: _formKey,
          child: Container(
            height: screenWidth * 0.3,
            child: Column(
              children: <Widget>[
                Text("Insira sua senha!"),
                TextFormField(
                    controller: _passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(labelText: 'Senha'),
                    validator: (String value) {
                      if (value.isEmpty) {
                        return "Por favor, insira uma senha!";
                      } else {
                        return null;
                      }
                    }),
              ],
            ),
          )),
      actions: [
        cancelButton,
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
