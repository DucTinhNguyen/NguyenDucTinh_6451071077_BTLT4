import 'package:flutter/material.dart';
import '../utils/validator.dart';

class PersonalFormView extends StatefulWidget {
  const PersonalFormView({super.key});

  @override
  State<PersonalFormView> createState() => _PersonalFormViewState();
}

class _PersonalFormViewState extends State<PersonalFormView> {
  final _formKey = GlobalKey<FormState>();

  final nameController = TextEditingController();
  final ageController = TextEditingController();

  String gender = "Nam";
  String maritalStatus = "Kết hôn";
  double income = 15;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // ===== APPBAR =====
      appBar: AppBar(
        backgroundColor: const Color(0xFF2F6F73),
        centerTitle: true,
        title: const Column(
          children: [
            Text(
              "FORM THÔNG TIN CÁ NHÂN",
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
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
        leading: const Icon(Icons.arrow_back, color: Colors.white),
      ),

      // ===== FLOATING BUTTON (ĐÚNG VỊ TRÍ) =====
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xFF2F6F73),
        onPressed: () {
          if (_formKey.currentState!.validate()) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text("Hợp lệ")),
            );
          }
        },
        child: const Icon(Icons.save),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [

              // ===== HỌ TÊN =====
              const Text("Họ và tên"),
              TextFormField(
                controller: nameController,
                validator: Validator.validateName,
                decoration: const InputDecoration(
                  hintText: "Nhập tên của bạn",
                ),
              ),

              const SizedBox(height: 15),

              // ===== TUỔI =====
              const Text("Tuổi"),
              TextFormField(
                controller: ageController,
                keyboardType: TextInputType.number,
                validator: Validator.validateAge,
                decoration: const InputDecoration(
                  hintText: "Nhập tuổi của bạn",
                ),
              ),

              const SizedBox(height: 15),

              // ===== GIỚI TÍNH =====
              const Text("Giới tính"),
              DropdownButtonFormField<String>(
                value: gender,
                items: ["Nam", "Nữ", "Khác"]
                    .map((e) => DropdownMenuItem(
                  value: e,
                  child: Text(e),
                ))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    gender = value!;
                  });
                },
              ),

              const SizedBox(height: 15),

              // ===== HÔN NHÂN =====
              const Text("Tình trạng hôn nhân"),

              RadioListTile(
                title: const Text("Độc thân"),
                value: "Độc thân",
                groupValue: maritalStatus,
                onChanged: (value) {
                  setState(() {
                    maritalStatus = value!;
                  });
                },
              ),

              RadioListTile(
                title: const Text("Kết hôn"),
                value: "Kết hôn",
                groupValue: maritalStatus,
                onChanged: (value) {
                  setState(() {
                    maritalStatus = value!;
                  });
                },
              ),

              RadioListTile(
                title: const Text("Ly hôn"),
                value: "Ly hôn",
                groupValue: maritalStatus,
                onChanged: (value) {
                  setState(() {
                    maritalStatus = value!;
                  });
                },
              ),

              const SizedBox(height: 15),

              // ===== SLIDER =====
              const Text("Mức thu nhập"),
              Text("Mức: ${income.round()} tr VND"),

              Slider(
                value: income,
                min: 0,
                max: 30,
                divisions: 6,
                onChanged: (value) {
                  setState(() {
                    income = value;
                  });
                },
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text("0"),
                  Text("10"),
                  Text("20"),
                  Text("30"),
                ],
              ),

              const SizedBox(height: 50),
            ],
          ),
        ),
      ),
    );
  }
}