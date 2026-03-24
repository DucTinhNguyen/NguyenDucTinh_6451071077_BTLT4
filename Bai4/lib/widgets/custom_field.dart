import 'package:flutter/material.dart';

OutlineInputBorder customBorder(Color color) {
  return OutlineInputBorder(
    borderRadius: BorderRadius.circular(12),
    borderSide: BorderSide(color: color, width: 2),
  );
}