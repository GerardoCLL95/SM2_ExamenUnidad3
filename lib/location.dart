import 'package:geolocator/geolocator.dart';
import '../models/work_location_model.dart';

class LocationService {
  
  // Obtiene la posición actual del dispositivo
  Future<Position> getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Los servicios de ubicación están deshabilitados.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Los permisos de ubicación fueron denegados.');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Los permisos de ubicación están permanentemente denegados, no podemos solicitar permisos.');
    }

    return await Geolocator.getCurrentPosition();
  }

  // Verifica si una posición está dentro de la geocerca de un lugar de trabajo
  bool isWithinGeofence(Position currentPosition, WorkLocationModel workLocation) {
    double distance = Geolocator.distanceBetween(
      currentPosition.latitude,
      currentPosition.longitude,
      workLocation.latitude,
      workLocation.longitude,
    );

    print("Distancia al punto de trabajo: ${distance.toStringAsFixed(2)} metros.");
    
    return distance <= workLocation.radiusInMeters;
  }
}