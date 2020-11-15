// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_cases_public_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StudentCasesPublicController on _StudentCasesPublicBase, Store {
  final _$casesListAtom = Atom(name: '_StudentCasesPublicBase.casesList');

  @override
  ObservableStream<List<CasesModel>> get casesList {
    _$casesListAtom.context.enforceReadPolicy(_$casesListAtom);
    _$casesListAtom.reportObserved();
    return super.casesList;
  }

  @override
  set casesList(ObservableStream<List<CasesModel>> value) {
    _$casesListAtom.context.conditionallyRunInAction(() {
      super.casesList = value;
      _$casesListAtom.reportChanged();
    }, _$casesListAtom, name: '${_$casesListAtom.name}_set');
  }

  final _$valueAtom = Atom(name: '_StudentCasesPublicBase.value');

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

  final _$_StudentCasesPublicBaseActionController =
      ActionController(name: '_StudentCasesPublicBase');

  @override
  dynamic getList() {
    final _$actionInfo = _$_StudentCasesPublicBaseActionController.startAction();
    try {
      return super.getList();
    } finally {
      _$_StudentCasesPublicBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increment() {
    final _$actionInfo = _$_StudentCasesPublicBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_StudentCasesPublicBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'casesList: ${casesList.toString()},value: ${value.toString()}';
    return '{$string}';
  }
}
