import '../models/sede_model.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

class SedeService {
  // Simulación de base de datos en memoria
  final List<Sede> _sedes = [
    Sede(
      id: uuid.v4(),
      nombre: 'Sede Central',
      direccion: 'Av. Principal 123',
      latitud: -12.046374,
      longitud: -77.042793,
      radioPermitido: 150,
      activa: true,
      fechaCreacion: DateTime.now().subtract(const Duration(days: 10)),
    ),
    Sede(
      id: uuid.v4(),
      nombre: 'Sucursal Norte',
      direccion: 'Calle Norte 456',
      latitud: -12.000000,
      longitud: -77.000000,
      radioPermitido: 100,
      activa: false,
      fechaCreacion: DateTime.now().subtract(const Duration(days: 5)),
      fechaModificacion: DateTime.now().subtract(const Duration(days: 2))
    ),
  ];

  Future<List<Sede>> getSedes() async {
    // Simular delay de red
    await Future.delayed(const Duration(milliseconds: 500));
    _sedes.sort((a, b) => a.nombre.compareTo(b.nombre));
    return List.from(_sedes); // Devuelve una copia para evitar modificaciones externas
  }

  Future<Sede?> getSedeById(String id) async {
    await Future.delayed(const Duration(milliseconds: 200));
    try {
      return _sedes.firstWhere((s) => s.id == id);
    } catch (e) {
      return null;
    }
  }

  Future<Sede> addSede(Sede sede) async {
    await Future.delayed(const Duration(milliseconds: 300));
    // En una creación real, no se pasaría fechaModificacion
    // El ID y fechaCreacion ya deberían estar en el objeto `sede` que llega
    final newSede = sede.copyWith(
      id: sede.id.isEmpty ? uuid.v4() : sede.id, // Asegurar ID si no lo tiene
      fechaCreacion: sede.fechaCreacion, // Ya debería estar establecida
      fechaModificacion: null, // Nueva sede no tiene fecha de modificación
    );
    _sedes.add(newSede);
    return newSede;
  }

  Future<Sede?> updateSede(Sede sedeToUpdate) async {
    await Future.delayed(const Duration(milliseconds: 300));
    int index = _sedes.indexWhere((s) => s.id == sedeToUpdate.id);
    if (index != -1) {
      // Usamos copyWith para asegurar que fechaModificacion se actualice
      // y que fechaCreacion no se altere
      _sedes[index] = sedeToUpdate.copyWith(
        fechaModificacion: DateTime.now(),
        fechaCreacion: _sedes[index].fechaCreacion, // Mantener la original
      );
      return _sedes[index];
    }
    return null;
  }

  Future<bool> deleteSede(String id) async {
    await Future.delayed(const Duration(milliseconds: 300));
    final originalLength = _sedes.length;
    _sedes.removeWhere((s) => s.id == id);
    return _sedes.length < originalLength;
  }
}