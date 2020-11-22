import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:galinha_karoot/app/modules/class/models/ClassModels.dart';
import 'package:galinha_karoot/app/modules/class/models/StudentClassMeta.dart';

class ClassCard extends StatelessWidget {
  ClassCard({this.title});
  factory ClassCard.fromClass(ClassModel c) => ClassCard(title: c.className);

  final title;

  @override
  Widget build(BuildContext context) {
    return Card(
        child: InkWell(
            child: Padding(
                padding: EdgeInsets.all(10),
                child: Row(children: <Widget>[
                  Column(children: <Widget>[
                    _generateThumbnail(),
                  ]),
                  SizedBox(width: 10),
                  Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(title,
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 13)),
                        Text("Testando",
                            style: TextStyle(
                                fontWeight: FontWeight.w300, fontSize: 10)),
                        RichText(
                            text: TextSpan(
                                text: "Professor: ",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 11,
                                    fontWeight: FontWeight.w500),
                                children: <TextSpan>[
                              TextSpan(
                                  text: "Testando Junior",
                                  style: TextStyle(fontWeight: FontWeight.w300))
                            ])),
                      ]),
                ])),
            onTap: () {
              Navigator.pushNamed(context, '/student/student_case');
            }));
  }

  CircleAvatar _generateThumbnail() {
    try {
      NetworkImage image = NetworkImage("https://picsum.photos/200");
      return CircleAvatar(radius: 20, backgroundImage: image);
    } catch (e) {
      print("Erro ao carregar imagem de turma: ${e.toString()}");
      return CircleAvatar(
          backgroundImage: NetworkImage("https://picsum.photos/200"),
          radius: 20);
    }
  }
}
