import 'dart:convert';
import 'dart:typed_data';

abstract class MemberModel {
  final String id;
  final String firstname;
  final String lastname;
  Uint8List? profilePictureBytes;

  MemberModel(
      this.id, this.firstname, this.lastname, String? profilePictureBase64) {
    profilePictureBytes = profilePictureBase64 != null
        ? base64Decode(profilePictureBase64)
        : null;
  }
}
