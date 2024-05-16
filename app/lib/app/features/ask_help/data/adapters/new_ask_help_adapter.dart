import 'package:coopartilhar/app/features/ask_help/entities/solicitation_entity.dart';

class NewAskHelpAdapter {
  static Map<String, dynamic> toJson(SolicitationEntity solicitationEntity) {
    return {
      'id': solicitationEntity.id,
      'title': solicitationEntity.title,
      'cpf': solicitationEntity.cpf,
      'pix': solicitationEntity.pix,
      'bank': solicitationEntity.bank,
      'agency': solicitationEntity.agency,
      'account': solicitationEntity.account,
      'value': solicitationEntity.value,
      'file': solicitationEntity.file,
      'description': solicitationEntity.description,
    };
  }
}

