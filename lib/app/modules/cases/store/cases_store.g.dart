// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cases_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CasesStore on _CasesStoreBase, Store {
  final _$casesModelAtom = Atom(name: '_CasesStoreBase.casesModel');

  @override
  CasesModel get casesModel {
    _$casesModelAtom.context.enforceReadPolicy(_$casesModelAtom);
    _$casesModelAtom.reportObserved();
    return super.casesModel;
  }

  @override
  set casesModel(CasesModel value) {
    _$casesModelAtom.context.conditionallyRunInAction(() {
      super.casesModel = value;
      _$casesModelAtom.reportChanged();
    }, _$casesModelAtom, name: '${_$casesModelAtom.name}_set');
  }

  final _$_CasesStoreBaseActionController =
      ActionController(name: '_CasesStoreBase');

  @override
  dynamic setModel(CasesModel model) {
    final _$actionInfo = _$_CasesStoreBaseActionController.startAction();
    try {
      return super.setModel(model);
    } finally {
      _$_CasesStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'casesModel: ${casesModel.toString()}';
    return '{$string}';
  }
}
