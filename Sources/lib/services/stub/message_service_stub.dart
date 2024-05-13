import 'package:test_flutter_vue/model/contact_model.dart';
import 'package:test_flutter_vue/model/message_model.dart';
import 'package:test_flutter_vue/services/interfaces/message_service.dart';

import 'data_stub.dart';

class MessageServiceStub implements MessageService {
  final DataStub dataStub;

  MessageServiceStub(this.dataStub);

  @override
  void sendMessage(MessageModel m) {
    // TODO: implement sendMessage
  }

  @override
  List<MessageModel> getMessages(ContactModel c) {
    // TODO: implement getMessages
    throw UnimplementedError();
  }
}
