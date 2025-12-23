import 'package:desafio_target_sistemas/lib.exports.dart';

abstract class IInformationRecordedInfoStoreRepository {
  Future<List<Information>> fetchRecordedInfoStoreList();
  Future<void> saveNewRecordedInfoStore({required Information info});
}
