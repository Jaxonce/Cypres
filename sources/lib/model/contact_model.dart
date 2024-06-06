import 'package:cypres/model/member_model.dart';

import '../data/DTOs/contact_dto.dart';

class ContactModel extends MemberModel {
  ContactModel(id, firstname, lastname, profilePictureBase64)
      : super(id, firstname, lastname, profilePictureBase64);

  factory ContactModel.DTOToPOCO(ContactDTO DTO) => ContactModel(
      DTO.id, DTO.firstname, DTO.lastname, DTO.profilePictureBase64);
}
