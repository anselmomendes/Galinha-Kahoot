import 'package:cloud_firestore/cloud_firestore.dart';

class CasesModel {
  String title;
  String description;
  String idCases;
  String topicOne;
  String textOne;
  String imageUrlOne;
  String topicTwo;
  String textTwo;
  String imageUrlTwo;
  String topicTree;
  String textTree;
  String imageUrlTree;
  String topicFour;
  String textFour;
  String imageUrlFour;
  String topicFive;
  String textFive;
  String imageUrlFive;
  String topicSix;
  String textSix;
  String imageUrlSix;
  DocumentReference reference;

  CasesModel({
    this.title,
    this.description,
    this.idCases,
    this.topicOne,
    this.textOne,
    this.imageUrlOne,
    this.topicTwo,
    this.textTwo,
    this.imageUrlTwo,
    this.topicTree,
    this.textTree,
    this.imageUrlTree,
    this.topicFour,
    this.textFour,
    this.imageUrlFour,
    this.topicFive,
    this.textFive,
    this.imageUrlFive,
    this.topicSix,
    this.textSix,
    this.imageUrlSix,
    this.reference,
  });

  factory CasesModel.fromDocument(DocumentSnapshot doc) => CasesModel(
        title: doc['title'],
        description: doc['description'],
        idCases: doc['idCases'],
        topicOne: doc['topicOne'],
        textOne: doc['textOne'],
        imageUrlOne: doc['imageUrlOne'],
        topicTwo: doc['topicTwo'],
        textTwo: doc['textTwo'],
        imageUrlTwo: doc['imageUrlTwo'],
        topicTree: doc['topicTree'],
        textTree: doc['textTree'],
        imageUrlTree: doc['imageUrlTree'],
        topicFour: doc['topicFour'],
        textFour: doc['textFour'],
        imageUrlFour: doc['imageUrlFour'],
        topicFive: doc['topicFive'],
        textFive: doc['textFive'],
        imageUrlFive: doc['imageUrlFive'],
        topicSix: doc['topicSix'],
        textSix: doc['textSix'],
        imageUrlSix: doc['imageUrlSix'],
        reference: doc.reference,
      );
}
