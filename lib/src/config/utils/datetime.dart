import 'package:dailyforecast/src/config/constants/calendars.dart';

class DateTimeUtils {
  // @desc : return month name
  String getMonthName(int month) => months[month - 1];

  // @desc : return dayOfWeek name
  String getDayOfWeekName(int day) => days[day - 1];

  // @desc : format give datetime to [day month, dayOfWeek] format
  String formatDate(DateTime date) {
    String day = date.day.toString();
    String month = getMonthName(date.month);
    String dayOfWeek = getDayOfWeekName(date.weekday);
    return '$day $month, $dayOfWeek';
  }

  // @desc : Converts 24hr string datetime format to 12hr format
  // @return : Formatted time in 12hr format [10:00 AM || 10:00 PM]
  String convertTo12hrFormat(String? dateTime) {
    if (dateTime == null) return "";
    final dt = DateTime.tryParse(dateTime);
    if (dt == null) return ""; // Handle invalid DateTime
    final period = dt.hour >= 12 ? "PM" : "AM";
    final hour = dt.hour % 12 == 0 ? 12 : dt.hour % 12;
    final formattedTime = "${hour.toString().padLeft(2, '0')}:${dt.minute.toString().padLeft(2, '0')} $period";
    return formattedTime;
  }

  // @desc : Formats given datetime string to [10 Aug, Thursday \n 10:00 AM || 10:00 PM ] format
  // @param : If true, checks for current time conditions
  // @return : Formatted datetime string
  String formatDateTime(String? dateTime, {bool check = false}) {
    if (dateTime == null) return "";
    final now = DateTime.now();
    final dt = DateTime.tryParse(dateTime);
    if (dt == null) return ""; // Handle invalid DateTime
    final formattedTime = convertTo12hrFormat(dateTime);
    if (check && now.isAfter(dt)) return "";
    if (now.year == dt.year && now.month == dt.month && now.day == dt.day) {
      return "Today\n$formattedTime";
    }
    final formattedDate = formatDate(dt); // Assuming there's a separate function formatDate to format the date
    return "$formattedDate\n$formattedTime";
  }
}
