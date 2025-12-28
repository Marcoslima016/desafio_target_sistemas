import 'package:desafio_target_sistemas/lib.exports.dart';
import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

part 'manage_records.store.g.dart';

class ManageRecordsStore = ManageRecordsStoreBase with _$ManageRecordsStore;

ManageRecordsStore get manageRecordsStore => ServiceLocator.I.get<ManageRecordsStore>();

abstract class ManageRecordsStoreBase with Store {
  @observable
  ObservableList<RecordedInfoStore> recordedItems = ObservableList<RecordedInfoStore>();

  @computed
  bool get hasEditingItem => recordedItems.where((e) => e.editing).isNotEmpty;

  @observable
  RecordedInfoStore? temporaryItemRecording;

  @observable
  bool isRecordingNewInfo = false;

  final newInfoInput = TextEditingController();
  final itemEditingInput = TextEditingController();

  ManageRecordsStoreBase() {
    newInfoInput.addListener(() => _handleTypingNewInfo());
    bump();
  }

  @action
  bump() {
    recordedItems.add(RecordedInfoStore(info: Information(value: "TESTE  1111111111111", registrationDate: DateTime.now())));
    recordedItems.add(RecordedInfoStore(info: Information(value: "TESTE  22222222222222", registrationDate: DateTime.now())));
    recordedItems.add(RecordedInfoStore(info: Information(value: "TESTE  33333333333333", registrationDate: DateTime.now())));
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  @action
  void _handleTypingNewInfo() {
    if (newInfoInput.text.isNotEmpty) {
      isRecordingNewInfo = true;

      final newInfo = Information(
        value: newInfoInput.text,
      );

      if (temporaryItemRecording == null) {
        temporaryItemRecording = RecordedInfoStore(
          isTemporary: true,
          info: newInfo,
        );
      } else {
        temporaryItemRecording!.info = newInfo;
      }
    } else {
      isRecordingNewInfo = false;
      temporaryItemRecording = null;
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  @action
  void onTapEditItem(RecordedInfoStore item) {
    item.editing = true;
    itemEditingInput.text = item.info.value;
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  @action
  void onTapCancelEdit(RecordedInfoStore item) {
    if (temporaryItemRecording == null) {
      item.editing = false;
      itemEditingInput.text = "";
    } else {
      isRecordingNewInfo = false;
      temporaryItemRecording = null;
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  @action
  Future<void> onTapSaveItem(RecordedInfoStore item) async {
    if (item.isTemporary) {
      await _registerNewItem(item);
    } else {
      final updatedInfo = item.info.copyWith(
        value: itemEditingInput.text,
      );
      item.info = updatedInfo;
      item.isTemporary = false;
      item.editing = false;
    }
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  @action
  Future<void> _registerNewItem(RecordedInfoStore item) async {
    item.editing = false;
    item.info.registrationDate = DateTime.now();
    recordedItems.add(item);
    isRecordingNewInfo = false;
    temporaryItemRecording = null;
    itemEditingInput.text = "";
  }

  // - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

  @action
  void onTapDeleteItem(RecordedInfoStore item) {
    recordedItems.removeWhere((e) => e.internalId == e.internalId);
  }
}
