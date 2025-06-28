import 'package:flutter/material.dart';

class RegistroAsistenciaPage extends StatelessWidget {
  const RegistroAsistenciaPage({super.key});

  void _mostrarNotificacion(BuildContext context, String tipo) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Registro de $tipo exitoso.'),
        backgroundColor: Colors.green,
        duration: const Duration(seconds: 2),
        behavior: SnackBarBehavior.floating,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }

  void _registrarAsistencia(BuildContext context, String tipo) {
    // Aquí iría la lógica para guardar el registro en la base de datos
    // Por ejemplo: await registrarEnFirebase(tipo);

    // Mostrar notificación visual al usuario
    _mostrarNotificacion(context, tipo);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registro de Asistencia'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => _registrarAsistencia(context, 'entrada'),
              icon: const Icon(Icons.login),
              label: const Text('Registrar Entrada'),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: () => _registrarAsistencia(context, 'salida'),
              icon: const Icon(Icons.logout),
              label: const Text('Registrar Salida'),
            ),
          ],
        ),
      ),
    );
  }
}
