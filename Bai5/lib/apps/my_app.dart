import 'package:flutter/material.dart';
import '../views/form_upload_screen.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Form Upload',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: const FormUploadScreen(),
    );
  }
}