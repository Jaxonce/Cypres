import 'package:cypres/model/contact_model.dart';
import 'package:cypres/services/interfaces/user-service.dart';
import 'package:get_it/get_it.dart';

import '../model/conversation_model.dart';
import '../services/interfaces/conversation_service.dart';
import '../model/user_model.dart';

final GetIt _getIt = GetIt.instance;

class MessagePageController {
  final ConversationService _conversationService =
      _getIt.get<ConversationService>();
  final UserService _userService = _getIt.get<UserService>();
  final UserModel? _user = UserModel.getInstance();

  Future<ConversationModel?> getConversation(ContactModel contact) async {
    return ConversationModel.DTOToPOCO(
        await _conversationService.getConversation(contact.id), contact);
  }
  // Future<UserModel> connectUser() async =>
  //     UserModel.DTOToPOCO(await _userService.connect("km1@gmail.com"));

  UserModel? getUserConnected() => _user;
}
