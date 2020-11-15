import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:galinha_karoot/app/modules/class/models/ClassModels.dart';
import 'package:galinha_karoot/app/modules/class/pages/class_list/class_list_controller.dart';
import 'package:galinha_karoot/app/modules/users/student_2/student_class/pages/student_class_list/student_class_list_controller.dart';

class StudentClassListPage extends StatefulWidget {
  final bool showAppBar;
  final String title;
  const StudentClassListPage(
      {Key key, this.title = "Lista de Turmas", this.showAppBar = true})
      : super(key: key);

  @override
  _StudentClassListPageState createState() => _StudentClassListPageState();
}

class _StudentClassListPageState
    extends ModularState<StudentClassListPage, StudentClassListController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showAppBar
          ? AppBar(
              centerTitle: true,
              backgroundColor: Colors.redAccent,
              title: Text(widget.title),
            )
          : null,
      body: Container(
        child: Observer(
          builder: (_) {
            print('teste');

            if (controller.classList.data == null)
              // if (controller.classList2.data == null) //para testes
              return Center(
                child: CircularProgressIndicator(),
              );
            else {
              List<ClassModel> list = controller.classList.data;
              // List<ClassModel> list = controller.classList2.data;

              return ListView.builder(
                itemCount: list.length,
                itemBuilder: (_, index) {
                  ClassModel model = list[index];

                  return Container(
                    height: 150,
                    child: Card(
                      margin: EdgeInsets.fromLTRB(15.0, 5.0, 15.0, 5.0),
                      elevation: 20,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: <Widget>[
                          ListTile(
                            leading: Icon(Icons.arrow_forward_ios),
                            title: Text(
                              'Turma ${index + 1}',
                              style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 18,
                              ),
                            ),
                            subtitle: Text(
                              // model.creationDate,
                              'Turma: ${model.className}',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                            onTap: () {
                              /* Navigator.pushNamed(
                                  context, '/cases/cases_single',
                                  arguments: question_model) */
                              Navigator.pushNamed(
                                context,
                                '/class/class_detail',
                                arguments: model,
                              );
                            },
                            //subtitle: Text(model.right),
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
