import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import '../widgets/custom_text_field.dart';
import '../widgets/file_picker_field.dart'; // Import widget đã tách
import '../utils/constants.dart';         // Import màu sắc hằng số

class FormUploadScreen extends StatefulWidget {
  const FormUploadScreen({super.key});

  @override
  State<FormUploadScreen> createState() => _FormUploadScreenState();
}

class _FormUploadScreenState extends State<FormUploadScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _fileName = "CV_LanHuong.pdf";
  bool _isConfirmed = false;
  bool _showFileError = false;

  Future<void> _pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf', 'docx'],
    );

    if (result != null) {
      setState(() {
        _fileName = result.files.single.name;
        _showFileError = false;
      });
    }
  }

  void _submitForm() {
    setState(() {
      _showFileError = _fileName == null;
    });

    if (_formKey.currentState!.validate() && !_showFileError) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Đang nộp hồ sơ...')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryTeal,
        leading: const Icon(Icons.menu, color: Colors.white),
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Bài 5: Form upload hồ sơ", style: TextStyle(fontSize: 18, color: Colors.white)),
            Text("6451071077", style: TextStyle(fontSize: 12, color: Colors.white70)),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const CustomTextField(label: "Họ và tên", hint: "Full Name", initialValue: "Nguyen Lan Huong"),
              const CustomTextField(label: "Email", hint: "Hint Email", initialValue: "lanhuong.nguyen@example.com"),

              // Gọi widget đã tách từ lib/widgets/file_picker_field.dart
              FilePickerField(
                fileName: _fileName,
                onPickFile: _pickFile,
                showError: _showFileError,
              ),

              const SizedBox(height: 20),

              Row(
                children: [
                  Checkbox(
                    value: _isConfirmed,
                    onChanged: (val) => setState(() => _isConfirmed = val!),
                  ),
                  const Expanded(child: Text("Tôi xác nhận thông tin là chính xác.")),
                ],
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _submitForm,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.accentOrange,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)),
                  ),
                  child: const Text("Nộp Hồ Sơ", style: TextStyle(color: Colors.white, fontSize: 18)),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}