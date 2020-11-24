import 'package:PeensA/app/modules/cases/models/QuestionModel.dart';

abstract class IQuizRepository {
  Stream<List<QuestionModel>> get();
  Future save(QuestionModel model);
  Future delete(QuestionModel model);
}
