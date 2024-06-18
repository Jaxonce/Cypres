import 'package:cypres/data/DTOs/message_dto.dart';
import 'package:cypres/model/contact_model.dart';
import 'package:cypres/services/interfaces/message_service.dart';
import 'package:get_it/get_it.dart';

import '../data/DTOs/conversation_dto.dart';
import 'message_model.dart';

final GetIt _getIt = GetIt.instance;

class ConversationModel {
  ContactModel contact;
  List<MessageModel> messages;

  ConversationModel(this.contact, this.messages);

  Future<void> getMessages(String convId) async{
    MessageService messageService = _getIt.get<MessageService>();
    List<MessageDTO> dtos = [];
    dtos = await messageService.getMessages(convId);
    for (var element in dtos) {
      messages.add(MessageModel.DTOToPOCO(element));
    }
  }

  factory ConversationModel.DTOToPOCO(
      ConversationDTO DTO, ContactModel contact) {
    MessageService messageService = _getIt.get<MessageService>();
    List<MessageModel> pocos = [];

    return ConversationModel(contact, pocos);
  }


}
