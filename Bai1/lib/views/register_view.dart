import 'package:flutter/material.dart';
import '../utils/validator.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isChecked = true;
  bool isValid = false;
  bool obscurePassword = true;

  bool isNameTouched = false;
  bool isEmailTouched = false;
  bool isPassTouched = false;

  void validateForm() {
    setState(() {
      isValid = _formKey.currentState?.validate() == true && isChecked;
    });
  }

  OutlineInputBorder border(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: color, width: 2),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // APPBAR
      appBar: AppBar(
        backgroundColor: const Color(0xFF2F6F73),
        centerTitle: true,
        title: const Column(
          children: [
            Text(
              "Đăng Ký Tài Khoản",
              style: TextStyle(
                color: Colors.white,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
            Text(
              "6451071077",
              style: TextStyle(
                color: Colors.white,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          onChanged: validateForm,
          child: Column(
            children: [
              const SizedBox(height: 10),

              // AVATAR
              Column(
                children: const [
                  CircleAvatar(
                    radius: 30,
                    backgroundColor: Color(0xFF2F6F73),
                    child: Icon(Icons.person, color: Colors.white, size: 35),
                  ),
                  SizedBox(height: 5),
                  Text("Account Circle"),
                ],
              ),

              const SizedBox(height: 10),

              // LOGIN TEXT
              Align(
                alignment: Alignment.centerRight,
                child: RichText(
                  text: const TextSpan(
                    text: "Đã có tài khoản?\n",
                    style: TextStyle(color: Colors.black),
                    children: [
                      TextSpan(
                        text: "Đăng nhập",
                        style: TextStyle(
                          color: Color(0xFF2F6F73),
                          fontWeight: FontWeight.bold,
                        ),
                      )
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // ===== HỌ TÊN =====
              TextFormField(
                controller: nameController,
                validator: Validator.validateName,
                onChanged: (value) {
                  setState(() {
                    isNameTouched = value.isNotEmpty;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Họ và tên",
                  enabledBorder: border(
                      isNameTouched ? Colors.red : Colors.grey),
                  focusedBorder: border(Colors.red),
                  errorBorder: border(Colors.red),
                  focusedErrorBorder: border(Colors.red),
                  suffixIcon: isNameTouched &&
                      Validator.validateName(nameController.text) == null
                      ? const Icon(Icons.check, color: Colors.green)
                      : null,
                ),
              ),

              const SizedBox(height: 15),

              // ===== EMAIL =====
              TextFormField(
                controller: emailController,
                validator: Validator.validateEmail,
                onChanged: (value) {
                  setState(() {
                    isEmailTouched = value.isNotEmpty;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Email",
                  enabledBorder:
                  border(isEmailTouched ? Colors.grey : Colors.grey),
                  focusedBorder: border(Colors.grey),
                  errorBorder: border(Colors.red),
                  focusedErrorBorder: border(Colors.red),
                  suffixIcon: isEmailTouched &&
                      Validator.validateEmail(emailController.text) == null
                      ? const Icon(Icons.check, color: Colors.green)
                      : null,
                ),
              ),

              const SizedBox(height: 15),

              // ===== PASSWORD =====
              TextFormField(
                controller: passwordController,
                obscureText: obscurePassword,
                validator: Validator.validatePassword,
                onChanged: (value) {
                  setState(() {
                    isPassTouched = value.isNotEmpty;
                  });
                },
                decoration: InputDecoration(
                  labelText: "Mật khẩu",
                  enabledBorder:
                  border(isPassTouched ? Colors.green : Colors.grey),
                  focusedBorder: border(Colors.green),
                  errorBorder: border(Colors.red),
                  focusedErrorBorder: border(Colors.red),
                  suffixIcon: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (isPassTouched &&
                          Validator.validatePassword(
                              passwordController.text) ==
                              null)
                        const Icon(Icons.check, color: Colors.green),
                      IconButton(
                        icon: Icon(obscurePassword
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            obscurePassword = !obscurePassword;
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 15),

              // ===== CHECKBOX =====
              Row(
                children: [
                  Checkbox(
                    value: isChecked,
                    activeColor: const Color(0xFF2F6F73),
                    onChanged: (value) {
                      setState(() {
                        isChecked = value!;
                        validateForm();
                      });
                    },
                  ),
                  const Expanded(
                    child: Text(
                      "Tôi đồng ý với các Điều khoản & Chính sách",
                    ),
                  )
                ],
              ),

              const SizedBox(height: 20),

              // ===== BUTTON =====
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: isValid
                        ? const Color(0xFFF4A261)
                        : const Color(0xFFF4A261).withOpacity(0.5),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  onPressed: isValid ? () {} : null,
                  child: const Text(
                    "Đăng Ký",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}