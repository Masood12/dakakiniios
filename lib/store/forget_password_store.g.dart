// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forget_password_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ForgetPasswordStore on _ForgetPasswordStore, Store {
  final _$emailAtom = Atom(name: '_ForgetPasswordStore.email');

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

  final _$stateAtom = Atom(name: '_ForgetPasswordStore.state');

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
email: ${email},
state: ${state}
    ''';
  }
}
