// Package imports:
import 'package:intl/intl.dart';

class FormatDateHelper {
  static String formatDate(String dateTime) {
    final DateTime date = DateTime.parse(dateTime).toUtc();
    final DateTime dateLocal = date.add(const Duration(hours: 7));

    final DateFormat formatter = DateFormat('dd MMMM yyyy', 'id_ID');

    return formatter.format(dateLocal);
  }

  static String formatDateTime(String dateTime) {
    final DateTime date = DateTime.parse(dateTime).toUtc();
    final DateTime dateLocal = date.add(const Duration(hours: 7));

    final DateFormat formatter = DateFormat('dd MMMM yyyy HH:mm', 'id_ID');

    return formatter.format(dateLocal);
  }

  static String formatTimestampDate(String timestamp) {
    DateTime dateTime = DateTime(
      int.parse(timestamp.substring(0, 4)),
      int.parse(timestamp.substring(4, 6)),
      int.parse(timestamp.substring(6, 8)),
      int.parse(timestamp.substring(8, 10)),
      int.parse(timestamp.substring(10, 12)),
      int.parse(timestamp.substring(12, 14)),
    );

    DateFormat formatter = DateFormat('EEEE, dd MMMM yyyy', 'id_ID');
    String formattedDate = formatter.format(dateTime);

    return formattedDate;
  }

  static String formatTimestampDateTime(String timestamp) {
    DateTime dateTime = DateTime(
      int.parse(timestamp.substring(0, 4)),
      int.parse(timestamp.substring(4, 6)),
      int.parse(timestamp.substring(6, 8)),
      int.parse(timestamp.substring(8, 10)),
      int.parse(timestamp.substring(10, 12)),
      int.parse(timestamp.substring(12, 14)),
    );

    DateFormat formatter = DateFormat('EEEE, dd MMMM yyyy, HH:mm:ss', 'id_ID');
    String formattedDate = formatter.format(dateTime);

    return formattedDate;
  }

  static String formatTimestampTime(String timestamp) {
    if (timestamp.length == 12) {
      DateTime dateTime = DateTime(
        int.parse(timestamp.substring(0, 4)),
        int.parse(timestamp.substring(4, 6)),
        int.parse(timestamp.substring(6, 8)),
        int.parse(timestamp.substring(8, 10)),
        int.parse(timestamp.substring(10, 12)),
      );

      DateFormat formatter = DateFormat('EEEE, dd MMMM yyyy, HH:mm', 'id_ID');
      String formattedDate = formatter.format(dateTime);

      return formattedDate;
    } else {
      return "Invalid timestamp";
    }
  }
}
