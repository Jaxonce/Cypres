import 'package:cypres/model/member_model.dart';

class UserModel extends MemberModel {
  String mailAddress;

  UserModel(this.mailAddress, id, firstname, lastname, profilePictureBase64)
      : super(id, firstname, lastname, profilePictureBase64);
}
