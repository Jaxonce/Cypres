import '../../data/DTOs/contact_dto.dart';

abstract class ContactService {
  ContactDTO getContact(String id);
}
