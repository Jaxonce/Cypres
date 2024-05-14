class UserDTO {
  String id;
  String name;
  String? profilePictureBase64;
  String mailAddress;

  UserDTO(this.id, this.name, this.profilePictureBase64, this.mailAddress);
}
