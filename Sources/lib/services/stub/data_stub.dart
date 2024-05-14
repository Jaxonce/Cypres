import 'package:test_flutter_vue/data/DTOs/contact_dto.dart';
import 'package:test_flutter_vue/data/DTOs/message_dto.dart';

import '../../data/DTOs/conversation_dto.dart';

class DataStub {
  List<ConversationDTO> conversations = [
    ConversationDTO('1001'),
    ConversationDTO('1002'),
    ConversationDTO('1003'),
    ConversationDTO('1004')
  ];

  List<ContactDTO> contacts = [
    ContactDTO('1001', 'Maxence', null),
    ContactDTO('1002', 'Felix', null),
    ContactDTO('1003', 'Vincent', null),
    ContactDTO('1004', 'Axel', null)
  ];

  List<MessageDTO> messages = [
    MessageDTO('Hello world', DateTime.now(), '1000', '1001'),
    MessageDTO('Bienvenue', DateTime.now(), '1001', '1000'),
    MessageDTO('Hola', DateTime.now(), '1000', '1001'),
    MessageDTO('Halo', DateTime.now(), '1000', '1001')
  ];
}
