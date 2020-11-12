// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cases_config_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CasesConfigController on _CasesConfigBase, Store {
  final _$casesListAtom = Atom(name: '_CasesConfigBase.casesList');

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

  final _$_CasesConfigBaseActionController =
      ActionController(name: '_CasesConfigBase');

  @override
  dynamic getList() {
    final _$actionInfo = _$_CasesConfigBaseActionController.startAction();
    try {
      return super.getList();
    } finally {
      _$_CasesConfigBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic update(CasesModel model) {
    final _$actionInfo = _$_CasesConfigBaseActionController.startAction();
    try {
      return super.update(model);
    } finally {
      _$_CasesConfigBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'casesList: ${casesList.toString()}';
    return '{$string}';
  }
}
