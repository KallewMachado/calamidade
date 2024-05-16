import 'package:core_module/core_module.dart';

final class HomeInitial implements InitialState {}

final class HomeLoading implements LoadingState {}

final class HomeError<T extends BaseException> implements ErrorState {
  @override
  final T exception;
  HomeError(this.exception);
}

final class HomeSuccess<T> implements SuccessState {
  @override
  final T data;
  const HomeSuccess({required this.data});
}
