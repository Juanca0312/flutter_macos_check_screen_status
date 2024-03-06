# Flutter Screen Status Checker for macOS

This project implements a method channel in Flutter to check if the screen is in sleep mode or locked on macOS.

## Usage
```
  static const MethodChannel _channel = MethodChannel('com.example.app/sleep');

  @override
  void initState() {
    super.initState();

    _channel.setMethodCallHandler((call) async {
      if (call.method == 'didSleep') {
        print('Received sleep notification from native code');
        // Perform additional actions in response to the notification
      }
    });
  }
```
