import 'package:test_flutter_vue/model/conversation_model.dart';
import 'package:test_flutter_vue/services/stub/data_stub.dart';

import '../interfaces/conversation_service.dart';

class ConversationServiceStub implements ConversationService {
  final DataStub dataStub;

  ConversationServiceStub(this.dataStub);

  @override
  List<ConversationModel> getConversation() {
    // TODO: implement getConversation
    throw UnimplementedError();
  }
}
