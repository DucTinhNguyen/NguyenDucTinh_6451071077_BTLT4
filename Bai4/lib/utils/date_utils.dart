class DateUtilsCustom {
  static bool isPastDate(DateTime date) {
    DateTime now = DateTime.now();
    DateTime today = DateTime(now.year, now.month, now.day);

    return date.isBefore(today);
  }

  static String formatDate(DateTime date) {
    return "${date.day}/${date.month}/${date.year}";
  }
}