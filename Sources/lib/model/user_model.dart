import 'package:test_flutter_vue/model/member_model.dart';

class UserModel extends MemberModel {
  String mailAddress;

  UserModel(this.mailAddress, id, name, profilePictureBase64)
      : super(id, name, profilePictureBase64);
}
