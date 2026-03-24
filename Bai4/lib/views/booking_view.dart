import 'package:flutter/material.dart';
import '../utils/date_utils.dart';
import '../widgets/custom_field.dart';

class BookingView extends StatefulWidget {
  const BookingView({super.key});

  @override
  State<BookingView> createState() => _BookingViewState();
}

class _BookingViewState extends State<BookingView> {
  DateTime? selectedDate;
  TimeOfDay? selectedTime;
  String service = "Kiểm tra tổng quát";

  bool isDateInvalid = false;

  Future<void> pickDate() async {
    DateTime now = DateTime.now();

    final picked = await showDatePicker(
      context: context,
      initialDate: now,
      firstDate: DateTime(2000),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      setState(() {
        selectedDate = picked;
        isDateInvalid = DateUtilsCustom.isPastDate(picked);
      });
    }
  }

  Future<void> pickTime() async {
    final picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (picked != null) {
      setState(() {
        selectedTime = picked;
      });
    }
  }

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
              "ĐẶT LỊCH HẸN",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 2),
            Text(
              "6451071077",
              style: TextStyle(color: Colors.white, fontSize: 12),
            )
          ],
        ),
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [

            // ===== DATE =====
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Chọn ngày"),
            ),

            const SizedBox(height: 5),

            GestureDetector(
              onTap: pickDate,
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: selectedDate == null
                        ? "Select Date"
                        : DateUtilsCustom.formatDate(selectedDate!),
                    enabledBorder: customBorder(
                        isDateInvalid ? Colors.red : Colors.grey),
                    focusedBorder: customBorder(
                        isDateInvalid ? Colors.red : Colors.grey),
                    suffixIcon: const Icon(Icons.calendar_today,
                        color: Colors.red),
                  ),
                ),
              ),
            ),

            if (isDateInvalid)
              const Padding(
                padding: EdgeInsets.only(top: 5),
                child: Row(
                  children: [
                    Icon(Icons.error, color: Colors.red, size: 16),
                    SizedBox(width: 5),
                    Text(
                      "Ngày không hợp lệ (trong quá khứ)",
                      style: TextStyle(color: Colors.red),
                    ),
                  ],
                ),
              ),

            const SizedBox(height: 15),

            // ===== TIME =====
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Chọn giờ"),
            ),

            const SizedBox(height: 5),

            GestureDetector(
              onTap: pickTime,
              child: AbsorbPointer(
                child: TextFormField(
                  decoration: InputDecoration(
                    hintText: selectedTime == null
                        ? "Chọn giờ"
                        : selectedTime!.format(context),
                    enabledBorder: customBorder(Colors.grey),
                    focusedBorder: customBorder(Colors.grey),
                    suffixIcon: const Icon(Icons.access_time),
                  ),
                ),
              ),
            ),

            const SizedBox(height: 15),

            // ===== SERVICE =====
            const Align(
              alignment: Alignment.centerLeft,
              child: Text("Chọn dịch vụ"),
            ),

            const SizedBox(height: 5),

            DropdownButtonFormField<String>(
              value: service,
              items: [
                "Kiểm tra tổng quát",
                "Dịch vụ 2",
                "Dịch vụ 3"
              ]
                  .map((e) => DropdownMenuItem(
                value: e,
                child: Text(e),
              ))
                  .toList(),
              onChanged: (value) {
                setState(() {
                  service = value!;
                });
              },
              decoration: InputDecoration(
                enabledBorder: customBorder(Colors.grey),
                focusedBorder: customBorder(Colors.grey),
              ),
            ),

            const Spacer(),

            // ===== BUTTON =====
            SizedBox(
              width: double.infinity,
              height: 50,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFFFF8C00),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                onPressed: () {
                  if (selectedDate == null || isDateInvalid) {
                    setState(() {
                      isDateInvalid = true;
                    });
                    return;
                  }

                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text("Đặt lịch thành công")),
                  );
                },
                child: const Text(
                  "Xác nhận Đặt lịch",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}