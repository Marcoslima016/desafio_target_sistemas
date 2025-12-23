// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'manage_records.store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ManageRecordsStore on ManageRecordsStoreBase, Store {
  Computed<bool>? _$hasEditingItemComputed;

  @override
  bool get hasEditingItem =>
      (_$hasEditingItemComputed ??= Computed<bool>(() => super.hasEditingItem, name: 'ManageRecordsStoreBase.hasEditingItem')).value;

  late final _$recordedItemsAtom = Atom(name: 'ManageRecordsStoreBase.recordedItems', context: context);

  @override
  ObservableList<RecordedInfoStore> get recordedItems {
    _$recordedItemsAtom.reportRead();
    return super.recordedItems;
  }

  @override
  set recordedItems(ObservableList<RecordedInfoStore> value) {
    _$recordedItemsAtom.reportWrite(value, super.recordedItems, () {
      super.recordedItems = value;
    });
  }

  late final _$temporaryItemRecordingAtom = Atom(name: 'ManageRecordsStoreBase.temporaryItemRecording', context: context);

  @override
  RecordedInfoStore? get temporaryItemRecording {
    _$temporaryItemRecordingAtom.reportRead();
    return super.temporaryItemRecording;
  }

  @override
  set temporaryItemRecording(RecordedInfoStore? value) {
    _$temporaryItemRecordingAtom.reportWrite(value, super.temporaryItemRecording, () {
      super.temporaryItemRecording = value;
    });
  }

  late final _$isRecordingNewInfoAtom = Atom(name: 'ManageRecordsStoreBase.isRecordingNewInfo', context: context);

  @override
  bool get isRecordingNewInfo {
    _$isRecordingNewInfoAtom.reportRead();
    return super.isRecordingNewInfo;
  }

  @override
  set isRecordingNewInfo(bool value) {
    _$isRecordingNewInfoAtom.reportWrite(value, super.isRecordingNewInfo, () {
      super.isRecordingNewInfo = value;
    });
  }

  late final _$onTapSaveItemAsyncAction = AsyncAction('ManageRecordsStoreBase.onTapSaveItem', context: context);

  @override
  Future<void> onTapSaveItem(RecordedInfoStore item) {
    return _$onTapSaveItemAsyncAction.run(() => super.onTapSaveItem(item));
  }

  late final _$_registerNewItemAsyncAction = AsyncAction('ManageRecordsStoreBase._registerNewItem', context: context);

  @override
  Future<void> _registerNewItem(RecordedInfoStore item) {
    return _$_registerNewItemAsyncAction.run(() => super._registerNewItem(item));
  }

  late final _$ManageRecordsStoreBaseActionController = ActionController(name: 'ManageRecordsStoreBase', context: context);

  @override
  dynamic bump() {
    final _$actionInfo = _$ManageRecordsStoreBaseActionController.startAction(name: 'ManageRecordsStoreBase.bump');
    try {
      return super.bump();
    } finally {
      _$ManageRecordsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void _handleTypingNewInfo() {
    final _$actionInfo = _$ManageRecordsStoreBaseActionController.startAction(name: 'ManageRecordsStoreBase._handleTypingNewInfo');
    try {
      return super._handleTypingNewInfo();
    } finally {
      _$ManageRecordsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onTapEditItem(RecordedInfoStore item) {
    final _$actionInfo = _$ManageRecordsStoreBaseActionController.startAction(name: 'ManageRecordsStoreBase.onTapEditItem');
    try {
      return super.onTapEditItem(item);
    } finally {
      _$ManageRecordsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void onTapDeleteItem(RecordedInfoStore item) {
    final _$actionInfo = _$ManageRecordsStoreBaseActionController.startAction(name: 'ManageRecordsStoreBase.onTapDeleteItem');
    try {
      return super.onTapDeleteItem(item);
    } finally {
      _$ManageRecordsStoreBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
recordedItems: ${recordedItems},
temporaryItemRecording: ${temporaryItemRecording},
isRecordingNewInfo: ${isRecordingNewInfo},
hasEditingItem: ${hasEditingItem}
    ''';
  }
}
