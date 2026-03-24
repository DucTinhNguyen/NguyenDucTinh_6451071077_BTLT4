import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../widgets/custom_input_field.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  // Controller để lấy giá trị so sánh realtime
  final TextEditingController _passController = TextEditingController();
  final TextEditingController _confirmController = TextEditingController();

  bool _hidePass = true;
  bool _hideConfirm = true;

  // Biến trạng thái để hiển thị lỗi realtime
  String _passWarning = "";
  String _confirmError = "";

  void _onPasswordChanged(String value) {
    setState(() {
      // Validate độ mạnh mật khẩu
      if (value.isNotEmpty && value.length < 8) {
        _passWarning = "Hơi yếu, hãy thêm ký tự đặc biệt";
      } else {
        _passWarning = "";
      }
      // Kiểm tra lại khớp mật khẩu mỗi khi pass chính thay đổi
      _validateMatch(_confirmController.text);
    });
  }

  void _validateMatch(String value) {
    setState(() {
      if (value.isNotEmpty && value != _passController.text) {
        _confirmError = "Mật khẩu xác nhận chưa khớp";
      } else {
        _confirmError = "";
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.primaryDark,
        leading: const Icon(Icons.menu, color: Colors.white),
        // TIÊU ĐỀ 2 DÒNG KÈM MÃ SỐ 6451071077
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
                "Form Đăng ký Tài khoản Nâng cao",
                style: TextStyle(fontSize: 16, color: Colors.white)
            ),
            Text(
                "6451071077",
                style: TextStyle(fontSize: 12, color: Colors.white.withOpacity(0.8))
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Center(
              child: Text(
                  "Đăng ký Tài khoản",
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold)
              ),
            ),
            const SizedBox(height: 30),

            // Các trường nhập liệu để trống hoàn toàn
            const TextField(decoration: InputDecoration(labelText: "Họ tên")),
            const SizedBox(height: 15),
            const TextField(decoration: InputDecoration(labelText: "Email")),
            const SizedBox(height: 15),

            // Mật khẩu với Toggle Show/Hide và Validate Realtime
            TextFormField(
              controller: _passController,
              obscureText: _hidePass,
              onChanged: _onPasswordChanged,
              decoration: InputDecoration(
                labelText: "Mật khẩu",
                labelStyle: const TextStyle(color: AppColors.infoBlue),
                suffixIcon: IconButton(
                  icon: Icon(_hidePass ? Icons.visibility_off : Icons.visibility),
                  onPressed: () => setState(() => _hidePass = !_hidePass),
                ),
              ),
            ),
            if (_passWarning.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(_passWarning, style: const TextStyle(color: AppColors.infoBlue)),
              ),

            const SizedBox(height: 15),

            // Xác nhận mật khẩu với logic báo đỏ nếu không khớp
            TextFormField(
              controller: _confirmController,
              obscureText: _hideConfirm,
              onChanged: _validateMatch,
              decoration: InputDecoration(
                labelText: "Xác nhận mật khẩu",
                // Đổi màu label sang đỏ nếu có lỗi
                labelStyle: TextStyle(
                    color: _confirmError.isNotEmpty ? AppColors.errorRed : Colors.grey
                ),
                suffixIcon: IconButton(
                  icon: Icon(
                    _hideConfirm ? Icons.visibility_off : Icons.visibility,
                    color: _confirmError.isNotEmpty ? AppColors.errorRed : Colors.grey,
                  ),
                  onPressed: () => setState(() => _hideConfirm = !_hideConfirm),
                ),
                // Đường kẻ dưới màu đỏ khi lỗi
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                      color: _confirmError.isNotEmpty ? AppColors.errorRed : Colors.grey
                  ),
                ),
              ),
            ),
            if (_confirmError.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(top: 8),
                child: Text(_confirmError, style: const TextStyle(color: AppColors.errorRed)),
              ),

            const SizedBox(height: 40),

            // Nút Đăng ký màu Teal đặc trưng
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.accentTeal,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text("Đăng ký", style: TextStyle(color: Colors.white, fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}