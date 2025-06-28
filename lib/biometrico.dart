import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BiometriaPage extends StatefulWidget {
  @override
  _BiometriaPageState createState() => _BiometriaPageState();
}

class _BiometriaPageState extends State<BiometriaPage> {
  static const platform = MethodChannel('com.ejemplo.biometria');
  String _resultado = 'Esperando captura...';

  Future<void> _capturarHuella() async {
    try {
      final resultado = await platform.invokeMethod('capturarHuella');
      setState(() {
        _resultado = 'Huella capturada: $resultado';
      });
    } on PlatformException catch (e) {
      setState(() {
        _resultado = 'Error: ${e.message}';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Captura Biométrica'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(_resultado),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _capturarHuella,
              child: Text('Capturar Huella'),
            ),
          ],
        ),
      ),
    );
  }
}
