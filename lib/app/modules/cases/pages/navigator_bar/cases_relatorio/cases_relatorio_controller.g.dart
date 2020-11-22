// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cases_relatorio_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CasesRelatorioController on _CasesRelatorioBase, Store {
  final _$listStudentsAtom = Atom(name: '_CasesRelatorioBase.listStudents');

  @override
  ObservableStream<List<StudentModel>> get listStudents {
    _$listStudentsAtom.context.enforceReadPolicy(_$listStudentsAtom);
    _$listStudentsAtom.reportObserved();
    return super.listStudents;
  }

  @override
  set listStudents(ObservableStream<List<StudentModel>> value) {
    _$listStudentsAtom.context.conditionallyRunInAction(() {
      super.listStudents = value;
      _$listStudentsAtom.reportChanged();
    }, _$listStudentsAtom, name: '${_$listStudentsAtom.name}_set');
  }

  @override
  String toString() {
    final string = 'listStudents: ${listStudents.toString()}';
    return '{$string}';
  }
}
