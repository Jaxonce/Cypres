import '../../data/DTOs/contact_dto.dart';

abstract class ContactService {
  Future<List<ContactDTO>> getContacts(String sort);
}
