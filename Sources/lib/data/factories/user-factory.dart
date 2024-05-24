import 'package:cypres/data/DTOs/user_dto.dart';
import 'package:cypres/model/user_model.dart';

class UserFactory {
  static UserModel DTOToPOCO(UserDTO DTO) => UserModel(DTO.mailAddress, DTO.id,
      DTO.firstname, DTO.lastname, DTO.profilePictureBase64);
}
