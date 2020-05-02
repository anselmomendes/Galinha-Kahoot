import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_about/teacher_about_module.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_list_cases/teacher_list_cases_module.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_menu/teacher_menu_module.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_perfil/teacher_perfil_module.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_report/teacher_report_module.dart';
import 'package:galinha_karoot/app/modules/teacher/pages/teacher_root/teacher_root_controller.dart';

class DrawersWidget extends StatelessWidget {
  final controller = Modular.get<TeacherRootController>();

  ListTile _getTile(
      {@required String title, @required Function() action, IconData icon}) {
    return ListTile(
      leading: icon == null ? null : Icon(icon),
      title: Text(
        title,
        style: TextStyle(fontSize: 20),
      ),
      onTap: () {
        controller.changePage = action;
        Modular.to.pop();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget _buildDrawerBack() => Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Color.fromARGB(255, 211, 118, 130), Colors.white],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter)),
        );

    return Drawer(
      child: Stack(
        children: <Widget>[
          ListView(
            padding: EdgeInsets.only(left: 32.0, top: 16.0),
            children: <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 8.0),
                padding: EdgeInsets.fromLTRB(0.0, 16.0, 16.0, 8.0),
                height: 180.0,
                child: Stack(
                  children: <Widget>[
                    Positioned(
                      left: 65,
                      top: 0.0,
                      child: Image.asset(
                        'assets/bits.png',
                        height: 110,
                      ),
                    ),
                    Positioned(
                        left: 0.0,
                        bottom: 0.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Olá',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold),
                            ),
                            GestureDetector(
                              child: Text(
                                'Entre ou cadastre-se >',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              onTap: () {},
                            ),
                          ],
                        )),
                  ],
                ),
              ),
              Divider(),
              _getTile(
                  icon: Icons.home,
                  action: () => TeacherMenuModule(
                        showAppBar: false,
                      ),
                  title: "Inicio"),
              _getTile(
                  icon: Icons.local_hospital,
                  action: () => TeacherListCasesModule(
                        showAppBar: false,
                      ),
                  title: "Acessar Casos"),
              _getTile(
                  icon: Icons.local_hospital,
                  action: () => TeacherReportModule(
                        showAppBar: false,
                      ),
                  title: "Relatorios"),
              _getTile(
                  icon: Icons.local_hospital,
                  action: () => TeacherPerfilModule(
                        showAppBar: false,
                      ),
                  title: "Meu Perfil"),
              _getTile(
                  icon: Icons.local_hospital,
                  action: () => TeacherAboutModule(
                        showAppBar: false,
                      ),
                  title: "Sobre"),
            ],
          )
        ],
      ),
    );
  }
}
