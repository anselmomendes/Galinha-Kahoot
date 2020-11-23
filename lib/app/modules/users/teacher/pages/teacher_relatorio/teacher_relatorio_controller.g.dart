// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_relatorio_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TeacherRelatorioController on _TeacherRelatorioControllerBase, Store {
  final _$listStudentsAtom =
      Atom(name: '_TeacherRelatorioControllerBase.listStudents');

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

  final _$listquizAtom = Atom(name: '_TeacherRelatorioControllerBase.listquiz');

  @override
  ObservableStream<List<QuizModel>> get listquiz {
    _$listquizAtom.context.enforceReadPolicy(_$listquizAtom);
    _$listquizAtom.reportObserved();
    return super.listquiz;
  }

  @override
  set listquiz(ObservableStream<List<QuizModel>> value) {
    _$listquizAtom.context.conditionallyRunInAction(() {
      super.listquiz = value;
      _$listquizAtom.reportChanged();
    }, _$listquizAtom, name: '${_$listquizAtom.name}_set');
  }

  @override
  String toString() {
    final string =
        'listStudents: ${listStudents.toString()},listquiz: ${listquiz.toString()}';
    return '{$string}';
  }
}
