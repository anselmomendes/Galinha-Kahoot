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

  final _$loadQuizAsyncAction = AsyncAction('loadQuiz');

  @override
  Future loadQuiz(String casesID, String page) {
    return _$loadQuizAsyncAction.run(() => super.loadQuiz(casesID, page));
  }

  final _$_StudentCasesQuizControllerBaseActionController =
      ActionController(name: '_StudentCasesQuizControllerBase');

  @override
  dynamic getQuiz() {
    final _$actionInfo =
        _$_StudentCasesQuizControllerBaseActionController.startAction();
    try {
      return super.getQuiz();
    } finally {
      _$_StudentCasesQuizControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'quizList: ${quizList.toString()},casesPage: ${casesPage.toString()},cases: ${cases.toString()},editMode: ${editMode.toString()}';
    return '{$string}';
  }
}
