// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cases_kahoot_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CasesKahootController on _CasesKahootBase, Store {
  final _$editModeAtom = Atom(name: '_CasesKahootBase.editMode');

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

  final _$casesListAtom = Atom(name: '_CasesKahootBase.casesList');

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

  final _$_CasesKahootBaseActionController =
      ActionController(name: '_CasesKahootBase');

  @override
  dynamic getList() {
    final _$actionInfo = _$_CasesKahootBaseActionController.startAction();
    try {
      return super.getList();
    } finally {
      _$_CasesKahootBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic save(CasesModel model) {
    final _$actionInfo = _$_CasesKahootBaseActionController.startAction();
    try {
      return super.save(model);
    } finally {
      _$_CasesKahootBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic delete(CasesModel model) {
    final _$actionInfo = _$_CasesKahootBaseActionController.startAction();
    try {
      return super.delete(model);
    } finally {
      _$_CasesKahootBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'editMode: ${editMode.toString()},casesList: ${casesList.toString()}';
    return '{$string}';
  }
}
