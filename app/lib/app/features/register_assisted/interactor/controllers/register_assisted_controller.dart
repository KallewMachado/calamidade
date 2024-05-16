import 'package:coopartilhar/app/features/register_assisted/entities/assisted_entity.dart';
import 'package:coopartilhar/app/features/register_assisted/repositories/i_register_assisted_repository.dart';
import 'package:core_module/core_module.dart';

class RegisterAssistedController extends BaseController {
  final IRegisterAssistedRepository repository;

  RegisterAssistedController({required this.repository})
      : super(InitialState());

  Future<void> register({required AssistedEntity assisted}) async {
    update(LoadingState());

    final response = await repository.register(assisted: assisted);

    response.fold(
      (left) => update(ErrorState(exception: left)),
      (right) => update(SuccessState<AssistedEntity>(data: right)),
    );
  }

  String? emailValidator(String? text) =>
      ValidatorsHelper.emailIsValid(text) ? null : 'E-mail inválido';

  String? nameValidator(String? text) =>
      (text?.isNotEmpty ?? false) ? null : 'Nome inválido';

  String? documentValidator(String? text) =>
      ValidatorsHelper.documentIsValid(text) ? null : 'Documento inválido';

  String? phoneValidator(String? text) =>
      ValidatorsHelper.phoneIsValid(text) ? null : 'Telefone inválido';
}
