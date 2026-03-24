import 'package:flutter/material.dart';

class AppColors {
  // Màu xanh đậm của AppBar
  static const Color primaryTeal = Color(0xFF004D40);

  // Màu cam của nút Nộp hồ sơ
  static const Color accentOrange = Color(0xFFF5A65B);

  // Các màu bổ trợ khác
  static const Color errorRed = Colors.red;
  static const Color lightGrey = Color(0xFFE0E0E0);
  static const Color borderRed = Color(0xFFEF9A9A); // Màu đỏ nhạt của khung file picker
}

class AppTextStyles {
  static const TextStyle headerLabel = TextStyle(
    fontWeight: FontWeight.bold,
    fontSize: 16,
    color: Colors.black,
  );

  static const TextStyle subHint = TextStyle(
    color: Colors.grey,
    fontSize: 14,
  );
}