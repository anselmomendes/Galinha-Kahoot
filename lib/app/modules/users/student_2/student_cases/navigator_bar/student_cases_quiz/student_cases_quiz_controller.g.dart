// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_cases_quiz_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StudentCasesQuizController on _StudentCasesQuizControllerBase, Store {
  final _$quizListAtom = Atom(name: '_StudentCasesQuizControllerBase.quizList');

  @override
  ObservableStream<List<QuizModel>> get quizList {
    _$quizListAtom.context.enforceReadPolicy(_$quizListAtom);
    _$quizListAtom.reportObserved();
    return super.quizList;
  }

  @override
  set quizList(ObservableStream<List<QuizModel>> value) {
    _$quizListAtom.context.conditionallyRunInAction(() {
      super.quizList = value;
      _$quizListAtom.reportChanged();
    }, _$quizListAtom, name: '${_$quizListAtom.name}_set');
  }

  final _$casesPageAtom =
      Atom(name: '_StudentCasesQuizControllerBase.casesPage');

  @override
  ObservableStream<List<ComponentModel>> get casesPage {
    _$casesPageAtom.context.enforceReadPolicy(_$casesPageAtom);
    _$casesPageAtom.reportObserved();
    return super.casesPage;
  }

  @override
  set casesPage(ObservableStream<List<ComponentModel>> value) {
    _$casesPageAtom.context.conditionallyRunInAction(() {
      super.casesPage = value;
      _$casesPageAtom.reportChanged();
    }, _$casesPageAtom, name: '${_$casesPageAtom.name}_set');
  }

  final _$quizAtom = Atom(name: '_StudentCasesQuizControllerBase.quiz');

  @override
  List<QuizModel> get quiz {
    _$quizAtom.context.enforceReadPolicy(_$quizAtom);
    _$quizAtom.reportObserved();
    return super.quiz;
  }

  @override
  set quiz(List<QuizModel> value) {
    _$quizAtom.context.conditionallyRunInAction(() {
      super.quiz = value;
      _$quizAtom.reportChanged();
    }, _$quizAtom, name: '${_$quizAtom.name}_set');
  }

  final _$casesAtom = Atom(name: '_StudentCasesQuizControllerBase.cases');

  @override
  List<ComponentModel> get cases {
    _$casesAtom.context.enforceReadPolicy(_$casesAtom);
    _$casesAtom.reportObserved();
    return super.cases;
  }

  @override
  set cases(List<ComponentModel> value) {
    _$casesAtom.context.conditionallyRunInAction(() {
      super.cases = value;
      _$casesAtom.reportChanged();
    }, _$casesAtom, name: '${_$casesAtom.name}_set');
  }

  final _$editModeAtom = Atom(name: '_StudentCasesQuizControllerBase.editMode');

  @override
  bool get editMode {
    _$editModeAtom.context.enforceReadPolicy(_$editModeAtom);
    _$editModeAtom.reportObserved();
    return super.editMode;
  }

  @override
  set editMode(bool value) {
    _$editModeAtom.context.conditionallyRunInAction(() {
      super.editMode = value;
      _$editModeAtom.reportChanged();
    }, _$editModeAtom, name: '${_$editModeAtom.name}_set');
  }

  final _$getDocumentsAsyncAction = AsyncAction('getDocuments');

  @override
  Future getDocuments(String casesID, String page) {
    return _$getDocumentsAsyncAction
        .run(() => super.getDocuments(casesID, page));
  }

  final _$_StudentCasesQuizControllerBaseActionController =
      ActionController(name: '_StudentCasesQuizControllerBase');

  @override
  dynamic delete(String casesID, String page, String questionID) {
    final _$actionInfo =
        _$_StudentCasesQuizControllerBaseActionController.startAction();
    try {
      return super.delete(casesID, page, questionID);
    } finally {
      _$_StudentCasesQuizControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic create(QuizModel model) {
    final _$actionInfo =
        _$_StudentCasesQuizControllerBaseActionController.startAction();
    try {
      return super.create(model);
    } finally {
      _$_StudentCasesQuizControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'quizList: ${quizList.toString()},casesPage: ${casesPage.toString()},quiz: ${quiz.toString()},cases: ${cases.toString()},editMode: ${editMode.toString()}';
    return '{$string}';
  }
}
