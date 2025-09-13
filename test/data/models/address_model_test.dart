import 'package:flutter_test/flutter_test.dart';
import 'package:user_basic_info/data/models/address/address_model.dart';

void main() {
  test('AddressModel JSON round-trip conserva los campos', () {
    final original = AddressModel(
      id: 'a1',
      userId: 'u1',
      pais: 'CO',
      departamento: 'ANT',
      municipio: 'Medellín',
      direccion: 'Calle 1 #2-3',
    );

    final json = original.toJson();
    final restored = AddressModel.fromJson(json);

    expect(restored.id, original.id);
    expect(restored.userId, original.userId);
    expect(restored.pais, original.pais);
    expect(restored.departamento, original.departamento);
    expect(restored.municipio, original.municipio);
    expect(restored.direccion, original.direccion);
  });
}
