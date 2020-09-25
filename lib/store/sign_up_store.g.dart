// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_up_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$SignUpStore on _SignUpStore, Store {
  final _$fullNameAtom = Atom(name: '_SignUpStore.fullName');

  @override
  String get fullName {
    _$fullNameAtom.reportRead();
    return super.fullName;
  }

  @override
  set fullName(String value) {
    _$fullNameAtom.reportWrite(value, super.fullName, () {
      super.fullName = value;
    });
  }

  final _$emailAtom = Atom(name: '_SignUpStore.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$passwordAtom = Atom(name: '_SignUpStore.password');

  @override
  String get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  final _$userTypeAtom = Atom(name: '_SignUpStore.userType');

  @override
  String get userType {
    _$userTypeAtom.reportRead();
    return super.userType;
  }

  @override
  set userType(String value) {
    _$userTypeAtom.reportWrite(value, super.userType, () {
      super.userType = value;
    });
  }

  final _$refNoAtom = Atom(name: '_SignUpStore.refNo');

  @override
  String get refNo {
    _$refNoAtom.reportRead();
    return super.refNo;
  }

  @override
  set refNo(String value) {
    _$refNoAtom.reportWrite(value, super.refNo, () {
      super.refNo = value;
    });
  }

  final _$stateAtom = Atom(name: '_SignUpStore.state');

  @override
  LoadingState get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(LoadingState value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  @override
  String toString() {
    return '''
fullName: ${fullName},
email: ${email},
password: ${password},
userType: ${userType},
refNo: ${refNo},
state: ${state}
    ''';
  }
}
