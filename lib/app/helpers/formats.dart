class HDFormart {
  static String dateToDDMMYYYY(String value) {
    final year = value.substring(0, 4);
    final month = value.substring(5, 7);
    final day = value.substring(8, 10);
    return "$day/$month/$year";
  }

  static String dateToMMYYYY(String value) {
    final year = value.substring(0, 3);
    final month = value.substring(5, 6);
    return "$month/$year";
  }

  static String dateToMMYY(String value) {
    final year = value.substring(2, 3);
    final month = value.substring(5, 6);
    return "$month/$year";
  }
}
