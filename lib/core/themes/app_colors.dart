import 'package:flutter/material.dart';

class AppColors {
  // Core brand (emerald accent)
  static const Color primary = Color(0xFF39D98A); // Emerald
  static const Color onPrimary = Colors.black;

  // Navy accent for UI elements
  static const Color navy = Color(0xFF0D1B2A);
  static const Color navyContainer = Color(0xFF12263A);
  static const Color navyBorder = Color(0xFF1F364D);

  // Dark palette (grises oscuros + navy)
  static const Color darkSurface = Color(0xFF0E1116); // gris muy oscuro
  static const Color darkContainer = Color(0xFF1A1F26); // gris oscuro
  static const Color darkBorder = Color(0xFF2F3742); // borde gris azulado
  static const Color darkOnSurface = Colors.white;

  // Light palette (complementaria)
  static const Color lightSurface = Color(0xFFF7F9FB);
  static const Color lightContainer = Color(0xFFE9EEF3);
  static const Color lightBorder = Color(0xFFD2D9E1);
  static const Color lightOnSurface = navy; // texto principal en claro
}
