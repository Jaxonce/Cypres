import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:signalr_netcore/signalr_client.dart';

class SignalRService {
  static SignalRService? _instance;

  String? serverUrl;
  HubConnection? hubConnection;

  SignalRService._internal(String userId) {
    serverUrl = '${dotenv.env['HOST']}/chatHub?userId=$userId';
    print(serverUrl);
    if (serverUrl != null) {
      hubConnection = HubConnectionBuilder().withUrl(serverUrl!).build();
      hubConnection?.on("ReceiveMessage", _handleReceiveMessage);
    }
  }

  void _handleReceiveMessage(List<dynamic>? parameters) {
    print("Message received from ${parameters?[0] as String}");
  }

  factory SignalRService(String userId) {
    _instance ??= SignalRService._internal(userId);
    return _instance!;
  }

  static SignalRService? getInstance() => _instance;

  static void resetInstance() {
    _instance = null;
  }
}