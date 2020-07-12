// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cases_update_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CasesUpdateController on _CasesUpdateControllerBase, Store {
  final _$casesListAtom = Atom(name: '_CasesUpdateControllerBase.casesList');

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

  final _$_CasesUpdateControllerBaseActionController =
      ActionController(name: '_CasesUpdateControllerBase');

  @override
  Future<bool> update(CasesModel model) {
    final _$actionInfo =
        _$_CasesUpdateControllerBaseActionController.startAction();
    try {
      return super.update(model);
    } finally {
      _$_CasesUpdateControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'casesList: ${casesList.toString()}';
    return '{$string}';
  }
}
