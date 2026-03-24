import 'package:flutter/material.dart';

class Booking {
  DateTime? date;
  TimeOfDay? time;
  String service;

  Booking({
    this.date,
    this.time,
    required this.service,
  });
}