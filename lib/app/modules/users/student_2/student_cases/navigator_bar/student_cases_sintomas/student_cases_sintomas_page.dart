import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/cases/models/CasesModels.dart';
import 'package:galinha_karoot/app/modules/cases/models/ComponentModel.dart';
import 'package:galinha_karoot/app/modules/cases/pages/navigator_bar/cases_sintomas/cases_sintomas_controller.dart';
import 'package:galinha_karoot/app/modules/common/styles.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_cases/navigator_bar/student_cases_sintomas/student_cases_sintomas_controller.dart';
import 'package:galinha_karoot/app/shared/widgets/raise_button/RaiseButton.dart';

class StudentCasesSintomasPage extends StatefulWidget {
  final String title;
  final String page;
  final String idCase;
  const StudentCasesSintomasPage({Key key, this.title, this.page, this.idCase})
      : super(key: key);

  @override
  _StudentCasesSintomasPageState createState() =>
      _StudentCasesSintomasPageState();
}

class _StudentCasesSintomasPageState extends ModularState<
    StudentCasesSintomasPage, StudentCasesSintomasController> {
  bool editMode;

  // Variável p/ pegar o valor da posição do último campo
  int lastPosition;

  @override
  void initState() {
    super.initState();
    controller.getDocuments(widget.idCase, widget.page);
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
        body: Observer(builder: (_) {
          if (controller.cases.data == null) {
            return Center(
              child: CircularProgressIndicator(),
            );
          } else if (controller.cases.data.isEmpty) {
            return Text("Nenhum caso encontrado");
          } else {
            List<ComponentModel> list = controller.cases.data;
            return SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(30, 30, 30, 30),
              child: Column(
                children: <Widget>[
                  Container(
                      height: screenWidth * 1.4,
                      child: ListView.builder(
                        itemCount: controller.cases.data.length,
                        itemBuilder: (_, index) {
                          ComponentModel model = list[index];

                          if (model.type.compareTo("Título") == 0) {
                            return Container(
                              margin: EdgeInsets.fromLTRB(0, 15, 0, 10),
                              child: Text(model.value,
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  )),
                            );
                          }
                          if (model.type.compareTo("Texto") == 0) {
                            return Container(
                              margin: EdgeInsets.fromLTRB(0, 15, 0, 10),

                              // height: 50,
                              child: Text(
                                model.value,
                                textAlign: TextAlign.justify,
                                style: TextStyle(fontSize: 18),
                              ),
                            );
                          } else if (model.type.compareTo("Imagem") == 0) {
                            return Container(
                              margin: EdgeInsets.fromLTRB(0, 20, 0, 10),

                              // height: 50,
                              child: Image.network(
                                model.value,
                                fit: BoxFit.contain,
                                // height: 400,
                                width: 300,
                              ),
                            );
                          }
                        },
                      )),
                ],
              ),
            );
          }
        }));
  }
}
