import 'package:flutter_modular/flutter_modular.dart';
import 'package:dio/dio.dart';

class CasesRepository extends Disposable {
  Future fetchPost(Dio client) async {
    final response =
        await client.get('https://jsonplaceholder.typicode.com/posts/1');
    return response.data;
  }

  //dispose will be called automatically
  @override
  void dispose() {}
<<<<<<< Updated upstream
=======

  @override
  Future save(CasesModel model) async {
    int total = (await Firestore.instance.collection('Cases').getDocuments())
        .documents
        .length;

    if (model.reference == null) {
      model.reference = await Firestore.instance.collection('Cases').add({
        'question': model.question,
        'answers1': model.answers1,
        'answers2': model.answers2,
        'answers3': model.answers3,
        'answers4': model.answers4,
        'answers5': model.answers5,
        'right': model.right,
        'idClass': model.idClass,
        'idTeacher': model.idTeacher,
        'position': total
      });
    } else {
      model.reference.updateData({
        'question': model.question,
        'answers1': model.answers1,
        'answers2': model.answers2,
        'answers3': model.answers3,
        'answers4': model.answers4,
        'answers5': model.answers5,
        'right': model.right,
        'idClass': model.idClass,
        'idTeacher': model.idTeacher,
        'position': total
      });
    }
  }

  @override
  Future delete(CasesModel model) {
    return model.reference.delete();
  }

  @override
  Stream<List<CasesModel>> get() {
    return firestore.collection('Cases').snapshots().map((query) =>
        query.documents.map((doc) => CasesModel.fromDocument(doc)).toList());
  }
>>>>>>> Stashed changes
}
