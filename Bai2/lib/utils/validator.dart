class Validator {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Vui lòng nhập tên";
    }
    return null;
  }

  static String? validateAge(String? value) {
    if (value == null || value.isEmpty) {
      return "Vui lòng nhập tuổi";
    }
    final age = int.tryParse(value);
    if (age == null || age <= 0) {
      return "Tuổi phải > 0";
    }
    return null;
  }
}