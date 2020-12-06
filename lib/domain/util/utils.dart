

import 'package:intl/intl.dart';

class Utils {

  static String dateFormat(DateTime dateTime){
    return "${dateTime.year}-${dateTime.month.toString().padLeft(2,'0')}-${dateTime.day.toString().padLeft(2,'0')}";
  }

  static String toAppDate(String date) {
    final parsedDate =  DateTime.tryParse(date);
    return parsedDate != null ? DateFormat('dd MMM').format(parsedDate) : "";
  }

  static String toAppTime(String date) {
    final parsedDate =  DateTime.tryParse(date);
    return parsedDate != null ? DateFormat('HH:mm').format(parsedDate) : "";
  }
}