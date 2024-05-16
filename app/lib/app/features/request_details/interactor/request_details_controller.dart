import 'package:coopartilhar/app/features/request_details/data/i_request_details_repository.dart';
import 'package:coopartilhar/app/features/request_details/entities/request_details_entity.dart';
import 'package:core_module/core_module.dart';

class RequestDetailsController extends BaseController {
  final IRequestDetailsRepository repository;

  RequestDetailsController(this.repository) : super(InitialState());

  Future<void> loadRequestDetails({required String id}) async {
    update(LoadingState());
    final response = await repository.getRequestById(id);

    response.fold(
      (l) => update(ErrorState(exception: l)),
      (r) => update(SuccessState<RequestDetailsEntity>(data: r)),
    );
  }
}
