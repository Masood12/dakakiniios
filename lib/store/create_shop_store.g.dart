// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_shop_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$CreateShopStore on _CreateShopStore, Store {
  final _$citiesResponseAtom = Atom(name: '_CreateShopStore.citiesResponse');

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

  final _$isLoadedAtom = Atom(name: '_CreateShopStore.isLoaded');

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

  final _$countiresListAtom = Atom(name: '_CreateShopStore.countiresList');

  @override
  List<Datum> get countiresList {
    _$countiresListAtom.reportRead();
    return super.countiresList;
  }

  @override
  set countiresList(List<Datum> value) {
    _$countiresListAtom.reportWrite(value, super.countiresList, () {
      super.countiresList = value;
    });
  }

  @override
  String toString() {
    return '''
citiesResponse: ${citiesResponse},
isLoaded: ${isLoaded},
countiresList: ${countiresList}
    ''';
  }
}
