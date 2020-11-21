// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_cases_relatorio_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StudentCasesRelatorioController on _StudentCasesRelatorioBase, Store {
  final _$quizAnsweredAtom =
      Atom(name: '_StudentCasesRelatorioBase.quizAnswered');

  @override
  List<QuizModel> get quizAnswered {
    _$quizAnsweredAtom.context.enforceReadPolicy(_$quizAnsweredAtom);
    _$quizAnsweredAtom.reportObserved();
    return super.quizAnswered;
  }

  @override
  set quizAnswered(List<QuizModel> value) {
    _$quizAnsweredAtom.context.conditionallyRunInAction(() {
      super.quizAnswered = value;
      _$quizAnsweredAtom.reportChanged();
    }, _$quizAnsweredAtom, name: '${_$quizAnsweredAtom.name}_set');
  }

  final _$hitsAtom = Atom(name: '_StudentCasesRelatorioBase.hits');

  @override
  String get hits {
    _$hitsAtom.context.enforceReadPolicy(_$hitsAtom);
    _$hitsAtom.reportObserved();
    return super.hits;
  }

  @override
  set hits(String value) {
    _$hitsAtom.context.conditionallyRunInAction(() {
      super.hits = value;
      _$hitsAtom.reportChanged();
    }, _$hitsAtom, name: '${_$hitsAtom.name}_set');
  }

  final _$accessAtom = Atom(name: '_StudentCasesRelatorioBase.access');

  @override
  ObservableStream<bool> get access {
    _$accessAtom.context.enforceReadPolicy(_$accessAtom);
    _$accessAtom.reportObserved();
    return super.access;
  }

  @override
  set access(ObservableStream<bool> value) {
    _$accessAtom.context.conditionallyRunInAction(() {
      super.access = value;
      _$accessAtom.reportChanged();
    }, _$accessAtom, name: '${_$accessAtom.name}_set');
  }

  final _$getQuizAnswerAsyncAction = AsyncAction('getQuizAnswer');

  @override
  Future getQuizAnswer(String idCases) {
    return _$getQuizAnswerAsyncAction.run(() => super.getQuizAnswer(idCases));
  }

  final _$getHitsAsyncAction = AsyncAction('getHits');

  @override
  Future getHits(String idCases) {
    return _$getHitsAsyncAction.run(() => super.getHits(idCases));
  }

  final _$verifyQuizAsyncAction = AsyncAction('verifyQuiz');

  @override
  Future verifyQuiz(String idCases) {
    return _$verifyQuizAsyncAction.run(() => super.verifyQuiz(idCases));
  }

  final _$_StudentCasesRelatorioBaseActionController =
      ActionController(name: '_StudentCasesRelatorioBase');

  @override
  dynamic loadAccess() {
    final _$actionInfo =
        _$_StudentCasesRelatorioBaseActionController.startAction();
    try {
      return super.loadAccess();
    } finally {
      _$_StudentCasesRelatorioBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'quizAnswered: ${quizAnswered.toString()},hits: ${hits.toString()},access: ${access.toString()}';
    return '{$string}';
  }
}
