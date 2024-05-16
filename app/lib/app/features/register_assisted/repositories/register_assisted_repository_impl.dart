import 'package:coopartilhar/app/features/register_assisted/entities/assisted_entity.dart';
import 'package:coopartilhar/app/features/register_assisted/repositories/i_register_assisted_repository.dart';
import 'package:core_module/core_module.dart';

class RegisterAssistedRepositoryImpl extends IRegisterAssistedRepository {
  RegisterAssistedRepositoryImpl({
    required this.client,
  });

  final IRestClient client;

  @override
  Future<Output<AssistedEntity>> register({
    required AssistedEntity assisted,
  }) {
    // TODO: implement register
    throw UnimplementedError();
  }
}
