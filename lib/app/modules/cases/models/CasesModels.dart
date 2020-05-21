import 'package:cloud_firestore/cloud_firestore.dart';

class CasesModel {
  String idCases;
  String title;
  /*
  String topicOne;
  String textOne;
  String imageUrlOne;
  String topictwo;
  String textTwo;
  String imageUrlTwo;
  String topicTree;
  String textTree
  String imageUrlTree;
  String topicFour;
  String textFour;
  String imageUrlFour;
  */
  String description;
  String imageUrl;
  DocumentReference reference;

  CasesModel({
    this.idCases = '',
    this.title = '',
    this.description = '',
    this.imageUrl = '',
    this.reference,
  });

  factory CasesModel.fromDocument(DocumentSnapshot doc) => CasesModel(
        idCases: doc['idCases'],
        title: doc['title'],
        description: doc['description'],
        imageUrl: doc['imageUrl'],
        reference: doc.reference,
      );
}
