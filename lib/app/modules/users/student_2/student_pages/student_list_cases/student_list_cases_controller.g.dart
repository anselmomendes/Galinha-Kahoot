// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_list_cases_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StudentListCasesController on _StudentListCasesControllerBase, Store {
  final _$casesListAtom =
      Atom(name: '_StudentListCasesControllerBase.casesList');

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

  final _$_StudentListCasesControllerBaseActionController =
      ActionController(name: '_StudentListCasesControllerBase');

  @override
  dynamic getList() {
    final _$actionInfo =
        _$_StudentListCasesControllerBaseActionController.startAction();
    try {
      return super.getList();
    } finally {
      _$_StudentListCasesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<bool> delete(CasesModel model) {
    final _$actionInfo =
        _$_StudentListCasesControllerBaseActionController.startAction();
    try {
      return super.delete(model);
    } finally {
      _$_StudentListCasesControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'casesList: ${casesList.toString()}';
    return '{$string}';
  }
}
