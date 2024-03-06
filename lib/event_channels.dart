import 'package:flutter/services.dart';

const eventChannel = EventChannel('com.example.app/sleepEvent');

class SleepEventHandler {
  static void Function(String)? onSleep;

  static void startListening() {
    eventChannel.receiveBroadcastStream().listen((event) {
      if (onSleep != null) {
        onSleep!(event);
      }
    });
  }
}
