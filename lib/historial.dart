import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../modelos/registro_asistencia_modelo.dart';
import '../proveedores/proveedor_sesion.dart';
import '../servicios/servicio_asistencia.dart';

class PantallaHistorial extends StatelessWidget {
  const PantallaHistorial({super.key});

  @override
  Widget build(BuildContext context) {
    final usuario = Provider.of<ProveedorSesion>(context, listen: false).usuarioActual;
    final servicioAsistencia = ServicioAsistencia();

    return Scaffold(
      appBar: AppBar(title: const Text('Historial de Asistencia')),
      body: FutureBuilder<List<RegistroAsistenciaModelo>>(
        future: servicioAsistencia.obtenerHistorialAsistencia(usuario!.id),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          }
          if (!snapshot.hasData || snapshot.data!.isEmpty) {
            return const Center(child: Text('No hay registros de asistencia.'));
          }

          final registros = snapshot.data!;
          final formatoFecha = DateFormat('dd/MM/yyyy');
          final formatoHora = DateFormat('HH:mm');

          return ListView.builder(
            itemCount: registros.length,
            itemBuilder: (context, index) {
              final registro = registros[index];
              return Card(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                child: ListTile(
                  leading: const Icon(Icons.calendar_today, color: Colors.indigo),
                  title: Text(
                    'Fecha: ${formatoFecha.format(registro.horaEntrada)}',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Entrada: ${formatoHora.format(registro.horaEntrada)}'
                    '${registro.horaSalida != null ? ' - Salida: ${formatoHora.format(registro.horaSalida!)}' : ' - (Aún trabajando)'}'
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}