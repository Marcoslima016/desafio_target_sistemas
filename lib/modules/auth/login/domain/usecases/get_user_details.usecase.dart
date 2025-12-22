import '../../../auth.exports.dart';

abstract class IGetUserDetails {
  Future<User> call({required String userId});
}

class GetUserDetails implements IGetUserDetails {
  final ILoginRepository loginRepository;

  GetUserDetails({
    required this.loginRepository,
  });

  @override
  Future<User> call({required String userId}) async {
    try {
      return await loginRepository.getUserDetails(userId: userId);
    } catch (e) {
      // TODO: REVISAR TRATAMENTO DE FALHA
      rethrow;
    }
  }
}
