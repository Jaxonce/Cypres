import '../../model/contact_model.dart';
import '../DTOs/contact_dto.dart';

class ContactsFactory {
  static ContactModel DTOToPOCO(ContactDTO DTO) =>
      ContactModel(DTO.id, DTO.name, DTO.profilePictureBase64);

  static List<ContactModel> DTOsToPOCOs(List<ContactDTO> DTOs) {
    List<ContactModel> pocos = [];
    for (var e in DTOs) {
      pocos.add(DTOToPOCO(e));
    }

    return pocos;
  }
}
