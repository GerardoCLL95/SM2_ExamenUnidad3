import 'package:flutter/material.dart';

class HistorialEmpleadosPage extends StatefulWidget {
  @override
  _HistorialEmpleadosPageState createState() => _HistorialEmpleadosPageState();
}

class _HistorialEmpleadosPageState extends State<HistorialEmpleadosPage> {
  String filtroNombre = '';
  DateTime? fechaInicio;
  DateTime? fechaFin;

  List<Map<String, dynamic>> historial = [
    {'nombre': 'Juan Pérez', 'fecha': DateTime(2025, 5, 1)},
    {'nombre': 'Ana Torres', 'fecha': DateTime(2025, 5, 2)},
    {'nombre': 'Gerardo Concha', 'fecha': DateTime(2025, 5, 3)},
  ];

  List<Map<String, dynamic>> get historialFiltrado {
    return historial.where((item) {
      final nombreValido = filtroNombre.isEmpty || item['nombre'].toLowerCase().contains(filtroNombre.toLowerCase());
      final fecha = item['fecha'] as DateTime;
      final fechaValida = (fechaInicio == null || fecha.isAfter(fechaInicio!.subtract(Duration(days: 1)))) &&
                          (fechaFin == null || fecha.isBefore(fechaFin!.add(Duration(days: 1))));
      return nombreValido && fechaValida;
    }).toList();
  }

  Future<void> seleccionarFecha(BuildContext context, bool esInicio) async {
    final fecha = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2030),
    );
    if (fecha != null) {
      setState(() {
        if (esInicio) {
          fechaInicio = fecha;
        } else {
          fechaFin = fecha;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Historial de Empleados'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(labelText: 'Filtrar por nombre'),
              onChanged: (valor) {
                setState(() {
                  filtroNombre = valor;
                });
              },
            ),
            Row(
              children: [
                Expanded(
                  child: TextButton(
                    onPressed: () => seleccionarFecha(context, true),
                    child: Text(fechaInicio == null
                        ? 'Desde'
                        : 'Desde: ${fechaInicio!.toLocal().toString().split(' ')[0]}'),
                  ),
                ),
                Expanded(
                  child: TextButton(
                    onPressed: () => seleccionarFecha(context, false),
                    child: Text(fechaFin == null
                        ? 'Hasta'
                        : 'Hasta: ${fechaFin!.toLocal().toString().split(' ')[0]}'),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16),
            Expanded(
              child: ListView.builder(
                itemCount: historialFiltrado.length,
                itemBuilder: (context, index) {
                  final item = historialFiltrado[index];
                  return ListTile(
                    title: Text(item['nombre']),
                    subtitle: Text('Fecha: ${item['fecha'].toLocal().toString().split(' ')[0]}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
