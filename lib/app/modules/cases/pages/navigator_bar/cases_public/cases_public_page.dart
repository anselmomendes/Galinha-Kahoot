import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';

import 'cases_public_controller.dart';

class CasesPublicPage extends StatefulWidget {
  final String title;
  final CasesModel model;
  final bool showAppBar;

  const CasesPublicPage({Key key, this.title = "CasesPublic", this.model, this.showAppBar = true})
      : super(key: key);

  @override
  _CasesPublicPageState createState() => _CasesPublicPageState();
}

class _CasesPublicPageState extends ModularState<CasesPublicPage, CasesPublicController> {
   final _topicOne = TextEditingController();
  final _textOne = TextEditingController();
  final _imageUrlOne = TextEditingController();
  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
 appBar: widget.showAppBar
          ? AppBar(
              backgroundColor: Colors.redAccent,
              title: Text(widget.title),
              centerTitle: true,
            )
          : null,
      body: Container(
         child: Observer(
          builder: (_) {
            if (controller.casesList.data == null)
              return Center(
                child: CircularProgressIndicator(),
              );
            else if (controller.casesList.hasError) 
              return Center(
                child: RaisedButton(
                  onPressed: () => controller.getList(), 
                  child: Text('Error'),
                 
                ),
              );
                else {
              List<CasesModel> list = controller.casesList.data;

              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (_, index) {
                  CasesModel model = list[index];

                  return Container(
                    height: 150,
                    child: Card(
                      margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                      elevation: 20,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              model.title, //model.topicOne,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: //Text(model.title),
                                Text(
                              model.description, //model.textOne,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/cases/cases_home',
                                arguments: model,
                              );
                            },
                            //subtitle: Text(model.right),
                          ),
                          ButtonBar(
                            children: <Widget>[
                              FlatButton(
                                color: Colors.redAccent,
                                child: const Text('ACESSAR'),
                                onPressed: () {
                                  Navigator.pushNamed(
                                    context,
                                    '/cases/cases_home',
                                    arguments: model,
                                   );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
              }
          },
        ),
      ),
    );
  }
}
