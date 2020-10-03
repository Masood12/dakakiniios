// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'upload_image_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$UploadImageStore on _UploadImageStore, Store {
  final _$uploadImageModelAtom =
      Atom(name: '_UploadImageStore.uploadImageModel');

  @override
  UploadImageModel get uploadImageModel {
    _$uploadImageModelAtom.reportRead();
    return super.uploadImageModel;
  }

  @override
  set uploadImageModel(UploadImageModel value) {
    _$uploadImageModelAtom.reportWrite(value, super.uploadImageModel, () {
      super.uploadImageModel = value;
    });
  }

  final _$addShopPhotoAtom = Atom(name: '_UploadImageStore.addShopPhoto');

  @override
  AddShopPhoto get addShopPhoto {
    _$addShopPhotoAtom.reportRead();
    return super.addShopPhoto;
  }

  @override
  set addShopPhoto(AddShopPhoto value) {
    _$addShopPhotoAtom.reportWrite(value, super.addShopPhoto, () {
      super.addShopPhoto = value;
    });
  }

  final _$base64ImageAtom = Atom(name: '_UploadImageStore.base64Image');

  @override
  dynamic get base64Image {
    _$base64ImageAtom.reportRead();
    return super.base64Image;
  }

  @override
  set base64Image(dynamic value) {
    _$base64ImageAtom.reportWrite(value, super.base64Image, () {
      super.base64Image = value;
    });
  }

  final _$shopIDAtom = Atom(name: '_UploadImageStore.shopID');

  @override
  int get shopID {
    _$shopIDAtom.reportRead();
    return super.shopID;
  }

  @override
  set shopID(int value) {
    _$shopIDAtom.reportWrite(value, super.shopID, () {
      super.shopID = value;
    });
  }

  final _$ownerIDAtom = Atom(name: '_UploadImageStore.ownerID');

  @override
  int get ownerID {
    _$ownerIDAtom.reportRead();
    return super.ownerID;
  }

  @override
  set ownerID(int value) {
    _$ownerIDAtom.reportWrite(value, super.ownerID, () {
      super.ownerID = value;
    });
  }

  final _$photoAtom = Atom(name: '_UploadImageStore.photo');

  @override
  dynamic get photo {
    _$photoAtom.reportRead();
    return super.photo;
  }

  @override
  set photo(dynamic value) {
    _$photoAtom.reportWrite(value, super.photo, () {
      super.photo = value;
    });
  }

  @override
  String toString() {
    return '''
uploadImageModel: ${uploadImageModel},
addShopPhoto: ${addShopPhoto},
base64Image: ${base64Image},
shopID: ${shopID},
ownerID: ${ownerID},
photo: ${photo}
    ''';
  }
}
