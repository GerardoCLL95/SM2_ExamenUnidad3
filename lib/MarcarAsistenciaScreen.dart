import 'package:flutter/material.dart';
import 'package:lucide_icons/lucide_icons.dart';

// Datos fijos de ejemplo (en una app real esto vendría de un modelo o backend)
class AttendanceScreen extends StatelessWidget {
  final String employeeName = 'Jorge Briceño';
  final String sede = 'Sede Central';
  final bool isInsideZone = true;

  @override
  Widget build(BuildContext context) {
    final statusColor = isInsideZone ? Colors.green : Colors.red;
    final statusText = isInsideZone ? 'Dentro de la zona' : 'Fuera de la zona';

    return Scaffold(
      backgroundColor: Colors.grey[100],
      appBar: AppBar(
        title: Text('Marcar Asistencia'),
        centerTitle: true,
        backgroundColor: Colors.indigo[600],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Card(
              elevation: 6,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    CircleAvatar(
                      radius: 40,
                      backgroundColor: Colors.indigo[300],
                      child: Icon(Icons.person, size: 50, color: Colors.white),
                    ),
                    SizedBox(height: 10),
                    Text(
                      employeeName,
                      style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      sede,
                      style: TextStyle(color: Colors.grey[700]),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(LucideIcons.mapPin, color: statusColor),
                        SizedBox(width: 8),
                        Text(
                          statusText,
                          style: TextStyle(color: statusColor, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: isInsideZone ? () {} : null,
                            icon: Icon(Icons.login),
                            label: Text('Entrada'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.green,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              padding: EdgeInsets.symmetric(vertical: 14),
                            ),
                          ),
                        ),
                        SizedBox(width: 16),
                        Expanded(
                          child: ElevatedButton.icon(
                            onPressed: isInsideZone ? () {} : null,
                            icon: Icon(Icons.logout),
                            label: Text('Salida'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                              padding: EdgeInsets.symmetric(vertical: 14),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Spacer(),
            Text(
              'Recuerda estar dentro de la zona para marcar tu asistencia.',
              style: TextStyle(color: Colors.grey[600]),
              textAlign: TextAlign.center,
            )
          ],
        ),
      ),
    );
  }
}
