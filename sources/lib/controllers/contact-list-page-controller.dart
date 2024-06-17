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
  static ContactListPageController? _instance;

  final UserService _userService = _getIt.get<UserService>();
  final ContactService _contactService = _getIt.get<ContactService>();
  final ConversationService _conversationService =
      _getIt.get<ConversationService>();

  ContactListPageController._internal();

  factory ContactListPageController() {
    _instance ??= ContactListPageController._internal();
    return _instance!;
  }

  static ContactListPageController? getInstance() => _instance;

  static void resetInstance() {
    _instance = null;
  }

  // Future<UserModel> connectUser() async =>
  //     UserModel.DTOToPOCO(await _userService.connect("test@gmail.com"));

  Future<UserModel?> getUserConnected() async => await UserModel.getInstance();

  Future<UserModel> connectUser() async =>
      UserModel.DTOToPOCO(await _userService.connect("vincent@gmail.com"));

  Future<MessageModel> getLastMessage(String contactId) async =>
      MessageModel.DTOToPOCO(
          await _conversationService.getLastMessage(contactId));

  Future<List<ContactModel>> getContacts() async {
    UserModel? user = await getUserConnected();
    List<ContactModel> contactPOCOs = [];
    List<ContactDTO> contactDTOs = await _contactService.getContacts("");
    for (var element in contactDTOs) {
      contactPOCOs.add(ContactModel.DTOToPOCO(element));
    }
    return contactPOCOs;
  }
}
