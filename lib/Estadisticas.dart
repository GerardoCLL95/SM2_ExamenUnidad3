import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class EstadisticasAsistenciaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estadísticas de Asistencia'),
        backgroundColor: Colors.blueAccent,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Título de la sección de estadísticas
            const Text(
              'Asistencia Mensual',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 20),

            // Gráfico de barras de asistencia
            Expanded(
              child: BarChart(
                BarChartData(
                  gridData: const FlGridData(show: true, horizontalInterval: 5),
                  titlesData: const FlTitlesData(
                    leftTitles: SideTitles(showTitles: true),
                    bottomTitles: SideTitles(showTitles: true),
                  ),
                  borderData: FlBorderData(show: false),
                  barGroups: [
                    BarChartGroupData(x: 0, barRods: [
                      BarChartRodData(y: 80, color: Colors.green)
                    ]),
                    BarChartGroupData(x: 1, barRods: [
                      BarChartRodData(y: 90, color: Colors.green)
                    ]),
                    BarChartGroupData(x: 2, barRods: [
                      BarChartRodData(y: 70, color: Colors.orange)
                    ]),
                    BarChartGroupData(x: 3, barRods: [
                      BarChartRodData(y: 60, color: Colors.orange)
                    ]),
                    BarChartGroupData(x: 4, barRods: [
                      BarChartRodData(y: 85, color: Colors.green)
                    ]),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),

            // Indicadores clave de asistencia
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                _buildIndicator('Estudiantes', '200', Colors.blue),
                _buildIndicator('Asistencia Promedio', '80%', Colors.green),
                _buildIndicator('Faltas', '40', Colors.red),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Widget para crear un indicador de estadística
  Widget _buildIndicator(String title, String value, Color color) {
    return Column(
      children: [
        Text(
          title,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.black54,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          value,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: EstadisticasAsistenciaPage(),
  ));
}
