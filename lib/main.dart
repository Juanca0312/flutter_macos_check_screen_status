import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screen_sleep_macos/event_channels.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: NewWidget(),
        ),
      ),
    );
  }
}

class NewWidget extends StatefulWidget {
  const NewWidget({
    super.key,
  });

  @override
  State<NewWidget> createState() => _NewWidgetState();
}

class _NewWidgetState extends State<NewWidget> with WidgetsBindingObserver {
  static const MethodChannel _channel = MethodChannel('com.example.app/sleep');

  @override
  void initState() {
    super.initState();

    _channel.setMethodCallHandler((call) async {
      if (call.method == 'didSleep') {
        print('Received sleep notification from native code');
        // Aquí puedes realizar acciones adicionales en respuesta a la notificación
      }
    });
  }

  @override
  void dispose() {
    _channel.setMethodCallHandler(null);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text('Hello World!');
  }
}
