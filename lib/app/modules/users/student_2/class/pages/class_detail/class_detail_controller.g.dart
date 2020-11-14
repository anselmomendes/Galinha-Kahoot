// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClassDetailController on _ClassDetailControllerBase, Store {
  final _$classListAtom = Atom(name: '_ClassDetailControllerBase.classList');

  @override
  ObservableStream<List<ClassModel>> get classList {
    _$classListAtom.context.enforceReadPolicy(_$classListAtom);
    _$classListAtom.reportObserved();
    return super.classList;
  }

  @override
  set classList(ObservableStream<List<ClassModel>> value) {
    _$classListAtom.context.conditionallyRunInAction(() {
      super.classList = value;
      _$classListAtom.reportChanged();
    }, _$classListAtom, name: '${_$classListAtom.name}_set');
  }

  final _$_ClassDetailControllerBaseActionController =
      ActionController(name: '_ClassDetailControllerBase');

  @override
  dynamic getList() {
    final _$actionInfo =
        _$_ClassDetailControllerBaseActionController.startAction();
    try {
      return super.getList();
    } finally {
      _$_ClassDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'classList: ${classList.toString()}';
    return '{$string}';
  }
}
