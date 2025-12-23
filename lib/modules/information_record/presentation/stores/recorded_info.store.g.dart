// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recorded_info.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RecordedInfoStore on RecordedInfoStoreBase, Store {
  late final _$infoAtom = Atom(name: 'RecordedInfoStoreBase.info', context: context);

  @override
  Information get info {
    _$infoAtom.reportRead();
    return super.info;
  }

  @override
  set info(Information value) {
    _$infoAtom.reportWrite(value, super.info, () {
      super.info = value;
    });
  }

  late final _$editingAtom = Atom(name: 'RecordedInfoStoreBase.editing', context: context);

  @override
  bool get editing {
    _$editingAtom.reportRead();
    return super.editing;
  }

  @override
  set editing(bool value) {
    _$editingAtom.reportWrite(value, super.editing, () {
      super.editing = value;
    });
  }

  late final _$isTemporaryAtom = Atom(name: 'RecordedInfoStoreBase.isTemporary', context: context);

  @override
  bool get isTemporary {
    _$isTemporaryAtom.reportRead();
    return super.isTemporary;
  }

  @override
  set isTemporary(bool value) {
    _$isTemporaryAtom.reportWrite(value, super.isTemporary, () {
      super.isTemporary = value;
    });
  }

  @override
  String toString() {
    return '''
info: ${info},
editing: ${editing},
isTemporary: ${isTemporary}
    ''';
  }
}
