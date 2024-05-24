class UserDTO {
  String id;
  String firstname;
  String lastname;
  String? profilePictureBase64;
  String mailAddress;

  UserDTO(this.id, this.firstname, this.lastname, this.profilePictureBase64,
      this.mailAddress);
}
