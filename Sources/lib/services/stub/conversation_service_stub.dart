import 'package:test_flutter_vue/services/stub/base_stub.dart';

import '../../data/DTOs/conversation_dto.dart';
import '../interfaces/conversation_service.dart';

class ConversationServiceStub extends BaseStub implements ConversationService {
  @override
  List<ConversationDTO> getConversations() => stub().conversations;
}
