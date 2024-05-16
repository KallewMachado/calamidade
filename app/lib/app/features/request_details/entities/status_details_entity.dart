import 'package:core_module/core_module.dart';

enum Status {
  low('Baixa'),
  medium('Média'),
  high('Alta'),
  notDefined('Não definido');

  final String label;

  const Status(this.label);

  static Status fromId(int id) {
    switch (id) {
      case 1:
        return Status.low;
      case 2:
        return Status.medium;
      case 3:
        return Status.high;
      default:
        return Status.notDefined;
    }
  }
}

class StatusDetailsEntity extends Entity {
  final Status status;
  final String description;

  StatusDetailsEntity(super.id, this.status, this.description);
}
