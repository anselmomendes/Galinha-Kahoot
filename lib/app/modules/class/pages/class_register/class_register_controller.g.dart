// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'class_register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ClassRegisterController on _ClassRegisterBase, Store {
  final _$classListAtom = Atom(name: '_ClassRegisterBase.classList');

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

  final _$_ClassRegisterBaseActionController =
      ActionController(name: '_ClassRegisterBase');

  @override
  dynamic getList() {
    final _$actionInfo = _$_ClassRegisterBaseActionController.startAction();
    try {
      return super.getList();
    } finally {
      _$_ClassRegisterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic save(ClassModel model) {
    final _$actionInfo = _$_ClassRegisterBaseActionController.startAction();
    try {
      return super.save(model);
    } finally {
      _$_ClassRegisterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic delete(ClassModel model) {
    final _$actionInfo = _$_ClassRegisterBaseActionController.startAction();
    try {
      return super.delete(model);
    } finally {
      _$_ClassRegisterBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string = 'classList: ${classList.toString()}';
    return '{$string}';
  }
}
