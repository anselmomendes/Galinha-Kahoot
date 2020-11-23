import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import '../../teacher_root/teacher_root_controller.dart';

class DrawersWidget extends StatelessWidget {
  final controller = Modular.get<TeacherRootController>();

  ListTile _getTile(
      {@required String title, IconData icon, @required String route}) {
    return ListTile(
      leading: icon == null ? null : Icon(icon,  color: Colors.white,),
      title: Text(
        title,
        style: TextStyle(fontSize: 20,  color: Colors.white,),
      ),
      onTap: () {
        Modular.to.pop();
        if (route != null) Modular.to.pushNamed(route);
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
      child: Container(
 decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: [Colors.redAccent[100], Colors.redAccent])),
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
                      top: 10.0,
                      child: Image.asset(
                        'assets/bitsbranco.png',
                        height: 100,
                      ),
                    ),
                    Positioned(
                        left: 0.0,
                        bottom: 0.0,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              'Olá professor!',
                              style: TextStyle(
                                  fontSize: 18.0, fontWeight: FontWeight.bold,  color: Colors.white,),
                            ),
                            /* GestureDetector(
                              child: Text(
                                'Entre ou cadastre-se >',
                                style: TextStyle(
                                    color: Theme.of(context).accentColor,
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              onTap: () {},
                            ), */
                          ],
                        )),
                  ],
                ),
              ),
              Divider(),
              _getTile(icon: Icons.home, title: "Início", route: null),
              _getTile(

                  icon: Icons.person,
                  title: "Meu Perfil",
                  route: '/teacher/teacher_perfil'),
              _getTile(
                  icon: Icons.local_hospital,
                  title: "Acessar Casos",
                  route: '/teacher/teacher_list_cases'),
              _getTile(
                  icon: Icons.description,
                  title: "Relatórios",
                  route: '/teacher/teacher_report'),
              _getTile(
                  icon: Icons.info,
                  title: "Sobre",
                  route: '/teacher/teacher_about'),
                   _getTile(
                  icon: Icons.public,
                  title: "Casos Públicos",
                  route: '/cases/cases_public'),
              ListTile(
                leading: Icon(Icons.exit_to_app,  color: Colors.white,),
                title: Text(
                  "Sair",
                  style: TextStyle(fontSize: 20,  color: Colors.white,),
                ),
                onTap: () {
                  controller.logout();
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/', (Route<dynamic> route) => false);
                },
              ),
            ],
          ),
        ],
      ),
      ),
    );
  }
}
