// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_root_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TeacherRootController on _TeacherRootBase, Store {
  final _$selectedPageAtom = Atom(name: '_TeacherRootBase.selectedPage');

  @override
  ModuleCallback get selectedPage {
    _$selectedPageAtom.context.enforceReadPolicy(_$selectedPageAtom);
    _$selectedPageAtom.reportObserved();
    return super.selectedPage;
  }

  @override
  set selectedPage(ModuleCallback value) {
    _$selectedPageAtom.context.conditionallyRunInAction(() {
      super.selectedPage = value;
      _$selectedPageAtom.reportChanged();
    }, _$selectedPageAtom, name: '${_$selectedPageAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'selectedPage: ${selectedPage.toString()}';
    return '{$string}';
  }
}
