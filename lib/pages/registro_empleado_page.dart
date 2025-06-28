import 'package:flutter/material.dart';
import '../models/empleado_model.dart';
import '../services/empleado_service.dart';

class RegistroEmpleadoPage extends StatefulWidget {
  @override
  _RegistroEmpleadoPageState createState() => _RegistroEmpleadoPageState();
}

class _RegistroEmpleadoPageState extends State<RegistroEmpleadoPage> {
  final _formKey = GlobalKey<FormState>();
  final _dniController = TextEditingController();
  final _nombreController = TextEditingController();
  final _apellidoController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _emailController = TextEditingController();
  final _cargoController = TextEditingController();
  final _sedeController = TextEditingController();
  bool _isLoading = false;

  Future<void> _registrarEmpleado() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      try {
        Empleado nuevoEmpleado = Empleado(
          empleadoId: DateTime.now().millisecondsSinceEpoch.toString(),
          dni: _dniController.text,
          nombre: _nombreController.text,
          apellido: _apellidoController.text,
          telefono: _telefonoController.text,
          email: _emailController.text,
          cargo: _cargoController.text,
          sede: _sedeController.text,
          estado: true,
          rol: "empleado",
          fotoPerfil: "",  // Puedes agregar el enlace de la foto aquí
        );

        await EmpleadoService().registrarEmpleado(nuevoEmpleado);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Empleado registrado exitosamente')),
        );
        Navigator.pop(context);
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error al registrar empleado: $e')),
        );
      } finally {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Registrar Empleado')),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text(
                'Nuevo Empleado',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 16),
              TextFormField(
                controller: _dniController,
                decoration: InputDecoration(labelText: 'DNI'),
                validator: (value) =>
                    value!.isEmpty ? 'Ingrese el DNI' : null,
              ),
              TextFormField(
                controller: _nombreController,
                decoration: InputDecoration(labelText: 'Nombre'),
                validator: (value) =>
                    value!.isEmpty ? 'Ingrese el nombre' : null,
              ),
              TextFormField(
                controller: _apellidoController,
                decoration: InputDecoration(labelText: 'Apellidos'),
                validator: (value) =>
                    value!.isEmpty ? 'Ingrese los apellidos' : null,
              ),
              TextFormField(
                controller: _telefonoController,
                decoration: InputDecoration(labelText: 'Número de Celular'),
                validator: (value) =>
                    value!.isEmpty ? 'Ingrese el número de celular' : null,
              ),
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'Correo Electrónico'),
                validator: (value) =>
                    value!.isEmpty ? 'Ingrese el correo electrónico' : null,
              ),
              TextFormField(
                controller: _cargoController,
                decoration: InputDecoration(labelText: 'Cargo'),
                validator: (value) =>
                    value!.isEmpty ? 'Ingrese el cargo' : null,
              ),
              TextFormField(
                controller: _sedeController,
                decoration: InputDecoration(labelText: 'Sede'),
                validator: (value) =>
                    value!.isEmpty ? 'Ingrese la sede' : null,
              ),
              SizedBox(height: 20),
              _isLoading
                  ? Center(child: CircularProgressIndicator())
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: _registrarEmpleado,
                          child: Text('Guardar Empleado'),
                        ),
                        OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          child: Text('Cancelar'),
                        ),
                      ],
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
