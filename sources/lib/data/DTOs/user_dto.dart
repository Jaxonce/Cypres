class UserDTO {
  String id;
  String firstname;
  String lastname;
  String? profilePictureBase64;
  String mailAddress;

  UserDTO(this.id, this.firstname, this.lastname, this.profilePictureBase64,
      this.mailAddress);

  factory UserDTO.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': String id,
        'firstName': String firstname,
        'lastName': String lastname,
        'image': String profilePictureBase64,
        'email': String email
      } =>
        UserDTO(id, firstname, lastname, profilePictureBase64, email),
      _ => throw const FormatException('Failed to get contact.'),
    };
  }
}
