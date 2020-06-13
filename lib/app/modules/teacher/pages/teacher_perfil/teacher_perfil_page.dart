import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/common/BaseAuth.dart';
import 'package:galinha_karoot/app/modules/teacher/models/TeacherModel.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_perfil/teacher_perfil_controller.dart';

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
  String _uidTest;
  var docs;
  TeacherModel model;
  DocumentSnapshot perfil;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    // _testGetUser();

    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              title: Text(widget.title),
            )
          : null,
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
            
            TeacherModel model = controller.teacherList;
            print(model.name);
            // TeacherModel model = list[0];

            /* return Column(
            children: <Widget>[
              Center(
                child: Column(
                  children: <Widget>[
                    Text('Formulario de editar dados do cadastro'),
                    Text('$_uidTest'),
                    // Text('${model.name}')
                  ],
                ),
              )
            ],
          ); */
            return Text(model.name);
            // }
          }
        }),
      ),
    );
  }

}
