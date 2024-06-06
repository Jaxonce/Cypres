class ContactDTO {
  String id;
  String firstname;
  String lastname;
  String? profilePictureBase64;

  ContactDTO(this.id, this.firstname, this.lastname, this.profilePictureBase64);

  factory ContactDTO.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'id': String id,
        'firstName': String firstname,
        'lastName': String lastname,
        'image': String profilePictureBase64,
      } =>
        ContactDTO(id, firstname, lastname, profilePictureBase64),
      _ => throw const FormatException('Failed to get contact.'),
    };
  }
}
