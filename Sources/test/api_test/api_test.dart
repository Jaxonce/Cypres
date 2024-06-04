import 'package:cypres/data/DTOs/contact_dto.dart';
import 'package:cypres/services/api/contact_service_api.dart';
import 'package:cypres/services/interfaces/contact_service.dart';
import 'package:get_it/get_it.dart';

final GetIt _getIt = GetIt.instance;

Future<void> main() async {
  _getIt.registerSingleton<ContactService>(ContactServiceApi());

  List<ContactDTO> contactsDTO =
      await _getIt.get<ContactService>().getContacts("test@gmail.com");

  contactsDTO.forEach((element) {
    print('Contact: ${element.firstname} ${element.lastname}');
  });
}
