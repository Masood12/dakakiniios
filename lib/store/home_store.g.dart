// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeScreenStore on _HomeScreenStore, Store {
  final _$citiesResponseAtom = Atom(name: '_HomeScreenStore.citiesResponse');

  @override
  CountryCitiesResponse get citiesResponse {
    _$citiesResponseAtom.reportRead();
    return super.citiesResponse;
  }

  @override
  set citiesResponse(CountryCitiesResponse value) {
    _$citiesResponseAtom.reportWrite(value, super.citiesResponse, () {
      super.citiesResponse = value;
    });
  }

  final _$isLoadedAtom = Atom(name: '_HomeScreenStore.isLoaded');

  @override
  bool get isLoaded {
    _$isLoadedAtom.reportRead();
    return super.isLoaded;
  }

  @override
  set isLoaded(bool value) {
    _$isLoadedAtom.reportWrite(value, super.isLoaded, () {
      super.isLoaded = value;
    });
  }

  @override
  String toString() {
    return '''
citiesResponse: ${citiesResponse},
isLoaded: ${isLoaded}
    ''';
  }
}
