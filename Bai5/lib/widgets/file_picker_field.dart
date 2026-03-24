import 'package:flutter/material.dart';
import '../utils/constants.dart';

class FilePickerField extends StatelessWidget {
  final String? fileName;
  final VoidCallback onPickFile;
  final bool showError;

  const FilePickerField({
    super.key,
    required this.fileName,
    required this.onPickFile,
    this.showError = false,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("File Picker", style: AppTextStyles.headerLabel),
        const Text("CV (Định dạng: PDF, DOCX)", style: AppTextStyles.subHint),
        const SizedBox(height: 8),
        Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            // Đổi màu viền nếu có lỗi validation
            border: Border.all(
              color: showError ? AppColors.errorRed : AppColors.borderRed,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(8),
          ),
          child: Row(
            children: [
              ElevatedButton(
                onPressed: onPickFile,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.lightGrey,
                  foregroundColor: Colors.black,
                  elevation: 0,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: const Text("Chọn Tệp CV"),
              ),
              const SizedBox(width: 10),
              if (fileName != null) ...[
                const Icon(Icons.picture_as_pdf, color: AppColors.errorRed, size: 20),
                const SizedBox(width: 4),
                Expanded(
                  child: Text(
                    fileName!,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(fontSize: 14),
                  ),
                ),
              ]
            ],
          ),
        ),
        // Thông báo lỗi validate
        if (showError)
          const Padding(
            padding: EdgeInsets.only(top: 8.0),
            child: Text(
              "Vui lòng upload CV của bạn!",
              style: TextStyle(color: AppColors.errorRed, fontSize: 12),
            ),
          ),
      ],
    );
  }
}