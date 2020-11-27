// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'teacher_cadastro_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$TeacherCadastroController on _TeacherCadastroBase, Store {
  Computed<bool> _$isValidComputed;

  @override
  bool get isValid =>
      (_$isValidComputed ??= Computed<bool>(() => super.isValid)).value;

  final _$emailAtom = Atom(name: '_TeacherCadastroBase.email');

  @override
  String get email {
    _$emailAtom.context.enforceReadPolicy(_$emailAtom);
    _$emailAtom.reportObserved();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.context.conditionallyRunInAction(() {
      super.email = value;
      _$emailAtom.reportChanged();
    }, _$emailAtom, name: '${_$emailAtom.name}_set');
  }

  final _$passwordAtom = Atom(name: '_TeacherCadastroBase.password');

  @override
  String get password {
    _$passwordAtom.context.enforceReadPolicy(_$passwordAtom);
    _$passwordAtom.reportObserved();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.context.conditionallyRunInAction(() {
      super.password = value;
      _$passwordAtom.reportChanged();
    }, _$passwordAtom, name: '${_$passwordAtom.name}_set');
  }

  final _$nameAtom = Atom(name: '_TeacherCadastroBase.name');

  @override
  String get name {
    _$nameAtom.context.enforceReadPolicy(_$nameAtom);
    _$nameAtom.reportObserved();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.context.conditionallyRunInAction(() {
      super.name = value;
      _$nameAtom.reportChanged();
    }, _$nameAtom, name: '${_$nameAtom.name}_set');
  }

  final _$universityAtom = Atom(name: '_TeacherCadastroBase.university');

  @override
  String get university {
    _$universityAtom.context.enforceReadPolicy(_$universityAtom);
    _$universityAtom.reportObserved();
    return super.university;
  }

  @override
  set university(String value) {
    _$universityAtom.context.conditionallyRunInAction(() {
      super.university = value;
      _$universityAtom.reportChanged();
    }, _$universityAtom, name: '${_$universityAtom.name}_set');
  }

  final _$_TeacherCadastroBaseActionController =
      ActionController(name: '_TeacherCadastroBase');

  @override
  dynamic changeEmail(String value) {
    final _$actionInfo = _$_TeacherCadastroBaseActionController.startAction();
    try {
      return super.changeEmail(value);
    } finally {
      _$_TeacherCadastroBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeName(String value) {
    final _$actionInfo = _$_TeacherCadastroBaseActionController.startAction();
    try {
      return super.changeName(value);
    } finally {
      _$_TeacherCadastroBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changeUniversity(String value) {
    final _$actionInfo = _$_TeacherCadastroBaseActionController.startAction();
    try {
      return super.changeUniversity(value);
    } finally {
      _$_TeacherCadastroBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  dynamic changePassword(String value) {
    final _$actionInfo = _$_TeacherCadastroBaseActionController.startAction();
    try {
      return super.changePassword(value);
    } finally {
      _$_TeacherCadastroBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    final string =
        'email: ${email.toString()},password: ${password.toString()},name: ${name.toString()},university: ${university.toString()},isValid: ${isValid.toString()}';
    return '{$string}';
  }
}
