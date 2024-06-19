import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:signalr_netcore/signalr_client.dart';

abstract class Observer {
  void notifyChange();
}

class SignalRService {
  static SignalRService? _instance;
  List<Observer> observers = [];

  String? serverUrl;
  HubConnection? hubConnection;

  SignalRService._internal(String userId) {
    serverUrl = '${dotenv.env['HOST']}/chatHub?userId=$userId';
    if (serverUrl != null) {
      hubConnection = HubConnectionBuilder().withUrl(serverUrl!).build();
      hubConnection!.onclose((error) => print("Connection Closed"));
      hubConnection!.on("ReceiveMessage", _handleReceiveMessage);
      hubConnection!.on("SendMessage", _handleSendMessage);
    }
  }

  void _handleReceiveMessage(List<dynamic>? parameters) {
    for (var element in observers) {
      element.notifyChange();
    }
  }

  void _handleSendMessage(List<dynamic>? parameters) {
    sleep(const Duration(seconds: 1));
    for (var element in observers) {
      element.notifyChange();
    }
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
