import 'package:cypres/data/factories/user-factory.dart';
import 'package:cypres/services/interfaces/message_service.dart';
import 'package:cypres/services/interfaces/user-service.dart';
import 'package:get_it/get_it.dart';

import '../model/user_model.dart';

final GetIt _getIt = GetIt.instance;

class MessagePageController {
  final MessageService _messageService = _getIt.get<MessageService>();
  final UserService _userService = _getIt.get<UserService>();

  UserModel connectUser() =>
      UserFactory.DTOToPOCO(_userService.connect("km1@gmail.com"));
}
