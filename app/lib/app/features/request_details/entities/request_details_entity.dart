import 'package:coopartilhar/app/features/auth/entities/user_entity.dart';
import 'package:coopartilhar/app/features/request_details/entities/status_details_entity.dart';
import 'package:core_module/core_module.dart';

class RequestDetailsEntity extends Entity {
  final String title;
  final UserEntity user;
  final DateTime createdAt;
  final double price;
  final StatusDetailsEntity status;

  RequestDetailsEntity({
    required String id,
    required this.title,
    required this.user,
    required this.createdAt,
    required this.price,
    required this.status,
  }) : super(id);
}
