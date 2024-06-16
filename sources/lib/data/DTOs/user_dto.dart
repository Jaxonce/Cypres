import 'package:cypres/model/user_model.dart';

class UserDTO {
  String id;
  String firstname;
  String lastname;
  String? profilePictureBase64;
  String mailAddress;
  String password;

  UserDTO(this.id, this.firstname, this.lastname, this.profilePictureBase64,
      this.mailAddress, this.password);

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': String id,
        'firstName': String firstname,
        'lastName': String lastname,
        'image': String profilePictureBase64,
        'email': String email,
        'password': String password
      } =>
        UserDTO(id, firstname, lastname, profilePictureBase64, email,password),
      _ => throw const FormatException('Failed to get contact.'),
    };
  }

  Map<String, dynamic> toJson(UserDTO userDTO) {
    return {
      'email': userDTO.mailAddress,
      'password': userDTO.password,
      'firstName': userDTO.firstname,
      'lastName': userDTO.lastname,
      'image': userDTO.profilePictureBase64,
    };
  }

  factory UserDTO.POCOToDTO(UserModel POCO) {
    return UserDTO(POCO.id, POCO.firstname, POCO.lastname, POCO.profilePictureBytes.toString(), POCO.mailAddress, POCO.password);
  }
}
