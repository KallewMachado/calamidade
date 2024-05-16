import 'package:coopartilhar/app/features/auth/data/repositories/i_auth_repository.dart';
import 'package:coopartilhar/app/features/auth/entities/credentials_entity.dart';
import 'package:core_module/core_module.dart';

class LoginControllerImpl<AuthState> extends BaseController {
  LoginControllerImpl({
    required this.repository,
  }) : super(InitialState());

  final IAuthRepository repository;

  Future<void> login({
    required String phone,
    required String password,
  }) async {
    update(LoadingState());

    final credentials = CredentialsEntity(
      phone: phone.trim().toLowerCase(),
      password: password.trim(),
    );

    final result = await repository.login(credentials: credentials);

    final newState = result.fold(
      (error) => ErrorState<BaseException>(exception: error),
      (success) => SuccessState(data: success),
    );

    // set state
    update(newState);
  }
}
