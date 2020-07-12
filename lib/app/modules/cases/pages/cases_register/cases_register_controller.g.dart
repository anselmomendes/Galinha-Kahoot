// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cases_register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CasesRegisterController on _CasesRegisterBase, Store {
  final _$casesListAtom = Atom(name: '_CasesRegisterBase.casesList');

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

  final _$_CasesRegisterBaseActionController =
      ActionController(name: '_CasesRegisterBase');

  @override
  Future<bool> save(CasesModel model) {
    final _$actionInfo = _$_CasesRegisterBaseActionController.startAction();
    try {
      return super.save(model);
    } finally {
      _$_CasesRegisterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'casesList: ${casesList.toString()}';
    return '{$string}';
  }
}
