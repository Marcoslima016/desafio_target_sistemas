import 'package:desafio_target_sistemas/lib.exports.dart';
import 'package:mobx/mobx.dart';

part 'recorded_info.store.g.dart';

class RecordedInfoStore = RecordedInfoStoreBase with _$RecordedInfoStore;

abstract class RecordedInfoStoreBase with Store {
  //
  late final int internalId;

  @observable
  Information info;

  @observable
  bool editing = false;

  @observable
  bool isTemporary;

  RecordedInfoStoreBase({
    required this.info,
    this.isTemporary = false,
  }) {
    internalId = DateTime.now().microsecondsSinceEpoch;
  }
}
