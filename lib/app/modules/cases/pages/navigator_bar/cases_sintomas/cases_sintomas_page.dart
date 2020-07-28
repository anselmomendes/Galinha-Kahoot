import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/models/ComponentModel.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_sintomas/cases_sintomas_controller.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import 'package:galinha_karoot/app/shared/widgets/raise_button/RaiseButton.dart';

class CasesSintomasPage extends StatefulWidget {
  final String title;
  final CasesModel model;
  const CasesSintomasPage(
      {Key key, this.title = "Apresentação do Caso", this.model})
      : super(key: key);

  @override
  _CasesSintomasPageState createState() => _CasesSintomasPageState();
}

class _CasesSintomasPageState
    extends ModularState<CasesSintomasPage, CasesSintomasController> {
  @override
  void initState() {
    controller.getDocuments(widget.model.id, 'apresentacao');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
        appBar: AppBar(
          elevation: 0.1,
          backgroundColor: appContrastColor,
          title: Text(widget.title),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Container(
              height: screenWidth * 1.1,
              child: Observer(
                name: 'componentes',
                builder: (_) {
                  if (controller.cases == null)
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  else {
                    List<ComponentModel> list = controller.cases;
                    return ListView.builder(
                      itemCount: controller.cases.length,
                      itemBuilder: (_, index) {
                        ComponentModel model = list[index];

                        return Container(
                          child: Card(
                            margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                            elevation: 20,
                            child: GestureDetector(
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    title: Center(
                                      child: Text(
                                        model.type,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 18,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              onTap: () {
                                Navigator.pushNamed(
                                    context, '/cases/cases_edit',
                                    arguments: model);
                              },
                            ),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            Text(
              'Adicionar Campos',
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.05),
                  child: circularButton(
                      text: 'Imagem',
                      func: () async {
                        ComponentModel model = ComponentModel();
                        model.type = 'Imagem';
                        model.idCases = widget.model.id;
                        model.page = 'apresentacao';
                        // model.type = 'image';
                        await controller.create(model);
                        await controller.getDocuments(
                            widget.model.id, 'apresentacao');
                      }),
                ),
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
                Padding(
                  padding: const EdgeInsets.all(1.0),
                  child: circularButton(
                      text: 'Texto',
                      func: () async {
                        ComponentModel model = ComponentModel();
                        model.type = 'Texto';
                        model.idCases = widget.model.id;
                        model.page = 'apresentacao';
                        // model.type = 'text';
                        await controller.create(model);
                        await controller.getDocuments(
                            widget.model.id, 'apresentacao');
                      }),
                ),
                Expanded(
                  flex: 2,
                  child: Container(),
                ),
                Padding(
                  padding: EdgeInsets.only(right: screenWidth * 0.05),
                  child: circularButton(
                      text: 'Título',
                      func: () async {
                        ComponentModel model = ComponentModel();
                        model.type = 'Título';
                        model.idCases = widget.model.id;
                        model.page = 'apresentacao';
                        // model.type = 'topic';
                        await controller.create(model);
                        await controller.getDocuments(
                            widget.model.id, 'apresentacao');
                      }),
                ),
                SizedBox(height: 10),
              ],
            ),
            Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: screenWidth * 0.05),
                  child: Column(
                    children: <Widget>[
                      Text(
                        'Último Campo',
                        style: TextStyle(fontWeight: FontWeight.bold),
                        // style: TextStyle(fontSize: 18),
                        textAlign: TextAlign.center,
                      ),
                      circularButton(
                          text: 'Excluir',
                          func: () async {
                            await controller.delete(
                                widget.model.id, 'apresentacao');
                            await controller.getDocuments(
                                widget.model.id, 'apresentacao');
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ));
  }
}