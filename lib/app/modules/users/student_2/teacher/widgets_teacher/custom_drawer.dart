import 'package:flutter/material.dart';
//import 'package:galinha_karoot/app/modules/student/tiles/drawer_tile.dart';
import 'package:galinha_karoot/app/shared/widgets/tiles/drawer_tile.dart';

class CustomDrawer extends StatelessWidget {
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
          //_buildDrawerBack(),
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
/*                     Positioned(
                        top: 8.0,
                        left: 0.0,
                        child: Text(
                          'PeensA \n App',
                          style: TextStyle(
                              fontSize: 34.0, fontWeight: FontWeight.bold),
                        )), */
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
                    //Divider(),
                  ],
                ),
              ),
              Divider(),
              FlatButton(
                child: DrawerTile(
                  Icons.home,
                  'Início',
                ),
                onPressed: () {},
              ),
              DrawerTile(Icons.list, 'Minha conta'),
              DrawerTile(Icons.playlist_add, 'Acessar turma'),
              DrawerTile(Icons.history, 'Histórico de turma'),
              DrawerTile(Icons.info_outline, 'Sobre')
            ],
          )
        ],
      ),
    );
  }
}
