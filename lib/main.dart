import 'package:flutter/material.dart';
import 'pages/registro_empleado_page.dart';  // Importa la página de registro

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Gestión de Empleados',
      theme: ThemeData(
        primaryColor: Color(0xFF005BAC),  // Azul oscuro
        hintColor: Color(0xFFFFA000),   // Naranja
        scaffoldBackgroundColor: Color(0xFFF5F5F5),  // Gris claro
        textTheme: TextTheme(
          displayLarge: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Color(0xFF005BAC),
          ),
          bodyLarge: TextStyle(fontSize: 16, color: Colors.black87),
        ),
      ),
      home: PresentacionPage(),
    );
  }
}

class PresentacionPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bienvenido a la Gestión de Empleados'),
        backgroundColor: Color(0xFF005BAC),  // Azul oscuro
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Gestión de Empleados',
                style: Theme.of(context).textTheme.displayLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Image.asset(
                'assets/logo.png',  // Reemplaza con tu logo
                height: 150,
              ),
              SizedBox(height: 30),
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => RegistroEmpleadoPage()),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFFFA000),  // Naranja
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  textStyle: TextStyle(fontSize: 18),
                ),
                child: Text('Registrar Empleado'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
