class Validator {
  static String? validateName(String? value) {
    if (value == null || value.isEmpty) {
      return "Vui lòng nhập họ tên";
    }
    return null;
  }

  static String? validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return "Vui lòng nhập email";
    }
    final regex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
    if (!regex.hasMatch(value)) {
      return "Email không hợp lệ";
    }
    return null;
  }

  static String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return "Vui lòng nhập mật khẩu";
    }
    if (value.length < 6) {
      return "Mật khẩu >= 6 ký tự";
    }
    return null;
  }
}