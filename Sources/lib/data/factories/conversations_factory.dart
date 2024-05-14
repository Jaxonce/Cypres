import 'package:get_it/get_it.dart';
import 'package:test_flutter_vue/data/DTOs/contact_dto.dart';
import 'package:test_flutter_vue/data/factories/contacts_factory.dart';
import 'package:test_flutter_vue/data/factories/messages_factory.dart';
import 'package:test_flutter_vue/model/conversation_model.dart';
import 'package:test_flutter_vue/services/interfaces/message_service.dart';

import '../../services/interfaces/contact_service.dart';
import '../DTOs/conversation_dto.dart';

final GetIt getIt = GetIt.instance;

class ConversationsFactory {
  static ConversationModel DTOToPOCO(ConversationDTO DTO) {
    ContactDTO contactDTO =
        getIt.get<ContactService>().getContact(DTO.contactId);

    return ConversationModel(
        ContactsFactory.DTOToPOCO(contactDTO),
        MessagesFactory.DTOsToPOCOs(
            getIt.get<MessageService>().getMessages(contactDTO)));
  }

  static List<ConversationModel> DTOsToPOCOs(List<ConversationDTO> DTOs) {
    List<ConversationModel> pocos = [];
    for (var e in DTOs) {
      pocos.add(DTOToPOCO(e));
    }

    return pocos;
  }
}
