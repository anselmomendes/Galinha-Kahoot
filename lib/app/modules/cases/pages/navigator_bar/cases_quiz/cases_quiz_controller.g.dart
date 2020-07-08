// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cases_quiz_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CasesQuizController on _CasesQuizControllerBase, Store {
  final _$quizListAtom = Atom(name: '_CasesQuizControllerBase.quizList');

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

  final _$valueAtom = Atom(name: '_CasesQuizControllerBase.value');

  @override
  int get value {
    _$valueAtom.context.enforceReadPolicy(_$valueAtom);
    _$valueAtom.reportObserved();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.context.conditionallyRunInAction(() {
      super.value = value;
      _$valueAtom.reportChanged();
    }, _$valueAtom, name: '${_$valueAtom.name}_set');
  }

  final _$_CasesQuizControllerBaseActionController =
      ActionController(name: '_CasesQuizControllerBase');

  @override
  dynamic getList(String casesID) {
    final _$actionInfo =
        _$_CasesQuizControllerBaseActionController.startAction();
    try {
      return super.getList(casesID);
    } finally {
      _$_CasesQuizControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increment() {
    final _$actionInfo =
        _$_CasesQuizControllerBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_CasesQuizControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'quizList: ${quizList.toString()},value: ${value.toString()}';
    return '{$string}';
  }
}
