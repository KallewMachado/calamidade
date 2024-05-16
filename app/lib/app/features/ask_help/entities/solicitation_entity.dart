import 'package:core_module/core_module.dart';

class SolicitationEntity extends Entity {
  final String title;
  final String cpf;
  final String? pix;
  final String? bank;
  final String? agency;
  final String? account;
  final int value;
  final List<int> file;
  final String? description;

  SolicitationEntity({
    required String id,
    required this.title,
    required this.cpf,
    this.pix,
    this.bank,
    this.agency,
    this.account,
    required this.value,
    required this.file,
    this.description,
  }) : super(id);
}
