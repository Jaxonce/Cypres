import '../../data/DTOs/contact_dto.dart';

abstract class ContactService {
  List<ContactDTO> getContacts(String sort);

  Future<ContactDTO> getContact(String sort);
}
