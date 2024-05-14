import 'package:test_flutter_vue/data/DTOs/contact_dto.dart';

import '../interfaces/contact_service.dart';
import 'base_stub.dart';

class ContactServiceStub extends BaseStub implements ContactService {
  @override
  ContactDTO getContact(String id) =>
      stub().contacts.singleWhere((c) => c.id == id);
}
