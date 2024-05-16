import 'package:coopartilhar/app/features/check_affiliated/entities/check_affiliated_entity.dart';
import 'package:core_module/core_module.dart';

abstract class ICheckAffiliatedRepository {
  Future<Output<CheckAffiliatedEntity>> check(String document);
}
