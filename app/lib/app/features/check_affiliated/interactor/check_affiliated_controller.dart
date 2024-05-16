import 'package:coopartilhar/app/features/check_affiliated/data/i_check_affiliated_repository.dart';
import 'package:coopartilhar/app/features/check_affiliated/entities/check_affiliated_entity.dart';
import 'package:core_module/core_module.dart';

class CheckAffiliatedController extends BaseController {
  final ICheckAffiliatedRepository repository;

  CheckAffiliatedController({required this.repository}) : super(InitialState());

  Future<void> check({required String document}) async {
    update(LoadingState());

    final response = await repository.check(document);

    response.fold(
      (l) => update(ErrorState(exception: l)),
      (r) => update(SuccessState<CheckAffiliatedEntity>(data: r)),
    );
  }
}
