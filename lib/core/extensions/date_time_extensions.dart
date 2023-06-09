extension DateTimeExt on DateTime {
  String get toFormattedString {
    final formattedDate = '$day/$month/$year';
    return formattedDate;
  }
}
