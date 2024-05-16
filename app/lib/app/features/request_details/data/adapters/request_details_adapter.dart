import 'package:coopartilhar/app/features/request_details/entities/request_details_entity.dart';
import 'package:coopartilhar/app/features/request_details/data/adapters/status_details_adapter.dart';

class RequestDetailsAdapter {
  static RequestDetailsEntity fromJson(Map<String, dynamic> map) {
    return RequestDetailsEntity(
      id: map['id'],
      //TODO: user deserialization
      //user: UserEntity.fromJson(map['user'])
      user: map['user'],
      title: map['title'],
      price: map['price'],
      status: StatusDetailsAdapter.fromJson(map['status']),
      createdAt: DateTime.parse(map['created_at']),
    );
  }
}
