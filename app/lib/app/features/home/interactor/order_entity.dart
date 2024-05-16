import 'package:core_module/core_module.dart';

class OrderEntity extends Entity {
  final double value;
  final String title, helpedName, description, localName;
  final DateTime date;

  OrderEntity(
      {required this.value,
      required this.title,
      required this.helpedName,
      required this.description,
      required this.localName,
      required this.date,
      required String id})
      : super(id);
}
