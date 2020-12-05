

class Utils {

  static String dateFormat(DateTime dateTime){
    return "${dateTime.year}-${dateTime.month.toString().padLeft(2,'0')}-${dateTime.day.toString().padLeft(2,'0')}";
  }
}