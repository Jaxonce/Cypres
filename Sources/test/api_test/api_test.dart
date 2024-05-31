import 'package:cypres/data/DTOs/contact_dto.dart';
import 'package:cypres/services/api/contact_service_api.dart';
import 'package:cypres/services/interfaces/contact_service.dart';
import 'package:get_it/get_it.dart';

final GetIt _getIt = GetIt.instance;

Future<void> main() async {
  _getIt.registerSingleton<ContactService>(ContactServiceApi());

  ContactDTO contactDTO =
      await _getIt.get<ContactService>().getContact("test@gmail.com");

  print('Contact: ${contactDTO.firstname} ${contactDTO.lastname}');
}
