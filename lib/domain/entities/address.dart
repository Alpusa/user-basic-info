class Address {
  final String? id;
  final String? userId;
  final String pais;
  final String departamento;
  final String municipio;
  final String direccion;

  const Address({
    this.id,
    this.userId,
    required this.pais,
    required this.departamento,
    required this.municipio,
    required this.direccion,
  });
}
