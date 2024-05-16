import 'package:core_module/core_module.dart';

class AssistedEntity extends Entity {
  final String document;
  final String email;
  final String name;
  final String phone;
  final double latitude;
  final double longitude;

  AssistedEntity(
    super.id, {
    required this.email,
    required this.name,
    required this.document,
    required this.phone,
    required this.latitude,
    required this.longitude,
  });
}
