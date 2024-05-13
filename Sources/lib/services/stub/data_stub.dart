

class DataStub {
  /*List<ConversationModel> _conversations = [
    ConversationModel(messageService, contact)
  ];*/

  static final DataStub _singleton = DataStub._internal();

  factory DataStub() {
    return _singleton;
  }

  DataStub._internal();
}
