import 'package:flutter/material.dart';

class RegistroScreen extends StatelessWidget {
  final user = FirebaseAuth.instance.currentUser;

  Future<void> registrar(String tipo) async {
    final now = Timestamp.now();
    await FirebaseFirestore.instance.collection('registros').add({
      'usuario': user?.email,
      'tipo': tipo,
      'fecha_hora': now,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Registro de Entrada / Salida")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Bienvenido, ${user?.email}", style: TextStyle(fontSize: 16)),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.login),
              label: Text("Registrar Entrada"),
              onPressed: () => registrar("entrada"),
            ),
            SizedBox(height: 10),
            ElevatedButton.icon(
              icon: Icon(Icons.logout),
              label: Text("Registrar Salida"),
              onPressed: () => registrar("salida"),
            ),
          ],
        ),
      ),
    );
  }
}
 //asdadasdasdsadasdasdasdasdasd