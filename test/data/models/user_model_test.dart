import 'package:flutter_test/flutter_test.dart';
import 'package:user_basic_info/data/models/user/user_model.dart';

void main() {
  test('UserModel JSON round-trip conserva los campos', () {
    final original = UserModel(
      id: 'u1',
      nombre: 'Ana',
      apellido: 'Lopez',
      fechaNacimiento: DateTime(2000, 1, 2, 3, 4, 5),
    );

    final json = original.toJson();
    final restored = UserModel.fromJson(json);

    expect(restored.id, original.id);
    expect(restored.nombre, original.nombre);
    expect(restored.apellido, original.apellido);
    expect(restored.fechaNacimiento, original.fechaNacimiento);
  });
}
