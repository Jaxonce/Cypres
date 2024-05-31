import 'package:cypres/data/DTOs/contact_dto.dart';

import '../interfaces/contact_service.dart';
import 'base_stub.dart';

class ContactServiceStub extends BaseStub implements ContactService {
  @override
  List<ContactDTO> getContacts(String sort) => stub().contacts;

  @override
  Future<ContactDTO> getContact(String sort) async =>
      stub().contacts.firstWhere((element) => element.id == sort);
}
