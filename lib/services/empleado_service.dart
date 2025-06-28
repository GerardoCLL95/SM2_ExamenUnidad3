import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/empleado_model.dart';

class EmpleadoService {
  final CollectionReference empleadosRef =
      FirebaseFirestore.instance.collection('empleados');

  Future<void> registrarEmpleado(Empleado empleado) async {
    try {
      await empleadosRef.doc(empleado.empleadoId).set(empleado.toMap());
      print("Empleado registrado exitosamente");
    } catch (e) {
      print("Error al registrar empleado: $e");
    }
  }

  Future<Empleado?> obtenerEmpleadoPorId(String empleadoId) async {
    try {
      DocumentSnapshot doc = await empleadosRef.doc(empleadoId).get();
      if (doc.exists) {
        return Empleado.fromMap(doc.data() as Map<String, dynamic>);
      }
      return null;
    } catch (e) {
      print("Error al obtener empleado: $e");
      return null;
    }
  }
}
