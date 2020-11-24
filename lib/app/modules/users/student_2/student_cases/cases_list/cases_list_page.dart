import 'package:PeensA/app/modules/cases/models/CasesModels.dart';
import 'package:PeensA/app/modules/class/models/ClassModels.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'cases_list_controller.dart';

class CasesListPage extends StatefulWidget {
  final String title;
  final ClassModel classModel;
  const CasesListPage({Key key, this.title = "CasesList", this.classModel})
      : super(key: key);

  @override
  _CasesListPageState createState() => _CasesListPageState();
}

class _CasesListPageState
    extends ModularState<CasesListPage, CasesListController> {
  //use 'controller' variable to access controller
  @override
  void initState() {
    super.initState();
    controller.getCase(widget.classModel);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        child: Observer(
          builder: (_) {
            if (controller.caseModel == null) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else {
              CasesModel casesModel = controller.caseModel.data;
              return Column(
                children: <Widget>[
                  Container(
                    height: 150,
                    child: Card(
                      margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                      elevation: 20,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            title: Text(
                              casesModel.title, //model.topicOne,
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: //Text(model.title),
                                Text(
                              casesModel.description, //model.textOne,
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            onTap: () {
                              Navigator.pushNamed(
                                context,
                                '/cases/cases_home',
                                arguments: casesModel,
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
                                    '/student_cases/cases_home',
                                    arguments: casesModel,
                                  );
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
