import 'package:cypres/model/member_model.dart';

import '../data/DTOs/user_dto.dart';

class UserModel extends MemberModel {
  static UserModel? _instance;
  String mailAddress;
  String password;

  UserModel._internal(
      this.mailAddress, id, firstname, lastname, profilePictureBase64, this.password)
      : super(id, firstname, lastname, profilePictureBase64);

  factory UserModel(String mailAddress, String id, String firstname,
      String lastname, String? profilePictureBase64, String password) {
    _instance ??= UserModel._internal(
        mailAddress, id, firstname, lastname, profilePictureBase64, password);
    return _instance!;
  }

  static UserModel? getInstance() => _instance;

  static void resetInstance() {
    _instance = null;
  }

  factory UserModel.DTOToPOCO(UserDTO DTO) => UserModel(DTO.mailAddress, DTO.id,
      DTO.firstname, DTO.lastname, DTO.profilePictureBase64, DTO.password);
}
