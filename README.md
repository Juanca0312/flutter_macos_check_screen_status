# Flutter check screen status for macOS

Este proyecto implementa un método de canal en Flutter para verificar si la pantalla está en modo de suspensión o bloqueada en macOS.

## Uso
```
  static const MethodChannel _channel = MethodChannel('com.example.app/sleep');

  @override
  void initState() {
    super.initState();

    _channel.setMethodCallHandler((call) async {
      if (call.method == 'didSleep') {
        print('Received sleep notification from native code');
        // Realizar acciones adicionales en respuesta a la notificación
      }
    });
  }
```
