import 'package:coopartilhar/app/features/auth/entities/credentials_entity.dart';
import 'package:core_module/core_module.dart';

abstract class IAuthRepository {
  Future<Output<void>> login({required CredentialsEntity credentials});
}
