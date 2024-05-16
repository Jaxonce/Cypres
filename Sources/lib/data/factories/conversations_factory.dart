import 'package:cypres/data/DTOs/contact_dto.dart';
import 'package:cypres/data/factories/contacts_factory.dart';
import 'package:cypres/data/factories/messages_factory.dart';
import 'package:cypres/model/conversation_model.dart';
import 'package:cypres/services/interfaces/message_service.dart';
import 'package:get_it/get_it.dart';

import '../../services/interfaces/contact_service.dart';
import '../DTOs/conversation_dto.dart';

final GetIt _getIt = GetIt.instance;

class ConversationsFactory {
  static ConversationModel DTOToPOCO(ConversationDTO DTO) {
    ContactDTO contactDTO =
        _getIt.get<ContactService>().getContact(DTO.contactId);

    return ConversationModel(
        ContactsFactory.DTOToPOCO(contactDTO),
        MessagesFactory.DTOsToPOCOs(
            _getIt.get<MessageService>().getMessages(contactDTO)));
  }

  static List<ConversationModel> DTOsToPOCOs(List<ConversationDTO> DTOs) {
    List<ConversationModel> pocos = [];
    for (var e in DTOs) {
      pocos.add(DTOToPOCO(e));
    }

    return pocos;
  }
}
