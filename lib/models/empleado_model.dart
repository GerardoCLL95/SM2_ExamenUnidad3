class Empleado {
  String empleadoId;
  String dni;
  String nombre;
  String apellido;
  String telefono;
  String email;
  String cargo;
  String sede;
  bool estado;
  String rol;
  String fotoPerfil;

  Empleado({
    required this.empleadoId,
    required this.dni,
    required this.nombre,
    required this.apellido,
    required this.telefono,
    required this.email,
    required this.cargo,
    required this.sede,
    required this.estado,
    required this.rol,
    required this.fotoPerfil,
  });

  Map<String, dynamic> toMap() {
    return {
      'empleadoId': empleadoId,
      'dni': dni,
      'nombre': nombre,
      'apellido': apellido,
      'telefono': telefono,
      'email': email,
      'cargo': cargo,
      'sede': sede,
      'estado': estado,
      'rol': rol,
      'fotoPerfil': fotoPerfil,
    };
  }

  factory Empleado.fromMap(Map<String, dynamic> map) {
    return Empleado(
      empleadoId: map['empleadoId'],
      dni: map['dni'],
      nombre: map['nombre'],
      apellido: map['apellido'],
      telefono: map['telefono'],
      email: map['email'],
      cargo: map['cargo'],
      sede: map['sede'],
      estado: map['estado'],
      rol: map['rol'],
      fotoPerfil: map['fotoPerfil'],
    );
  }
}
