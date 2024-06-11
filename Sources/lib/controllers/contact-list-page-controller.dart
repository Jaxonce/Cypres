import 'package:cypres/data/DTOs/contact_dto.dart';
import 'package:cypres/model/contact_model.dart';
import 'package:cypres/model/user_model.dart';
import 'package:cypres/services/interfaces/user-service.dart';
import 'package:get_it/get_it.dart';

import '../model/message_model.dart';
import '../services/interfaces/contact_service.dart';
import '../services/interfaces/conversation_service.dart';

final GetIt _getIt = GetIt.instance;

class ContactListPageController {
  final UserService _userService = _getIt.get<UserService>();
  final ContactService _contactService = _getIt.get<ContactService>();
  final ConversationService _conversationService =
      _getIt.get<ConversationService>();

  Future<UserModel> connectUser() async =>
      UserModel.DTOToPOCO(await _userService.connect("vincent@gmail.com"));

  Future<MessageModel> getLastMessage(String contactId) async =>
      MessageModel.DTOToPOCO(
          await _conversationService.getLastMessage(contactId));

  Future<List<ContactModel>> getContacts() async {
    await connectUser();
    List<ContactModel> contactPOCOs = [];
    List<ContactDTO> contactDTOs = await _contactService.getContacts("");
    for (var element in contactDTOs) {
      contactPOCOs.add(ContactModel.DTOToPOCO(element));
    }
    return contactPOCOs;
  }
}
