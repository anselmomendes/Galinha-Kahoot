// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cases_single_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CasesSingleController on _CasesSingleBase, Store {
  final _$valueAtom = Atom(name: '_CasesSingleBase.value');

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

  final _$_CasesSingleBaseActionController =
      ActionController(name: '_CasesSingleBase');

  @override
  void increment() {
    final _$actionInfo = _$_CasesSingleBaseActionController.startAction();
    try {
      return super.increment();
    } finally {
      _$_CasesSingleBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'value: ${value.toString()}';
    return '{$string}';
  }
}
