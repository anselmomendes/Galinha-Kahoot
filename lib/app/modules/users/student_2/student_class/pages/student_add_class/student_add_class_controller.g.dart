// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'student_add_class_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$StudentAddClassController on _StudentAddClassBase, Store {
  final _$idAtom = Atom(name: '_StudentAddClassBase.id');

  @override
  String get id {
    _$idAtom.context.enforceReadPolicy(_$idAtom);
    _$idAtom.reportObserved();
    return super.id;
  }

  @override
  set id(String value) {
    _$idAtom.context.conditionallyRunInAction(() {
      super.id = value;
      _$idAtom.reportChanged();
    }, _$idAtom, name: '${_$idAtom.name}_set');
  }

  final _$getClassByAcessCodeAsyncAction = AsyncAction('getClassByAcessCode');

  @override
  Future<void> getClassByAcessCode() {
    return _$getClassByAcessCodeAsyncAction
        .run(() => super.getClassByAcessCode());
  }

  final _$_StudentAddClassBaseActionController =
      ActionController(name: '_StudentAddClassBase');

  @override
  dynamic changeID(String value) {
    final _$actionInfo = _$_StudentAddClassBaseActionController.startAction();
    try {
      return super.changeID(value);
    } finally {
      _$_StudentAddClassBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'id: ${id.toString()}';
    return '{$string}';
  }
}
