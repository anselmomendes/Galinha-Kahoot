// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClassListController on _ClassListBase, Store {
  final _$classListAtom = Atom(name: '_ClassListBase.classList');

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

  final _$_ClassListBaseActionController =
      ActionController(name: '_ClassListBase');

  @override
  dynamic getList() {
    final _$actionInfo = _$_ClassListBaseActionController.startAction();
    try {
      return super.getList();
    } finally {
      _$_ClassListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic save(ClassModel model) {
    final _$actionInfo = _$_ClassListBaseActionController.startAction();
    try {
      return super.save(model);
    } finally {
      _$_ClassListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic delete(ClassModel model) {
    final _$actionInfo = _$_ClassListBaseActionController.startAction();
    try {
      return super.delete(model);
    } finally {
      _$_ClassListBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'classList: ${classList.toString()}';
    return '{$string}';
  }
}
