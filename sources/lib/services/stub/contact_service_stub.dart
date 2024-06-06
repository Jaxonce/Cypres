import 'package:cypres/data/DTOs/contact_dto.dart';

import '../interfaces/contact_service.dart';
import 'base_stub.dart';

class ContactServiceStub extends BaseStub implements ContactService {
  @override
  Future<List<ContactDTO>> getContacts(String sort) async =>
      stub().contacts.where((element) => element.id == sort).toList();
}
