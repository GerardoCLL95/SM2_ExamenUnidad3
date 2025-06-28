import 'package:flutter_test/flutter_test.dart';
import 'package:geolocator/geolocator.dart';
import 'package:asistenciacontrol/modelos/registro_asistencia_modelo.dart';
import 'package:asistenciacontrol/modelos/work_location_model.dart';
import 'package:asistenciacontrol/location.dart';

void main() {
  group('RegistroAsistenciaModelo', () {
    test(
      'horaEntrada y horaSalida deben poder asignarse y leerse correctamente',
      () {
        final entrada = DateTime(2024, 6, 27, 8, 0);
        final salida = DateTime(2024, 6, 27, 17, 0);

        final registro =
            RegistroAsistenciaModelo()
              ..horaEntrada = entrada
              ..horaSalida = salida;

        expect(registro.horaEntrada, equals(entrada));
        expect(registro.horaSalida, equals(salida));
      },
    );
  });

  group('LocationService', () {
    test('isWithinGeofence retorna true si está dentro del radio', () {
      final service = LocationService();
      final current = Position(
        latitude: -16.4025,
        longitude: -71.537,
        timestamp: DateTime.now(),
        accuracy: 5,
        altitude: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0,
        altitudeAccuracy: 1,
        headingAccuracy: 1,
        floor: 0,
        isMocked: false,
      );

      final workLocation = WorkLocationModel(
        latitude: -16.4026,
        longitude: -71.537,
        radiusInMeters: 50,
      );

      final result = service.isWithinGeofence(current, workLocation);
      expect(result, isTrue);
    });

    test('isWithinGeofence retorna false si está fuera del radio', () {
      final service = LocationService();
      final current = Position(
        latitude: -16.5,
        longitude: -71.6,
        timestamp: DateTime.now(),
        accuracy: 5,
        altitude: 0,
        heading: 0,
        speed: 0,
        speedAccuracy: 0,
        altitudeAccuracy: 1,
        headingAccuracy: 1,
        floor: 0,
        isMocked: false,
      );

      final workLocation = WorkLocationModel(
        latitude: -16.4026,
        longitude: -71.537,
        radiusInMeters: 50,
      );

      final result = service.isWithinGeofence(current, workLocation);
      expect(result, isFalse);
    });
  });
}
